perl -c     # check the syntax without execution
perl -d	    # perl debugger
perl -dt    # perl debugger
perl -e 'do {print ("perl> "); $_x=<>; chomp $_x; print(eval($_x)."\n")} while ($_x ne "q")'	# one liner perl command
perl -V:configvar   # check named configuration var
    perl -V:libc
    perl -V:lib.
    perl -V:lib.*


# perldoc
perldoc -f functionname
perldoc module::name

# perl shell
cpan
>> install <MODULE>

# cpanm: module management
cpanm Module::Name
