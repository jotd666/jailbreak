from shared import *

# post-conversion automatic patches, allowing not to change the asm file by hand



input_dict = {"system_3300":"read_system_inputs",
"in0_3301":"read_inputs_1",
"in1_3302":"read_inputs_2",
"speech_4000":"set_speech_status",
"speech_6000":"get_speech_status",
"scroll_dir_2042":"set_scroll_direction",
"audio_register_w_1500":"sound_start",

}



# various dirty but at least automatic patches applying on the specific track and field code
with open(source_dir / "conv.s") as f:
    lines = list(f)
    i = 0

    while i < len(lines):
        line = lines[i]
        if " = " in line:
            equates.append(line)
            line = ""

        # remove code for rom checks, watchdog, ...
        for p in ("[rom_check_code]","coin_","watchdog_3300"):
            line = remove_code(p,lines,i)

        # pre-add video_address tag if we find a store instruction to an explicit 3000-3FFF address
        if store_to_video.search(line):
            line = line.rstrip() + " [video_address]\n"

        if "[video_address" in line:
            # give me the original instruction
            line = line.replace("_ADDRESS","_UNCHECKED_ADDRESS")
            # if it's a write, insert a "VIDEO_DIRTY" macro after the write
            for j in range(i+1,len(lines)):
                next_line = lines[j]
                if "[...]" not in next_line:
                    break
                if ",(a0)" in next_line or "clr" in next_line or "MOVE_W_FROM_REG" in next_line:
                    if any(x in next_line for x in ["address_word","MOVE_W_FROM_REG"]):
                        lines[j] = next_line+"\tVIDEO_WORD_DIRTY | [...]\n"
                    else:
                        lines[j] = next_line+"\tVIDEO_BYTE_DIRTY | [...]\n"
                    break


        line = re.sub(tablere,subt,line)

        if "[$81e0:" in line:
            line = "\tjmp\tstart_8000   | skip all self-tests\n"
        if "dsw1_" in line and "lda" in line:
            line = change_instruction("jbsr\tosd_read_dsw_1",lines,i)
        elif "dsw2_" in line and "lda" in line:
            line = change_instruction("jbsr\tosd_read_dsw_2",lines,i)
        elif "dsw3_" in line and "lda" in line:
            line = change_instruction("jbsr\tosd_read_dsw_3",lines,i)

        elif "[$835d" in line or "[$8364" in line or "[$836b" in line:
            # protect abcd X flag
            line = "\tPUSH_SR\n"+line
        elif "[$836b" in line or "[$8368" in line:
            # pop sr (protect abcd)
            lines[i+2] = "\tPOP_SR\n"+lines[i+2]
        elif "[$836d" in line:
            line = "\tPOP_SR\n"+line
            lines[i+1] = ""
        elif "[$8090:" in line:
            line = change_instruction("pea\tevent_loop_poll_8073",lines,i)
        elif "[$8094:" in line:
            line = remove_instruction(lines,i)
        elif "[$a790" in line:
            line = "\tPUSH_SR\n"+line
            lines[i+2] = "\tPOP_SR\n"+lines[i+2]
            lines[i+3] = ""
        elif "[$b0c9" in line:
            line = change_instruction("INDIRECT_JMP_U",lines,i)

        elif any(x in line for x in ["[$951f","[$9538","[$954b","[$955e","[$9571"]):
            # functions return condition code (C) set
            lines[i+1] = ""
        elif any(x in line for x in ["[$a62b","[$a666"]):
            line = lines[i+1]
            lines[i+1] = lines[i]
            lines[i+3] = ""  # remove error
            i += 2

        if "multiply_ab" in line and "MAKE_D" in lines[i+1]:
            lines[i+1] = ""
##        if "tfr" in line and "POP_SR" in lines[i+1] and "PUSH_SR" in lines[i-1]:
##            # we don't need to save SR in this game when a TFR is done
##            lines[i-1] = ""
##            lines[i+1] = ""
##        if "rox" in line and "POP_SR" in lines[i-1] and "PUSH_SR" in lines[i-3]:
##            # we don't need to save SR as roxx uses X flag
##            lines[i-3] = ""
##            lines[i-1] = ""




##        elif "flip_screen_set_1080" in line:
##            line = remove_instruction(lines,i)
##            remove_continuing_lines(lines,i)
##
##        elif "irq_mask_w_1487" in line:
##            # check next line
##            next_line = lines[i+1]
##            if "clr" in next_line:
##                line = change_instruction("jbsr\tosd_disable_interrupts",lines,i)
##            else:
##                line = change_instruction("jbsr\tosd_enable_interrupts",lines,i)
##                lines[i-1] = remove_instruction(lines,i-1)

        if "GET_ADDRESS" in line:
            val = line.split()[1]
            osd_call = input_dict.get(val)
            if osd_call is not None:
                if osd_call:
                    line = change_instruction(f"jbsr\tosd_{osd_call}",lines,i)
                else:
                    line = remove_instruction(lines,i)
                lines[i+1] = remove_instruction(lines,i+1)


        elif "unsupported instruction rti" in line:
            line = change_instruction("rts",lines,i)
##        elif "unsupported instruction andcc" in line:
##            line = change_instruction("CLR_XC_FLAGS",lines,i)
        elif "jump_table" in line:
            m = jmpre.search(line)
            if m:
                ireg = m.group(2).upper()  # A or B
                inst = m.group(1).upper()
                reg = {"x":"A2","y":"A3","u":"A4"}[m.group(3)]
                rest = re.sub(".*\"","",line)
                line = f"\t{inst}_{ireg}_INDEXED\t{reg}{rest}"
        if "ERROR" in line:
            print(line,end="")
        lines[i] = line
        i+=1




with open(source_dir / "data.inc","w") as fw:
    fw.writelines(equates)

with open(source_dir / "jailbreak.68k","w") as fw:
    fw.write("""\t*.include "jailbreak.inc"
.include "data.inc"
\t.global\tirq_8a57
\t.global\tirq_b05d
\t.global\treset_81a6
""")
    fw.writelines(lines)