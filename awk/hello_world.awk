#!/usr/bin/awk

BEGIN { 
    print ARGC; 
    for (i in ARGV) {
	print ARGV[i]
    }
}

(NR == 1) {	# condition action; one of them can be omitted
    # no boolean type: true and false are not keyword
    if (true) # dependending on true variable, if it is defined, then this statement is true
	print "true"	
}

$5	# missing action, use default action: print

{	# missing condition, apply to every record
    input=$1
    for(i=2; i<=NF; i++)    # $i, positional field
	input=input" "$i    # concat every field, delimited by ' '

    total += \$${column_number}	# indirect reference
    #	     ^^^
}

END{
    print "Hello World!"
}
