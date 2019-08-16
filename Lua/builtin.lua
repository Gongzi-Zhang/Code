print("Hello World")
error("Error message")

tostring(10)
tonumber("123")

type(x)

load()
loadfile()
dofile()
assert()
pcall()		--> pro-tested call

select(n, ...)	    --> return n-th extra arguments
select('#', ...)    --> return all extra arguments, including nil

--> iterators <--
next(table, key); next(table, nil)  --> the first pair
io.lines(a_file)    --> lines of a file
ipairs(a_array)	    --> entries of an array
pairs(a_table)	    --> pairs of a table
string.gmatch(a_string)	    --> words of a string



--> modules <--
---> string <---
