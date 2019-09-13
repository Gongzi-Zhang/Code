# insert in the first line of a file
sed '1 i somehting' $file

# extract some text from a line
sed 's/per-pattern(extraction)post-pattern/\1/g' $file

# find the newest file in a dir.
ls -t | tail -n 1
for file in "$dir"/*; do
    [[ $file -nt $latest ]] && latest=$file
done
