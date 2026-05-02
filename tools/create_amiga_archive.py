import subprocess,os,glob,shutil,pathlib

progdir = pathlib.Path(os.path.abspath(os.path.join(os.path.dirname(__file__),os.pardir)))

gamename = "jail_break"
# JOTD path for cranker, adapt to whatever your path is :)
os.environ["PATH"] += os.pathsep+r"K:\progs\cli"

cmd_prefix = ["make","-f",str(progdir / "makefile.am")]

subprocess.check_call(cmd_prefix+["clean"],cwd=progdir / "src")

subprocess.check_call(cmd_prefix+["RELEASE_BUILD=1"],cwd=progdir / "src")
# create archive

outdir = progdir / f"{gamename}_HD"

if os.path.exists(outdir):
    shutil.rmtree(outdir)

outdir.mkdir(exist_ok=True)

for file in ["readme.md",f"{gamename}_aga.slave"]:
    shutil.copy(progdir / file,outdir)


shutil.copy(progdir / "assets" / "amiga" / "JailBreak.info",outdir)



exename = gamename+"_aga"
subprocess.run(["cranker_windows.exe","-f",str(progdir / exename),"-o",f"{progdir / exename}.rnc"],check=True,stdout=subprocess.DEVNULL)

shutil.copy(progdir / exename,outdir / exename)
subprocess.run(cmd_prefix+["clean"],cwd=os.path.join(progdir,"src"))
