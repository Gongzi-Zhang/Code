lua -i	    # interactive mode
lua -e "print('Hello World')"	# execute command
lua -l a    # load library a
lua script a b c    # running lua script with parameters a b c


* ENVIRONMENT variable
    LUA_INIT    @filename   :: run it before running its arguments
			    :: configuring lua interpreter
