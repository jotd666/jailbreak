import os,pathlib,shutil,json

from shared import *




def merge(used_name,nb_items,forced_cluts=None):
    merged_path_file = used_graphics_dir


    # merge sprites with existing file + moves from level 1
    used_dump = data_dir / used_name

    with open(used_dump,"rb") as f:
        new_contents = f.read()


    old_used = merged_path_file / used_name
    if old_used.exists():
        with open(old_used,"rb") as f:
            old_contents = f.read()
    else:
        old_contents = bytes(16*nb_items)

    contents = bytearray([a|b for a,b in zip(new_contents,old_contents)])

    if forced_cluts:
        for tile,cluts in forced_cluts.items():
            base_idx = (tile*16)
            for clut in cluts:
                contents[clut+base_idx] = 1

    if used_name == "used_sprites":
##        # remove fake clut/tile combination
##        for tile in range(0,0x200):
##
##            contents[tile*16+0xA] = 0
####            if tile not in {0x113,0x117}:
####                contents[tile*16+0x9] = 0
        for tile in {0x1C9,0x1D1,0x1D0}:
                contents[tile*16+0xF] = 1
        for tile in {0x1c6
,0x80
,0x81
,0x86
,0xc6
,0x4a
,0x75
,0x128
,0x13e
,0x16b
,0x3e
,0x55
,0x6b
,0xf0
,0x150
,0x151
,0x152
,0x161}:
            contents[tile*16+0xe] = 0

    if old_contents == contents:
        print(f"Nothing new for {used_name}")
    else:
        for i,(a,b) in enumerate(zip(old_contents,contents)):
            if a!=b:
                code,clut = divmod(i,16)
                status = "New" if b else "Deleted"
                print(f"{used_name}: {status}: code={code:02x}, clut={clut:02x}")
        with open(merged_path_file / used_name,"wb") as f:
            f.write(contents)

merge("used_sprites",512)
#merge("used_tiles",0x400)
