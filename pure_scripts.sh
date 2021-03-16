
rm -r playground
mkdir playground

touch playground/test_permissions.txt
ls -l
chmod u+x playground/test_permissions.txt
ls -l

chown Work playground/test_permissions.txt # sets the ownership of file to a user.

groups

chgrp admin playground/test_permissions.txt # sets the ownership of file to a group.

ls -l ./data/*\.csv # this will print all files that are .csv extensions

touch playground/test_zip.txt
ls -l playground > playground/test_zip.txt # create a file and add content
ls -l playground

cat playground/test_zip.txt # show the original file
gzip playground/test_zip.txt # this will compress the file the original will no longer be available, there is an option to keep both
cat playground/test_zip.txt.gz # show the file was zipped

gunzip playground/test_zip.txt.gz # will unzip the file back to the original.

ls -l playground/ > playgound/test_zip.txt 

gzip playground/test_zip.txt
gzip playground/test_zip.txt.gz

ls -l playground
tar -cf playground/Archive.zip figures/*
ls -l playground

cat playground/Archive.zip

touch playground/original.txt
mkdir playground/backupdir
cp playground/original.txt playground/copy.txt
cp playground/original.txt playground/copy.txt playground/backupdir

cut -f -1-2,5 -d , data/iris.csv | head -n 5 # head used to reduce print size

cut -f 2 -d , data/iris.csv | head -n 5

tail -n 20 data/iris.csv | head -n 3

head data/iris.csv

grep "Virginica" data/iris.csv | head -n 5

grep -c "Virginica" data/iris.csv data/mtcars.csv # -c prints number of matches
ls -l data | grep ".*\.csv"

echo "The duck went to the market." | sed "s/duck/fox/g"

ls -la > playground/list-of-files.txt
cat playground/list-of-files.txt

wc -l data/iris.csv

awk 'NF' data/mtcars.csv data/mtcars.csv | sort | head -n 5

awk 'NF' data/mtcars.csv data/mtcars.csv > playground/duplicated.csv

cut -d , -f 1 playground/duplicated.csv | uniq | head -n 10

cut -d , -f 1 playground/duplicated.csv | uniq | head -n 10

nano data/iris.csv

set | head

head data/mtcars.csv

echo $SHELL

#!/bin/bash

# your code goes here
for item in item1 item2 item3
do
    echo "Print: $item"
done

touch playground/script_0.sh
ls -l playground | grep "script_0.sh"

chmod u+x playground/script_0.sh

ls -l playground | grep "script_0.sh"

echo 'echo "testing; echoing from script"' > playground/script_0.sh
bash playground/script_0.sh

echo 'sort $@ | uniq -c' > playground/script_1.sh
cat playground/script_1.sh

bash playground/script_1.sh playground/*\.csv

echo '{
    echo "Username: $1";
    echo "Age: $2";
}' > playground/script_2.sh

bash playground/script_2.sh 28 John

bash playground/script_2.sh John 28

2> /dev/null # redirects STDERR to be suppressed
1> /dev/null # STDOUT is being suppressed

cat data/iris.csv 1> playground/std-output-redirection.txt # redirects the standard output to a file
cat playground/std-output-redirection.txt | head -n 5

w # shows list of connected users.
whoami # shows the name of the current user.
uname -a # shows kernal information (Linux, Darwin for OSX).
date # shows current date and time.

# ctrl + c abort execution.
# ctrl + z pause execution.

expr 1 + 6.2

echo "1 + 6.2" | bc

test="A value or file input of some sort."
echo $test

declare -a my_array # creates an empty array
my_array=(1 2 3) # creates an array of 1, 2, 3

echo ${my_array[@]}

declare -a my_array
my_array=(1 2 3)

echo ${my_array[@]} # prints all elements
echo ${#my_array[@]} # prints the length 

declare -a my_array
my_array=(1 2 3)

echo ${my_array[2]} # prints 3

my_array[1]=10
echo ${my_array[@]}

declare -a my_array
my_array=(1 2 3 4 5 6 7 8 9 10)

echo ${my_array[@]:2:5}

declare -a my_array
my_array=(1 2 3 4 5 6 7 8 9)
my_array+=(10) # note the use of parenthesis

echo ${my_array[@]}

my_array+=10 # not using parenthesis yields different results

echo ${my_array[@]}

declare -a my_array_a
my_array_a=(1 2 3 4 5 6 7 8 9 10)
declare -a my_array_b
my_array_b=(10 11 12 13 14 15 16 17 18 19 20)

declare -a my_array_final=`echo "scale=3; (${my_array_a[1]} + ${my_array_b[2]}) + ${my_array_b[3]} / 3" | bc`

echo ${my_array_final[@]}

bash --version

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

declare -A friends_list # declare first
friends_list_2_step=([name]="Guy" [age]=21) # add elements
echo ${friends_list_2_step[@]}

declare -A friends_list_1_step=([name]="Guy" [age]=21) # all at once
echo ${friends_list_1_step[@]}

declare -A friends_list_1_step=([name]="Guy" [age]=21) # all at once
echo ${!friends_list[@]} # return all keys

for item in list1 list2 list3; do echo $item; done

for item in playground/*; do ls -l $item; done

for item in playground/* # this * syntax explained later
do
    echo "Testing: $item"
done

# brace extensions
for x in {1..10..3}
do
    echo $x
done

# three expression
for ((x=2;x<=10;x+=3))
do
    echo $x
done

# read in all files from directory
for file in playground/*\.txt # only matches .txt files
do
    cat $file | head -n 5
done

for file in `ls playground/ | grep -i 'duplicated'`
do
    echo $file
done

x=1
while [ $x -le 10 ]
do
    echo $x
    ((x+=1))
done

if [ boolean_condition ]; then # spaces!!! [ logical ];
    # CODE
else
    # OTHER CODE
fi # finishes an if statement

login # logs in locally

ssh user@server # ssh command for server use
logout # logs you out of your session

var="Yes"
if [ $var == "No" ]; then
    echo "You are authorised."
else
    echo "You may not proceed."
fi

var=20
if (( $var > 10 )); then
    echo "It is larger."
else
    echo "It is smaller."
fi

var=20
if [ $var -gt 10 ]; then
    echo "It is larger."
else
    echo "It is smaller."
fi

var=1
if [ $var -gt 1 ] && [ playground/file.txt -w ]; then
    echo "Memory states greater than 1 with a value of $var \n and the files are writable."
fi

if [[ 2 -gt 1 && playground/file.txt -w ]]; then
    echo "Memory states greater than 1 with a value of $var \n and the files are writable."
fi

# you can also use other CLI programmes inside
if grep -q expression file.txt; then
    echo "Expression found inside."
fi

# a SHELL can be used inside the statement too
if `grep -q expression file.txt`; then
    echo "Expression found inside."
fi

# case statement
case "string_or_var" in # pass string or variable; even a nested SHELL
    CONDITION_1)
    code_command;;
    CONDITION_2)
    code_command;;
    *)
    DEFAULT_CONDITION code_command;;
esac # case backwards

# complicated if statement
if grep -q "House Cat" $1; then
    mv $1 mammal/
fi
if grep -q "Crocodile" $1; then
    mv $1 reptile/
fi
if grep -q "Bald Eagle" $1; then
    mv $1 bird/
fi

# case statement
case `cat $1` in
    "House Cat")
    mv $1 mammal/;;
    "Crocodile")
    mv $1 reptile/;;
    "Bald Eagle")
    mv $1 bird/;;
    *)
    mv $1 other/;;
esac

# case statement matching days of week
case "Tuesday" in
  # weekdays
  Monday|Tuesday|Wednesday|Thursday|Friday)
  echo "Weekday";;
  # weekend
  Saturday|Sunday)
  echo "Weekend";;
  # default
  *)
  echo "Unrecognised";;
esac

func_name () {
    # code goes here
    return # something
}

function func_name () { # parenthesis optional here
    # code goes here
    return # something
}

function a_func () {
    local var="Something" # restrict to local scope
}

function func {
    fake_command # this should err
}

func # called
echo $? # print the err returned

# bash: fake_command: command not found
echo $? # print the err returned
127 # 127 means the code called does not exist

# return with a nested SHELL
function func_2 {
    echo `echo "scale=2; ($1 - $2) / 2 * 100" | bc`
}

saved_var=`func_2 21 5`
echo "The result is $saved_var"

15 2 * * * bash script.sh

ps -u "Dereck" | head # this command shows all programmes currently running for a given user

10,20,40 * * * * bash script.sh

*/5 * * * * bash script.sh

