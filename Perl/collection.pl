# find the newest file in a dir.
@sorted = map {$_->[0]}
	  sort {$a->[1] <=> $b->[1]}
	  map {[$_, -M $_]}
	  @ARGV;
print $sorted[0]
