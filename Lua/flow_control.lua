a = {"one", "two", "three"}
for k in pairs(a) do
    print(a[k])
end

The generic for does all the bookkeeping for an iteration loop: it keeps the iterator funciton internally, it calls the iterator on each new iteration and it stops the loop when the iterator returns nil.

iter = pairs(a)
while true do
    k = iter()
    if k == nil then break end
    print(a[k])
end

--> more detailed explanation
for var1, ..., varn in <explist> do <block> end

do 
    local _f, _s, _var = <explist>  --> the iterator funciton, the invariant state, the control variable
    while true do
	local _var1, ..., _varn = _f(_s, _var)
	_var = _var1
	if _var == nil then break end
	<block>
    end
end


--> stateless iterator
function pairs (t)
    return next, t, nil
end

local function iter (a, i)
    i = i+1
    local v = a[i]
    if v then
	return i, v
    end
end

function ipairs (a)
    return iter, a, 0
end
