#!/usr/bin/env  python3
# -*- coding: utf-8 -*-

[(x, y) for x in [1, 2, 3] for y in [3, 1, 4] if x != y]

# which equivalent to:
combs = []
for x in [1, 2, 3]:
    for y in [3, 1, 4]:
        if x != y:
            combs.append[(x, y)]
