-- io --
-- print any value by writing a line that starts with an equal sign followed by the expression:
= math.sin(3)	    -- 0.1411200805987
a = 30
= a		    -- 30

--- files ---
dofile("example.lua")	    --> laod lua files

--[[
print(10)   --> this line is commented out within the comment block
--]]
---[[	    --> this starts ordinary, single-line comment, instead of a block comment
print(10)   --> this line is not commented out
--]]


-- variables --
print(b)	--> nil, non-initial variables

--- string ---
a = "hello"
print(#ag)	--> 5, length of string
string.format()
--- long strings ---
page = [[
<html>
<head>
<title> An HTML Page </title>
<body>
    <a href="http://www.lua.org">Lua</a>
</body>
</html>
]]

--- conversion ---
print("10" + 1)		--> 11
print("hello" + 1)	--> ERROR (cannot convert "hello")
print(10 .. 20)		--? 1020, note the space around ..
tonumber("10")
tostring(10)
print (10 .. "" == "10") -- or simply cat with ..

-- object: table --
a = {}
x = "y"
a[x] = 10
a[10] = "Hello"
a.x		    --> 10
a[x]		    --> 10


-- loop --
for i=1,10 do
    print(i^2)
end


-- library
--- os ---
os.date()

--- io ---
io.write()
io.open()

--- coroutine ---
coroutine.create(function () do_something end)
coroutine.status(co)
coroutine.resume(co)	-- suspended --> running
coroutine.yield()
