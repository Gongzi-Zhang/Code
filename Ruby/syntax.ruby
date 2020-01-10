#!/usr/bin/ruby


DECLARATION:
        def
OPERATOR:
    REAL_OPERATOR 'can not be redefine'
        .. ... not && and || or ::
        = -= += *= '/=' %=
    SYNTAC_SUGAR  'can be redefined'
        + - 'unary operators; overload with +@ (-@)'
        [] "#{}" @ .
        + - * '/' %
        < > <= >= == != <=>
        ``

KEYWORDS:
        require require_relative include load prepend extend
        if else elsif for while until in do end
        class end module end attr_reader attr_accessor attr_writer
        alias end
        true false nil
        return
        loop
        self
        raise
        yield
        __FILE__ __LINE__
    ACCESS_MODIFIER
        public private protected
        private_class_method
OBJECT:
    NUMBER
        
    STRING

    SYMBOL

    ARRAY

BLOCK:
        do ... end
        { ...}
# there is no do statement
PROC:

LAMBDA:

STATEMENT:
        OBJECT.METHODS

    ASSIGNMENT
        LVALUE = RVALUE



=begin
a ID may be a variable or a function without arguments; to decide which is the case, Ruby looks for assignment statement prior to the use of the ID (doesn't need to be executed, just saw it); if it was assigned to, then it will be parsed as a variable, otherwise treats it as a method
=end
