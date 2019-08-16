a = 'hello \bworld'
print(a)	--> helloworld
string.len(a)	--> 12, NOT 10
s, e = string.find("hello Lua users", "Lua")	--> the start and end index
string.format("%d%s", var1, var2, ...)


--> long string <--
-->> 1: it doesn't interpret escape sequence
-->> 2: it ignores the first character of the string when it is a newline
page = [[
<html>
<head>
<title> An HTML Page </title>
</head>
<body>
    <a href="http://www.lua.org">Lua</a>
</body>
</html>
]]
write(page)

page = [===[
Another example with very long sentence, but with different matching brackets
    ]==] this will not be regarded as closing bracket because it has different 
    number of equal sign
]===]


--> string functions <--
string.match
