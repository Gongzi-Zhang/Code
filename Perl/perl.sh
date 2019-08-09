perl -de1	# perl debugger
perl -e 'do {print ("perl> "); $_x=<>; chomp $_x; print(eval($_x)."\n")} while ($_x ne "q")'	# one liner perl command


# perldoc
perldoc -f functionname
perldoc module::name

# perl shell
cpan
>> install <MODULE>
