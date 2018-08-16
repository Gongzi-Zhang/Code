#!/usr/bin/env python3.5
# -*- coding: utf-8 -*-
# declare encoding, it must be the first line or second line after "shebang" line

##########################  intepreter  ##########################
# class, everything is an object, and therefore has a class (type)
object.__class__
# the dir() built-in prints the members fo a module or class.
dir(math)
help(obj.func)  # help for the func of object

# in order to know the type of a variable, use type()
type(math.asin) # <type 'builtin_function_or_method'>
type(math.pi)   # <type 'flaot'>

## while in script, we can test type by the following ways:
if type(L) == type([]): print("L is list")
if type(L) == list: print("L is list")
if isinstance(L, list): print ("L is list")     # prefer

#-- 

##########################  Math  ##########################
# floor division
17 / 3  # 5.666666667;  Division always returns a float
17 // 3 # 5; floor division, discarding any fractional result
# complex numbers
3+5j || 3+5J


try:
    import cookielib    # python2
except:
    import http.cookiejar as cookielib