bash --version

curl -o playground/iris_download.csv https://gist.githubusercontent.com/netj/8836201/raw/6f9306ad21398ea43cba4f7d537619d0e07d5ae3/iris.csv

curl -O https://sitename.com/path/filename[01-20]*\.txt

cat data/rcsb_pdb_6CLZ.fasta | head

cat data/rcsb_pdb_6E5B.fasta | head

cat data/SC.gtf | head

cat data/rcsb_pdb_6E5B.fasta | tail -n +1 | cut -c4- | sort -k1 | uniq | awk '{print $1 "\t" $4}' | head

cat data/rcsb_pdb_6E5B.fasta | tail -n +1 | cut -c4- | sort -k1 | uniq | awk '{print $1 "\t" $4}' | gzip > playground/newfile.txt.gz

cat data/SC.gtf | grep -e "SGD\ttranscript" | head -5

ps -u `whoami` | head

cat data/SC.gtf | grep -e "transcript\t" | cut -f 1,4,5,6,10 | head

cat data/SC.gtf | grep -e "transcript\t" | awk '{print $1"\t"$4"\t"$5"\t"$10"\t0\t"$7}' | head

cat data/SC.gtf | grep -e "transcript\t" | awk '{print $1"\t"$4"\t"$5"\t"$10"\t0\t"$7}' | sed 's/[;\*]//g' | sed 's/["\*]//g' | head

cat data/SC.gtf | grep -e "transcript\t" | awk '{print $1"\t"$4"\t"$5"\t"$10"\t0\t"$7}' | sed 's/[;\*]//g' | sed 's/["\*]//g' | sort -k 2  | head

kill -9 PID # kills programme with given PID

# Flag: -9 KILL (non-catchable, non-ignorable kill)
