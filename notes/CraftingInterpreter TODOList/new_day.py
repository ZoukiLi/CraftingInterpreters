#! /usr/bin/env python3
# -*- coding: utf-8 -*-


import os
import argparse
from typing import Optional
from datetime import datetime


def get_today_str() -> str:
    """Get today string in format MM-DD-YYYY

    Returns:
        str: today string in format MM-DD-YYYY

    """
    return datetime.today().strftime('%m-%d-%Y')


def gen_title_line(titles: list[str]) -> str:
    """Generate title line

    Args:
        titles (list[str]): list of titles

    Returns:
        str: title line

    """
    # if titles is empty, return empty string
    if not titles:
        return ''
    # if titles is length 1, return title[0]
    elif len(titles) == 1:
        return titles[0]
    # if titles is length more than 1, join with ', ' but add ' & ' before last title
    else:
        return ', '.join(titles[:-1]) + ' & ' + titles[-1]


def check_work_dir(work_dir: str) -> bool:
    """Check if current working directory is work_dir

    Args:
        work_dir (str): work directory

    Returns:
        bool: True if current working directory is work_dir, False otherwise

    """
    return os.getcwd().endswith(work_dir)


def gen_today_file(ext: str = 'typ',
                   subheading_num=3,
                   overwrite: bool = False,
                   *titles: str) -> Optional[str]:
    """Generate today file in notes/CraftingInterpreter TODOList

    Args:
        ext (str, optional): file extension. Defaults to 'typ'.
        subheading_num (int, optional): number of subheading. Defaults to 3.
        overwrite (bool, optional): whether to overwrite existing file. Defaults to False.
        titles (str, optional): file title. Defaults to ().

    Returns:
        Optional[str]: file name if success, None otherwise.

    """
    # only run when under 'CraftingInterpreter TODOList' directory
    if not check_work_dir('CraftingInterpreter TODOList'):
        print('Please run under CraftingInterpreter TODOList directory')
        return

    # generate file name
    file_name = f'{get_today_str()}.{ext}'

    # check if file already exists
    if os.path.exists(file_name) and not overwrite:
        print(f'File {file_name} already exists!')
        return file_name

    # generate file or overwrite file
    with open(file_name, 'w') as f:
        titles_name = gen_title_line(list(titles))
        titles_name_italic = f'_{titles_name}_' if titles_name else ''
        heading = f'= *{get_today_str()}* {titles_name_italic}'
        f.write(heading + '\n\n')

        subheading = '== \n\n' * subheading_num
        f.write(subheading)

        print(f'File {file_name} generated!')
    return file_name


def append_main_file(file_name, main_file: str = 'main.typ', page_break: bool = True) -> None:
    """Append '#include "file_name"' to main_file

    Args:
        file_name (str): file name
        main_file (str, optional): main file name. Defaults to 'main.typ'.
        page_break (bool, optional): whether to add '#pagebreak(weak: true)'. Defaults to True.

    """
    # only run when under 'CraftingInterpreter TODOList' directory
    if not check_work_dir('CraftingInterpreter TODOList'):
        print('Please run under CraftingInterpreter TODOList directory')
        return

    # check if line '#include "file_name"' already in main_file
    with open(main_file, 'r') as f:
        for line in f:
            if line == f'#include "{file_name}"\n':
                print(f'File {file_name} already included in {main_file}!')
                return

    # append '#include "file_name"' to main_file
    with open(main_file, 'a') as f:
        f.write('\n')
        f.write(f'#include "{file_name}"\n')
        if page_break:
            f.write('#pagebreak(weak: true)\n')
            print(f'File {file_name} appended to {main_file} with page break!')
        else:
            print(f'File {file_name} appended to {main_file}!')


def main() -> None:
    """Main function with command line arguments:

    -e, --extension: file extension
    -s, --subheading: number of subheading
    -t, --title: file titles
    -o, --overwrite: whether to overwrite existing file

    """
    parser = argparse.ArgumentParser(
        description='Generate today file in notes/CraftingInterpreter TODOList')
    parser.add_argument('-e', '--extension', type=str,
                        default='typ', help='file extension')
    parser.add_argument('-s', '--subheading', type=int,
                        default=3, help='number of subheading')
    parser.add_argument('-t', '--title', type=str,
                        nargs='+', help='file title')
    parser.add_argument('-o', '--overwrite', action='store_true',
                        help='whether to overwrite existing file')
    args = parser.parse_args()
    args.title = [] if args.title is None else args.title

    file_name = gen_today_file(args.extension, args.subheading,
                               args.overwrite, *args.title)
    if file_name:
        append_main_file(file_name)


if __name__ == '__main__':
    main()
