a.x		--> a["x"]
o:foo(x)	--> o.foo(o, x)
function foo (x) return 2*x end	--> foo = function (x) return 2*x end
local function foo () ... end	--> equals to
    local foo
    foo = function () ... end
