#!/usr/bin/python
import re

# regular expression
mystring="Hello, Wordl"
re.sub('dl$', 'ld', mystring)   # substitution
'tea for too'.replace('too', 'two') # string method for simple case

re.findall(pattern='<html>', string=html, flags=re.S)
# available flags
# re.IGNORECASE     === re.I
# re.MULTILINE      === re.M
# re.DOTALL         === re.S    dot match all chars, including '\n'
# re.UNICODE        === re.U
# re.DEBUT
# re.LOCALE         === re.L
