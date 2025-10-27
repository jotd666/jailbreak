from PIL import Image,ImageOps
import os,sys,bitplanelib,subprocess,json,pathlib

this_dir = pathlib.Path(__file__).absolute().parent

data_dir = this_dir / ".." / ".."
src_dir = this_dir / ".." / ".." / "src" / "amiga"

sheets_path = this_dir / ".." / "sheets"
dump_dir = this_dir / "dumps"

used_sprite_cluts_file = this_dir / "used_sprite_cluts.json"
used_tile_cluts_file = this_dir / "used_tile_cluts.json"
used_graphics_dir = this_dir / "used_graphics"

def palette_pad(palette,pad_nb):
    palette += (pad_nb-len(palette)) * [(0x10,0x20,0x30)]

def ensure_empty(d):
    if os.path.exists(d):
        for f in os.listdir(d):
            x = os.path.join(d,f)
            if os.path.isfile(x):
                os.remove(x)
    else:
        os.makedirs(d)

def ensure_exists(d):
    if os.path.exists(d):
        pass
    else:
        os.makedirs(d)

sr2 = lambda a,b : set(range(a,b,2))

player_sprite_pairs = ()
player_single_sprites = {}

group_sprite_pairs = (
sr2(0x1F0,0x200) | sr2(0x1A0,0x1B0) | sr2(0x1BA,0x1C0) |
{0x173,0xA4,0xB0,0xB4,0X1D0,0x1D2,0xD8,0x126,0X183,0x156,0xA6,0x17A,0x17E,0x122,0x124,0x193} |
sr2(0x1B0,0x1B8) | sr2(0X186,0x18C)
)

def set_names(rval,start,end,name):
    rval.update({i:name for i in range(start,end)})

def get_sprite_names():

    rval = dict()
    set_names(rval,0x1F0,0x200,"police_car")
    rval[0x181] = "police_car"
    set_names(rval,0,0x20,"policeman")
    set_names(rval,0X122,0x125,"policeman")
    set_names(rval,0x80,0xEF,"convict")
    set_names(rval,0x1A8,0x1B0,"convict")
    set_names(rval,0x16E,0x170,"child")
    set_names(rval,0x160,0x162,"worker")


    return rval

def get_mirror_sprites():
    """ return the index of the sprites that need mirroring
"""
    rval = set(range(0,0x200))
    return rval

alphanum_tile_codes = set(range(0,10)) | set(range(65-48,65+27-48))   # wrong

if __name__ == "__main__":
    raise Exception("no main!")