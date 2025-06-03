from datetime import datetime
from zipfile import ZipFile, ZipInfo
from operator import attrgetter

from pathlib import Path

def process_filename(filename: Path) -> str:
    uml = {
        'Ä': "Ae",
        'Ö': "Oe",
        'Ü': "Ue",
        'ä': "ae",
        'ö': "oe",
        'ü': "ue",
        'ß': "sz",
        ' ': '_'
    }

    data_file_name = str(filename.absolute().as_posix())
    for c, sub in uml.items():
        data_file_name = data_file_name.replace(c, sub)
    return data_file_name


def pdate(dt: datetime) -> str:
    return dt.strftime("%d.%m.%Y")


# Copied and slightly modified from
# https://github.com/python/cpython/blob/659eb048cc9cac73c46349eb29845bc5cd630f09/Lib/zipfile.py#L1717

def _remove_member(zip_archive: ZipFile, member):
    # get a sorted filelist by header offset, in case the dir order
    # doesn't match the actual entry order
    fp = zip_archive.fp
    entry_offset = 0
    filelist = sorted(zip_archive.filelist, key=attrgetter('header_offset'))
    for i in range(len(filelist)):
        info = filelist[i]
        # find the target member
        if info.header_offset < member.header_offset:
            continue

        # get the total size of the entry
        entry_size = None
        if i == len(filelist) - 1:
            entry_size = zip_archive.start_dir - info.header_offset
        else:
            entry_size = filelist[i + 1].header_offset - info.header_offset

        # found the member, set the entry offset
        if member == info:
            entry_offset = entry_size
            continue

        # Move entry
        # read the actual entry data
        fp.seek(info.header_offset)
        entry_data = fp.read(entry_size)

        # update the header
        info.header_offset -= entry_offset

        # write the entry to the new position
        fp.seek(info.header_offset)
        fp.write(entry_data)
        fp.flush()

    # update state
    zip_archive.start_dir -= entry_offset
    zip_archive.filelist.remove(member)
    del zip_archive.NameToInfo[member.filename]
    zip_archive._didModify = True

    # seek to the start of the central dir
    fp.seek(zip_archive.start_dir)


def remove_zip_file(zip_archive: ZipFile, member):
    """Remove a file from the archive. The archive must be open with mode 'a'"""

    if zip_archive.mode != 'a':
        raise RuntimeError("remove() requires mode 'a'")
    if not zip_archive.fp:
        raise ValueError(
            "Attempt to write to ZIP archive that was already closed")
    if zip_archive._writing:
        raise ValueError(
            "Can't write to ZIP archive while an open writing handle exists."
        )

    # Make sure we have an info object
    if isinstance(member, ZipInfo):
        # 'member' is already an info object
        zinfo = member
    else:
        # get the info object
        zinfo = zip_archive.getinfo(member)

    return _remove_member(zip_archive, zinfo)
