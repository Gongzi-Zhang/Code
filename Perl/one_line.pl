# one line perl usage
do {print ("perl> "); $_x=<>; chomp $_x; print(eval($_x)."\n")} while ($_x ne "q")	# perl debugger

print int rand 100 for 1..100

# char frequencies in a line:
$x =~ s/(.)/$chars{$1}++;$1/eg;
print "frequency of '$_' is $chars{$_}\n" foreach (sort {$chars{$b} <=> $chars{$a}} keys %chars);



