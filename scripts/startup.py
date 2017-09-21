#!/usr/bin/python3
from glob import glob
from os import system

for script in glob("./*.py"):
    if "startup.py" in script:
        continue
    print("Running " + script + "...")
    system("python3 " + script)