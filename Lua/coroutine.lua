--> create a new coroutine <--
co = coroutine.create(function () print("hi") end)

--> status: suspended, running, dead and normal
coroutine.status(co)
coroutine.resume(co)	    --> start execution of a coroutine: suspended -> running
when a coroutine resumes another, it is not suspended; after all, we cannot resume it. However, it is not running either, because the running coroutine is the other one. So, its own status is what we call the normal state.


--> yield: it allows a running coroutine to suspend its own execution so that it can be resumed later
co = coroutine.create(function () 
    for i = 1, 10 do
	print("co", i)
	coroutine.yield()
    end
end)
coroutine.resume(co)	--> 1
coroutine.status(co)	--> suspended
coroutine.resume(co)	--> 2
coroutine.resume(co)	--> 3
...
coroutine.resume(co)	--> 9
coroutine.resume(co)	--> 10
coroutine.resume(co)	--> print nothing
coroutine.resume(co)	--> false cannot resume dead coroutine
