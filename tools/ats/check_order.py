#!/usr/bin/env python3
"""Fail unless pdftotext shows the name, Summary, Skills, then Experience."""

import sys

NEEDLES = ("Alireza Jafartash", "Summary", "Skills", "Experience")


def main() -> int:
    text = sys.stdin.read()
    cursor = 0
    for needle in NEEDLES:
        found = text.find(needle, cursor)
        if found < 0:
            print(f"reading order: missing {needle!r} after position {cursor}", file=sys.stderr)
            return 1
        cursor = found + len(needle)
    print("reading order: " + " < ".join(NEEDLES))
    return 0


if __name__ == "__main__":
    sys.exit(main())
