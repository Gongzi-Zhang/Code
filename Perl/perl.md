https://perldoc.perl.org/perlintro(strict).html

* undef: undefined value
    -- when used as a number, it is treated as 0
    -- when used as a string, it is treated as empty string ""
    -- when used as a reference, it is treated as an error

* statement modifiers
    Any simple statement may optionally be followed by a SINGLE modifiers, just before the terminating semicolon:
    if EXPR
    unless EXPR
    while EXPR
    until EXPR
    for EXPR
    foreach EXPR
    when EXPR

* block
    Many things in perl are organized as blocks, which are marked by curly brace {}
    A block itself acts as a loop that executes once.
    eval{}, sub{}, and do{} blocks are **NOT** count as loops

    perl can't immediately tell block from an anonymous hash reference, unless you imply it with some other marks. (a shortcoming)

* variable names is different from most programming language:
    > normal ones: letter and underscore
    > package qualifier:    :: or '
    > a sequence of digits: hold data captured by backreferences after a regular expression match
    > a single punctuation char: $_
    > a two-chars sequence: ^ followed by any one of the chars [][A-Z^_?\]
