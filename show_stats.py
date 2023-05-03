#!/usr/bin/env /usr/bin/python3

import os
import sys


if len(sys.argv) < 2: 
    exit(65)

with open(os.path.join(os.getcwd(), sys.argv[1]), 'r') as infile:
    print("Alive hosts:", '; '.join([i.strip() for i in infile.readlines()]))
