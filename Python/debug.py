'''ipython
%run some_script.py
%debug

or step by step
%run -d script.py

pdb: python debugger
ipdb> b(reak) 34    # set a break point at line 34
ipdb> c(ont(iue))   # continue execution to next breakpoint
ipdb> n(ext)        # next statement
ipdb> s(tep)        # step inside a function
ipdb> l(ist)        # list the code at the current position
ipdb> u(p)          # walk up the call stack
ipdb> d(own)        # walk down the call stack
ipdb> bt            # print the call stack
ipdb> a             # print the local variables
ipdb> !command      # execute the given python command
'''


'''command line
python -m pdf script.py
'''
