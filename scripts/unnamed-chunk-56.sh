# read in all files from directory
for file in playground/*\.txt # only matches .txt files
do
    cat $file | head -n 5
done
