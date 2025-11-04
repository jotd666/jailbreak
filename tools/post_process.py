from shared import *

# post-conversion automatic patches, allowing not to change the asm file by hand



input_dict = {"system_3300":"read_system_inputs",
"in0_3301":"read_inputs_1",
"in1_3302":"read_inputs_2",
"speech_4000":"set_speech_status",
"speech_6000":"get_speech_status",
"scroll_dir_2042":"set_scroll_direction",
"dsw2_3100":"",  # so called sound registers... there's no sound CPU it seems
"dsw3_3200":"",  # so we have to patch at a higher level

}

nb_cases_dict = {0x8096:6,
0x86b1:9,
0x8bfe:4,
0x8c06:7,
0x8d26:5,
0X8e0b:9,
0X8e43:11,
0x8f5f:5,
0x973a:6,
0x9792:4,0x97d8:3,
0x9bb2:4,
0xa0d2:32,
0xa9ea:5,
0xa27e:4,
0xa4d6:38,
0xa4ee:3,
0xa9e1:5,
0xab50:9,
0xac1d:12,
0xad5e:4,
0xb0fc:25,
0Xb297:8



}

def get_line_address(line):
    try:
        toks = line.split("|")
        address = toks[1].strip(" [$").split(":")[0]
        return int(address,16)
    except (ValueError,IndexError):
        return None


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

        if "road_row_counter_0830" in line and ":" in line:
            # special case: not really a video address
            line = line.replace("_ADDRESS","_UNCHECKED_ADDRESS")

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


        address = get_line_address(line)

        if address == 0x81e0:
            line = "\tjmp\tstart_8000   | skip all self-tests\n"
        if "dsw1_" in line and "lda" in line:
            line = change_instruction("jbsr\tosd_read_dsw_1",lines,i)
        elif "dsw2_" in line and "lda" in line:
            line = change_instruction("jbsr\tosd_read_dsw_2",lines,i)
        elif "dsw3_" in line and "lda" in line:
            line = change_instruction("jbsr\tosd_read_dsw_3",lines,i)
        elif address == 0x93B7:
            # sound
            line = change_instruction("jra\tosd_sound_start",lines,i)

        elif address in (0x835d,0x8364,0x836b):
            # protect abcd X flag
            line = "\tPUSH_SR\n"+line
        elif address in (0x836b,0x8368,0x8361):
            # pop sr (protect abcd)
            lines[i+2] = "\tPOP_SR\n"+lines[i+2]
        elif address == 0x836d:
            line = "\tPOP_SR\n"+line
            lines[i+1] = remove_error(lines[i+1])
        elif address == 0x8090:
            line = change_instruction("pea\tevent_loop_poll_8073",lines,i)
        elif address == 0x8094:
            line = remove_instruction(lines,i)
        elif address == 0xa790:
            line = "\tPUSH_SR\n"+line
            lines[i+2] = "\tPOP_SR\n"+lines[i+2]
            lines[i+3] = remove_error(lines[i+3])
        elif address == 0xb0c9:
            line = change_instruction("INDIRECT_JMP_U",lines,i)
        elif address == 0xb116:
            line = remove_instruction(lines,i)
        elif address in {0x951f,0x9538,0x954b,0x955e,0x9571}:
            # functions return condition code (C) set
            lines[i+1] = remove_error(lines[i+1])
        elif address in {0xa62e,0xa669}:
            # swap instructions so sub+jcc are contiguous
            # else addq #1,d0 (INC) changes carry on 68000 (not on 6809)
            lines[i-1],lines[i-2] = lines[i-2],lines[i-1]
            lines[i+1] = remove_error(lines[i+1])
        elif address == 0x91ed:
            line = f"\ttst.b\tinfinite_lives_flag\n\tjne\t0f\n{line}0:\n"
        elif address == 0x9b57:
            line += f"\ttst.b\tinvincible_flag\n\tjeq\t0f\n\trts  | no enemy collision\n0:\n"
        elif address == 0x9a7e:
            line += f"\ttst.b\tinvincible_flag\n\tjne\tl_9a84\n"
        elif address == 0x9aec:
            line += f"\ttst.b\tinvincible_flag\n\tjeq\t0f\n\trts  | no enemy collision\n0:\n"
        elif address == 0xad46:
            # replace d2/d4 restore by double address pop no register change
            # (else it puts non-zero value in d2 MSB!)
            line = change_instruction("addq\t#8,a7",lines,i)
        elif address in {0xaa42,0xad77,0xa57e,0Xa513}:   # ,0xa395,0xa3ce,,,
            # replace d2 restore by address pop no register change
            # (else it puts non-zero value in d2 MSB!)
            line = change_instruction("addq\t#4,a7",lines,i)
        if "multiply_ab" in line and "MAKE_D" in lines[i+1]:
            lines[i+1] = ""


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
                nb_cases = nb_cases_dict[address]
                line = f"\t{inst}_{ireg}_INDEXED\t{reg},{nb_cases}{rest}"
        if "ERROR" in line:
            print(line,end="")
        lines[i] = line
        i+=1




with open(source_dir / "data.inc","w") as fw:
    fw.writelines(equates)

with open(source_dir / "jailbreak.68k","w") as fw:
    fw.write("""\t*.include "jailbreak.inc"
\t.include "data.inc"
\t.global\tirq_8a57
\t.global\tirq_b05d
\t.global\treset_81a6
""")
    fw.writelines(lines)