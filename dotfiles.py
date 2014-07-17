# TODO

import os
import re
import shutil
import sys

def walkLevel(someDir, level=1):
    someDir = someDir.rstrip(os.path.sep)
    assert os.path.isdir(someDir)
    numSep = someDir.count(os.path.sep)
    for root, dirs, files in os.walk(someDir):
        yield root, dirs, files
        numSepThis = root.count(os.path.sep)
        if numSep + level <= numSepThis:
            del dirs[:]

if __name__ == "__main__":
    dotfileRegex = re.compile("^[^.].*$")
    rootDir = sys.argv[1]
    destOS = sys.argv[2]
    for root, dirs, files in walkLevel(rootDir, 1):
        for fname in files:
            if re.match(dotfileRegex, str(fname)):
                print fname
                #shutil.copyfile(rootDir + "/" + str(fname), rootDir + "/dotfiles/" + destOS + "/" + str(fname))
