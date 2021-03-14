history # prints a list of recent commands
    !2 # re-runs command n2 from the history
chmod # modify permissions on a file/directory
pwd # find current directory
cd # change directory
ls # list contents of a given directory
cp original.txt copy.txt # copy files
mv original-location/text.txt new-location/text.txt # move/rename files
rm text.txt text-1.txt # delete files
rmdir directory-name # delete directory
mkdir directory-name # create directory
touch file-name.txt # create file
cat file-name.txt # print file contnets
less file-name.txt # print large file contnets in pages
cut # print certain columns from text file such as csv
grep # match a string/regex
sed # regex string replacement
ls -la > list-of-files.txt # redirect outputs
wc -l text.csv # count word/characters/lines
sort -r -n -b # sort in reverse numerical order and ignore leading white spaces
uniq # gets unique non-adjacent data
echo $SHELL # print a variable (preceed with $ sign)
test="A value or file input of some sort." # define a variable
for item in  list1 list2 list3; do echo $item; done # for loop
# multi-line for loop
for item in $@
do
    echo "Testing: $item"
done
# a script with multiple variables
echo '{
    echo "Username: $1";
    echo "Age: $2";
}' > script.sh
declare -a my_array # creates an empty array
my_array=(1 2 3) # creates an array of 1, 2, 3
echo ${my_array[@]} # prints all elements
echo ${#my_arary[@]} # prints the length 
array[@]:n:m # slice an array
echo ${!friends_list[@]} # return all keys of associative list
# if statements
if [ boolean_condition ]; then
    # CODE
else
    # OTHER CODE
fi # finishes an if statement
