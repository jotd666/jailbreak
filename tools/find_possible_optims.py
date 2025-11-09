import re
src = "../src/jailbreak.68k"
nb = 0
prev_loaded = None
with open(src) as f:
    lines = list(f)

def remcomments(line):
    return re.sub("[\|\*].*","",line)

for i,line in enumerate(lines):
    line = remcomments(line)  # remove comments
    toks = line.split()
    if "GET_ADDRESS" in toks or "GET_UNCHECKED_ADDRESS" in toks:
        value = toks[1]
        if prev_loaded == value and i-prev_line < 6:
            print(f"Prev loaded: {prev_loaded} line {i+1} loaded at line {prev_line+1}")
            nb += 1
        prev_line = i
        prev_loaded = value
    if any(x in toks for x in ["rts","jmp","jra","jbsr","GET_REG_ADDRESS"]):
        prev_loaded = None
    if re.match("\w+:",line):
        prev_loaded = None

#GET_REG_ADDRESS    0x4,d3
prev_lineno = -1
prev_toks = []

for i,line in enumerate(lines):
    line = remcomments(line)  # remove comments
    toks = line.split()
    if toks and toks[0] == "GET_REG_ADDRESS":
        if prev_toks == toks:
            # 2 same GET_REG_ADDRESS. Check register
            reg = toks[1].split(",")[1]
            # now check if register is referenced between the lines
            reg_re = re.compile(fr"\b{reg}\b")
            label_found = False
            for j in range(prev_lineno+1,i):
                if reg_re.search(lines[j]):
                    break
                if re.match("\w+:",lines[j]):
                    label_found = True
            else:
                if not label_found:
                    nb += 1
                    print(f"Prev loaded: {toks}: line {i+1} ()loaded at line {prev_lineno+1})")
        prev_lineno = i
        prev_toks = toks


if nb:
    print(f"found {nb} GET_ADDRESS useless occs")
else:
    print("Nothing found")