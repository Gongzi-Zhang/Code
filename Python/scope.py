'''
More precisely, all variable assignments in a function store the 
value in the local symbol table; whereas variable references 
    first:   look in the local symbol table
    then:    in the local symbol tables of enclosing functions
    then:    in the global symbol table
    finally: in the table of built-in names.
'''

''' The global scope associated with a method is the module 
containing its definition. (A class is never used as a global scope.)
Note the __main__ module
'''

def test():
    spam = "class spam"

    def scope_test():
        def do_local():
            spam = "local spam"

        def do_nonlocal():
            nonlocal spam
            spam = "nonlocal spam"

        def do_global():
            global spam
            spam = "global spam"

        spam = "test spam"
        do_local()
        print("After local assignment:", spam)
        do_nonlocal()
        print("After nonlocal assignment:", spam)
        do_global()
        print("After global assignment:", spam)

    def do_class():
        print("class spam:", spam)

    do_class()
    scope_test()
    do_class()

spam = "spam"
test()
print("In global scope:", spam)

#> class spam: class spam
#> After local assignment: test spam
#> After nonlocal assignment: nonlocal spam
#> After global assignment: nonlocal spam
#> class spam: class spam   
#> In global scope: global spam
#>> class spam is not modified by nonlocal or global

