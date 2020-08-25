from sys import argv
import re

def make_regex(c):
    return f'[^{c}]'

DICT = '/usr/share/dict/american-english-large';
c = argv[1]
middle = c[0]
regex = make_regex(c)

with open(DICT) as f:
    for line in f:
        line = line.rstrip()
        if len(line) < 4 or middle not in line or re.search(regex, line):
            continue
        print(line)
