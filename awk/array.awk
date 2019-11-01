# for array in awk, there is always only one index (GNU awk support multi subindex)
# in multi-index, the subindex [i, j] is actually concat. to be one subindex

# index of a 1D array
n = split("hello world", words)
for (i in words) {
    print i, words[i]	# i = 1, 2
}

# multi-Dim array
for(i=0; i<5; i++) {
    randoms[rand(), rand()] = rand()
}

for (i in randoms) {
    split(i, keys)
    print keys[1], keys[2], randoms[keys[1], keys[2]]
}

# check empty of array
function is_empty(array) {
    for (i in array)
	return 0
    return 1
}
