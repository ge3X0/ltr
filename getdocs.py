import re
from zipfile import ZipFile
from argparse import ArgumentParser
from pathlib import Path
from datetime import datetime, timedelta
from dataclasses import dataclass
from operator import attrgetter
import shutil


@dataclass
class Letter:
    path: Path
    due_date: datetime


def extract_text(block: str) -> str:
    return ''.join([
        m[1] for m in re.finditer(r"<w:t(?:\s[^>]+?)?>(.+?)</w:t>", block)])


def extract_tc_text(text: str) -> list[str]:
    return [extract_text(m[1])
            for m in re.finditer(r"<w:tc(?:\s[^>]+?)?>(.+?)</w:tc>", text)]


def mark_due(dt: datetime) -> str:
    return "\x1b[1;38;5;124m" if datetime.now() - dt >= timedelta(days=3) else ""


if __name__ == "__main__":
    arg_parser = ArgumentParser(
        prog="getdocs",
        description="Get names and dates of .docx files under a given path"
    )


    arg_parser.add_argument("path", type=Path,
        help="Path to the directory to search for .docx files")

    args = arg_parser.parse_args()

    filepath: Path = args.path

    if not filepath.exists():
        exit(1)
    
    if not filepath.is_dir():
        exit(1)


    data_set: dict[str, list[Letter]] = {}

    for docx_file in filepath.glob("*.docx"):
        with ZipFile(docx_file) as archive:
            with archive.open("word/document.xml") as file:
                text = file.read().decode()

        cells = extract_tc_text(text)

        doc_date = datetime.now()
        if m := re.search(r"\d\d\.\d\d\.\d\d\d\d", cells[9]):
            doc_date = datetime.strptime(m[0], "%d.%m.%Y")

        data_set.setdefault(cells[18], []).append(Letter(docx_file, doc_date))


    move_list: list[Path] = []

    for doc_name, letters in data_set.items():
        print(f"\x1b[1;38;5;14m{doc_name.strip()}\x1b[0m:")

        for letter in sorted(letters, key=attrgetter('due_date')):
            red_mark = mark_due(letter.due_date)
            if red_mark:
                move_list.append(letter.path)

            print(f"\t{red_mark}{letter.due_date.strftime('%d.%m.%Y')} {letter.path.name}\x1b[0m")

        print("\n--------------------------------\n")

    if input("Move marked (red) files into ./Archiv? (y/n) ").lower() != 'y':
        exit(0)

    dest_path = filepath / "Archiv/"
    dest_path.mkdir(exist_ok=True)

    for file in move_list:
        print(f"\tmoving {file.name}...")
        shutil.move(file, dest_path)

    print(f"\n{len(move_list)} Files have been moved")


