* The object of a DSL-based software architecture is to minimise the
semantic distance between the system’s specification and its implementation.

principle: 

design features:
    |-- dynamic
    |-- stack based
    |-- runtime eval
    |-- garbage collection
    |-- lambda calculas
target use
    |-- data query
    |-- list processing 
    |-- string processing 
    |-- pattern matching 
    |-- modeling
technique
    |-- control flow
    |-- data flow
    |-- rules based
    |-- meta programming

paradigm
    |-- functional programming (logic driven)
    |-- OO
    |-- event oriented (driven)

syntax (parsing)
    |-- keywords, operator, delimiters
    |-- syntactic sugar
    |-- style (uniformality)
semantic	
    |-- variable substitution (one-time vs unbounded)
    |-- context (scope, namespace): how to access uplevel var
    |-- parameter passing: by value, by reference [as value]
builtin functions
    |-- io (read, print, error)
    |-- subprocess (eval, exec, )
    |-- control (source, import)
    |-- string
    |-- math
    |-- iterator
    |-- generator
data structure
    |-- list (array, set, tuple)
    |-- associate array (dictionary, hash, table, record)
    |-- stack
    |-- queue (pipe), dqueue
    |-- tree (binary tree)
    |-- graph, map
standard libraies
    |-- string, regex
    |-- math (scientific math)
    |-- network (sockets)
    |-- file operation(mv, cp, rename, delete)
    |-- gui
    |-- database
other packages
extensibility
    |-- call programs written in other language
debug
performance (optimization)
safety
embeddability
data as code
