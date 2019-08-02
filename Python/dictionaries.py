#!/usr/bin/python

'''
Dictionaries are indexed by a key, which can be any 'immutable' value
'''
phone_nos = {"home"  : "988988988", 
            "office" : "0803332222", 
            "integer": 25}
print phone_nos[0]  
# KeyError: 0
print phone_nos['home'] 
# 988988988

# Dictionaries can also be created from lists of tuples.
myinfo = [("name","ershaad"), ("phone","98989898")]
mydict = dict(myinfo)
print mydict    
# {'phone': '98989898', 'name': 'ershaad'}
print mydict["name"]    
# ershaad

# dict comprehensions
{x: x**2 for x in (2, 4, 6)}
# {2: 4, 4: 16, 6: 36}

# keywords arguments
dict(sape=4139, guido=4127, jack=4092)
# {'sape': 4139, 'guido': 4127, 'jack': 4092}

# unpack
for key in (**phone_nos):
    print (key, phone_nos[key])

# looping techniques: tiems
for k, v in phone_nos.items():
    print(k, v)
# enumerate()
for i, v in enumerate(['tic', 'tac', 'toe'])
    print(i, v)
# 0 tic
# 1 tac
# 2 toe
