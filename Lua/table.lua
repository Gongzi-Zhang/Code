--[ [ Table 
We use tables to represent ordinary arrays, symbol tables, sets, 
records, queues, and other data structures, in a simple, uniform, 
and efficient way.	Lua uses tables to represent modules, 
packages, and objects as well. When we write io.read, we mean 
"the read function from the io module". For Lua, this means 
index the table io using the string "read" as the key.
--]]
--[ [
Tables in Lua are neither values nor variables; they are objects.
You may think of a table as a dynamically allocated object; your 
program manipulates only references (or pointers) to them. There 
are no hidden copies or creation of new tables behind the scenes. 
Moreover, you do not have to declare a table in Lua; in fact, there 
is no way to declare one. You create tables by means of a 
constructor expression, which in its simplest form is written as {}:
--]]
a = {}		--> create a table
k = "x"
a[k] = 10	--> add new entry, with key="x", value=10
print(a["x"])	--> 10
a["x"] = a["x"] + 1
print(a["x"])	--> 11

--[ [
A table is always anonymous. There is no fixed relationship between 
a variable that holds a table and the table itself:
--]]
b = a		--> b refers to the same table as a
print(b["x"])	--> 11
a = nil		--> only b still refers to the table
b = nil		--> no references left to the table
--[ [
When there is no reference to a table left, Luas garbage collector 
will eventually delete the table and reuse its memory.
--]]

--[ [
To represent 'records', you use the field name as an index. Lua 
supports this representation by providing a.name as syntactic sugar 
for a["name"].
--]]
a.x = 10	--> same as a["x"] = 10
print(a.x)	--> 10
x = "y"
a[x]		--> nil, same as a["y"]
--[ [
The dot notation clearly shows that we are using the table as a 
record, where we have some set of fixed, pre-defined keys. The 
string notation gives the idea that the table may have any string 
as a key, and that for some reason we are manipulating that specific 
key.
--]]


--[ [ 
To represent a conventional array or a 'list', you simply use a 
table with integer keys.
--]]
print(a[#a])	    --> print the last value of list a
a[#a] = nil	    --> remove the last value of list a
a[#a+1] = 'v'	    --> append 'v' to list a

list = nil
for line in io.lines() do
    list = {next=list, value=line}
end
local l = list
while l do
    print(l.value)  --> print it in reverse order
    l = l.next
end



--[ [
Because an 'array' is actually a table, the concept of its "size" 
can be somewhat fuzzy. For instance
--]]
a = {}
a[10000] = 1
print(#a)	    --> 0

a = {x=10, y=20, "one", "two", "three"}
#a		    --> 3
for k in pairs(a) do print(k) end	--> 1 2 3 x y
--[ [
Remember that any non-initialized index results in nil; Lua uses 
this value as a sentinel to find the end of the array. When the 
array has holes — nil elements inside it — the length operator may 
assume any of these nil elements as the end marker. Of course, this 
unpredictability is hardly what you want. Therefore, you should 
avoid using the length operator on arrays that may contain holes.
Most arrays cannot contain holes, and therefore, most of the time 
the use of the length operator is safe. If you really need to handle 
arrays with holes up to their last index, you can use the function 
table.maxn, which returns the largest numerical positive index of
a table:
--]]
a = {}
a[10000] = 1
print(table.maxn(a))	--> 10000

--[ [
we can index a table with any type
--]]
i = 10; j = "10"; k = "+10"
a = {}
a[i] = "one value"
a[j] = "another value"
a[k] = "yet another value"
print(a[j])		--> another value
print(a[k])		--> yet another value
print(a[tonumber(j)])	--> one value
print(a[tonumber(k)])	--> one value


--> table functions <--
table.insert
table.remove
table.concat
