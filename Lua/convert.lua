--> Any numeric operation applied to a string tries to convert the string to a number <--
print("10" + 1)		--> 11
print("10 + 1")		--> 10 + 1
print("-5.3e-10"*"2")	--> -1.06e-9
print('hello' + 1)	--> ERROR (cannot convert 'hello')

--> Conversely, whereever Lua finds a number when it expects a string, it converts the number to a string <--
print(10 .. 20)		--> 1020
