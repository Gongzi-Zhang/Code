#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# declare encoding, it must be the first line or second line after "shebang" line


##########################  Math  ##########################
# floor division
17 / 3  # 5.666666667;  Division always returns a float
17 // 3 # 5; floor division, discarding any fractional result
# complex numbers
3+5j || 3+5J



##########################  String  ##########################
# raw string
print('Hello \nWorld')
### Hello
### World
print(r'Hello \nWrold')
### Hello \nWrold

# long string
print("""\
        This is a very long string
        End of lines are automatically included in the string
        To prevent this, add a \ at the end of the line\
        no new line here.
""")
print('''\
        This is a very long string
        End of lines are automatically included in the string
        To prevent this, add a \ at the end of the line\
        no new line here.
''')

# string index
word = 'Python'
word[0]     # P
word[-1]    # n



##########################  Functions  ##########################
def func(kind, *arguments, **keywords):
    print("arguments is a tuple (positional), and keywrods is a dictionary")
    for arg in arguments:
        print(arg)
    print("-" * 40)
    for kw in keywords:
        print(kw, ":", keywords[kw])


# range() returns an iterator
# default start: 0
# default step:  1
range(5)        # 0 1 2 3 4
range(5, 10)    # 5 6 7 8 9
range(10, 5)    # error
range(10, 5, -1)# 10 9 8 7 6
range(0, 10, 3) # 0 3 6 9



##########################  Compatibility  ##########################
try:
    import cookielib    # python2
except:
    import http.cookiejar as cookielib


