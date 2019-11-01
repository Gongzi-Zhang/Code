#!/usr/bin/perl
#
# subroutines
# when one use arrays as arguments, there is no way to distinguish them inside the subroutine
my @stooges = qw( Moe Larry Curly );
my @sandwiches = qw( tuna ham-n-cheese PBJ );
lunch (@stooges, @sandwiches);
sub lunch {
    my (@stooges, @sandwiches) = @_;	# @stooges gets all elements while @sandwiches gets nothing
}
# the solution is to use reference
lunch (\@stooges, \@sandwiches);
sub lunch {
    my $stoogeref = shift;
    my $sandwichref = shift;
    my @stooges = @{$stoogeref};
    my @sandwiches = @{$sandwichref};
}
