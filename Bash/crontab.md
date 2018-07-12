* percent-sign (%) in the command, unless escaped with backslash, will be
changed into newline char, and all data after the first '%' will be sent
to the command as standard input.

* There is no way to split a single command line onto multiple lines.

* no quote sign around variables
    MAILTO=foo1@bar.com,foo2@bar.com
    *not* MAILTO="foo1@bar.com,foo2@bar.com"

