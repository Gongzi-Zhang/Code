#!/usr/bin/env python

import os

# delete all '.pyc' files in working dir.
for root, dirs, files in os.walk('.'):
    for filename in files:
        ext = os.path.splitext(filename)[1]
        if ext == '.pyc':
            os.unlink(os.path.join(root, filename))
