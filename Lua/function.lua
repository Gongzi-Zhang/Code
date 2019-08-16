--> if the function has one single argument and that argument is 
--- either a literal string or a table constructor, then the
--- parenthesis are optional.
print "hello world"	    --> print("hello world")
print [[a multi-line	    
  message ]]                --> print([[a multi-line message]])
dofile 'a.lua'		    --> dofile('a.lua')
f{x=10, y=20}		    --> f({x=10, y=20})
type{}			    --> type({})


--> local function: recursive definition
local fact = function (n)
    if n == 0 then return 1
    else return n*fact(n-1)	--> buggy
    end
end
---> When Lua compiles the call fact(n-1) in the funciton body, the local fact is not yet defined. Therefore, this expression calls a global fact, not the local one.
local fact
fact = function (n) 
    if n == 0 then return 1
    else return n*fact(n-1)
    end
end
---> Now the fact inside the function refers to the local variable. Its value when the function is defined does not matter; by the time the function executes, fact already has the right value.

---> Syntactic sugar
local function fact (n)
    if n == 0 then return 1
    else return n*fact(n-1)
    end
end


--> indirect recursive functions
local f, g	--> 'forward' declarations
function g()
    ...
    f()
    ...
end
function f()
    ...
    g()
    ...
end
---> Beware not to write local function f in the last definition. Otherwise, Lua would create a fresh local variable f, leaving the original f (the one that g is bound to) undefined.
