#!/usr/bin/lua

io.stdout:setvbuf "no";

require "io"

starttime = os.time()

print("Hello World")
print [[ a multi-line
    message ]]

--> primitive type
local x
x = nil
x = true
x = false
x = 1		--> number
x = 1.
x = 'Hello'	--> string
x = 'hello' .. 'world'	--> helloworld
x = 0 .. 1	--> 01, lua implicitly convert number to string
x = {1, 2, 3}	--> table
x = {'hello', 'world'}
x = {1, 'hello'}
x[1]	    --> 1
x = {a=10, b=20}
x["a"]	    --> 10
x = {}
x.a = 10; x.b = 20
x = {1, 2, a=10}    --> mix record-style and list-style
x = {["+"] = "add", ["-"] = "sub", ["*"] = "mul", ["/"] = "div"}
s = "-"
print(x[s])	--> sub
i = 20
x = {[i+0] = s, [i+1] = s..s, [i+2] = s..s..s}
print(a[22])	--> ---

x = 2^3
x^y^z	--> x^(y^z)

a, b = 10, 2*x
x, y = y, x	--> the value on the right of = are evaluated before assignment
a, b, c = 0, 1	    --> c = nil

x = nil	    --> delete x


--> Logical expression <--
if not x then x = v end
if x and y then x = v end
if x or y then x = v end
max = (x > y) and x or y


--> Control flow <--
---> do <---
do ... end

---> if <---
if op == "+" then
    r = a + b
elseif op == "-" then
    r = a - b
elseif op == "*" then
    r = a*b
elseif op == "/" then
    r = a/b
else
    error("invalid operation")
end


---> while <---
local i = 1
while a[i] do
    print(a[i])
    i = i + 1
end


---> repeat <---
repeat
    line = os.read()
until line ~= ""
print(line)

---> numeric for <---
for var = exp1, exp2, [exp3] do
    ----> execute from exp1 to exp2, using exp3 (optional) as step 
    --- exp1, exp2 and exp3 are execute only once <----
    ...
end

for i=10, 1, -1  do
    print(i)
    if i > 10 then break end
end

---> generic for <---
for i, v in ipairs(a) do print(v) end


--> function <--
function add (a)
    local sum = 0
    for i, v in ipairs(a) do
	sum = sum + v
    end
    return sum
end

---> return multiple values <---
function max (a)
    local index, value = 0, 0
    for k in pairs(a) do
	if a[k] > value then index, value = k, a[k] end
    end
    return index, value
end
print(max({1, 4, 5, 9, 10}))	    --> 5, 10
print((max({1, 4, 5, 9, 10})))	    --> 5

---> variable number of arguments: ... <---
function add (...)
    local s = 0
    for i, v in iparis{...}  do
	s = s + v
    end
    return s
end

function fwrite (fmt, ...)
    return io.write(string.format(fmt, ...))
end

local function f ()
    ...
end

---> which equals to
local f = function () ... end

assert(loadfile(filename))

--> exception <--
local status, err = pcall(function () error() end)

if pcall(somefunction) then
    --- no error while running somefucntion
    <regular code>
else
    --- function raised an error
    <error-handling code>
end

if pcall(function ()
    <protected code>
end) then
    <regular code>
else
    <error-handling code>
end
