#!/usr/bin/python

# We have seen that sequence types like Lists, Tuples and Strings are 
#+ indexed by an integer. Dictionaries on the other hand are indexed 
#+ by a key, which can be any immutable value. Dictionaries are 
#+ created by placing a comma separated list of key:value pairs 
#+ between braces.
phone_nos = {"home"  : "988988988", 
            "office" : "0803332222", 
            "integer": 25}
print phone_nos[0]  # KeyError: 0
print phone_nos['home'] # 988988988

# Dictionaries can also be created from lists of tuples.
myinfo = [("name","ershaad"), ("phone","98989898")]
mydict = dict(myinfo)
print mydict    # {’phone’: ’98989898’, ’name’: ’ershaad’}
print mydict["name"]    # ershaad


# unpack
for key in (**phone_nos):
    print (key, phone_nos[key])

# looping techniques
for k, v in phone_nos.items():
    print(k, v)
