import os
import string
import pathlib

def repair_filenames():
    path = pathlib.Path(".") #assigns current directory as base
    for folder in path.iterdir():
        if folder.is_dir():
            for file in folder.iterdir():
                if file.is_file():
                    if file.name.lower() == folder.name.lower() + ".yy":
                        old_name = file.name
                        new_name = folder.name + ".yy"
                        print("RENAMING ", old_name, "TO ", new_name)
                        file.rename(path / folder.name / new_name)
if __name__ == "__main__":
    repair_filenames()