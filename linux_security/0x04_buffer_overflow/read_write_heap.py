#!/usr/bin/python3
"""Read and write a string inside the heap of a running process."""

import sys


def error():
    """Print usage error and exit."""
    print("Usage: {} pid search_string replace_string".format(sys.argv[0]))
    sys.exit(1)


def get_heap_range(pid):
    """Return the start and end addresses of the heap."""
    maps_path = "/proc/{}/maps".format(pid)

    with open(maps_path, "r") as maps_file:
        for line in maps_file:
            if "[heap]" in line:
                addr = line.split(" ")[0]
                start, end = addr.split("-")
                return int(start, 16), int(end, 16)

    return None, None


def main():
    """Find a string in the heap of a process and replace it."""
    if len(sys.argv) != 4:
        error()

    pid = sys.argv[1]
    search_string = sys.argv[2]
    replace_string = sys.argv[3]

    if not pid.isdigit():
        error()

    if len(replace_string) > len(search_string):
        print("Error: replace_string is longer than search_string")
        sys.exit(1)

    start, end = get_heap_range(pid)
    if start is None or end is None:
        print("Error: unable to locate heap")
        sys.exit(1)

    mem_path = "/proc/{}/mem".format(pid)

    try:
        with open(mem_path, "rb+") as mem_file:
            mem_file.seek(start)
            heap = mem_file.read(end - start)

            search_bytes = search_string.encode("ascii")
            replace_bytes = replace_string.encode("ascii")
            replace_bytes += b"\x00" * (len(search_bytes) - len(replace_bytes))

            index = heap.find(search_bytes)
            if index == -1:
                print("Error: string not found")
                sys.exit(1)

            address = start + index
            mem_file.seek(address)
            mem_file.write(replace_bytes)

            print("String found at 0x{:x}".format(address))
            print("Written: {}".format(replace_string))

    except IOError as exc:
        print("Error: {}".format(exc))
        sys.exit(1)


if __name__ == "__main__":
    main()
