# cs-bash <img src="./figures/project-logo.png" width="100" align="right">

A primer on BASH scripting and Linux systems, will make it into a course for: [derecksnotes.com](www.derecksnotes.com)

# Bash quick start; basic commands

- BASH is indexed at 0.
- `#!/bin/bash` A "shebang" should be included in each script file to point to the interpreter.
    - Or use: `bash somescript.sh`.
- `'sometext'` single quotes means the SHELL understands this literally.
- `"sometext"` double quotes means the SHELL understands this literally expcept when it sees a `$` or backticks \`\`.
- \`some_command\` the SHELL runs the command inside and captures the STDOUT (output) back into the above SHELL as a variable.
    - A newer syntax for this same method is `$(some_command)`.
- `date` returns the current date and time: `date Sat 13 Mar 2021 15:56:49 PST`.
- All variables in BASH are global by default.
    - `local var="Something"` restrict to local scope

<br>

- Check BASH version with `bash --version`.

```bash
# assignement
=
+=

# comparators
==
!=
>
<
<=
>=

# arithmetic
+
-
*
/
```

```bash
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
```

`|` the pipe command separator allows the passsage of one output to another command. Chains can be built in this way for example: `ls -l | grep ".*\.file-extension` that command allows one to find all files from `ls -l` that have the given extension.

## Getting help

Use the `man command-name` command to get help for a specific command. For example `man ls` would get you the documentation in a paginated view for `ls`. 

Note the following for help:

- `NAME` tells you what the command does.
- `SYNOPSIS` list all possible flags.
- `[...]` are optional flags.
- `|` separates alternatives.
- `...` arguments that can be repeats.

# Introduction to BASH scripting

Before computers had GUIs they had command-line interfaces. The shell is an interface through which we can run other programmes and points their output to a human readable form; it then prompts for the next command. 

What is BASH and why use it? BASH stands for "Bourne Again Shell". It is a shell that was developed in the 80's. It is often the default for many Unix systems such as Linux and MacOS systems; MacOS has recently switched to zsh - a variant of BASH.

**Note that in MacOS's `zsh` implementation `zsh` is 1 indexed.**

BASH can be used to run programmes and data pipelines or automate repetitive tasks. All major cloud computing systems have a CLI to their products: AWS, Google Cloud, Microsoft Azure.

Learning and being capable of using SHELL scripting and BASH is an essential skill.

BASH scripting is the process whereby a programming writes a BASH script in a file and saves it. This file can then be executed and even repeatedly used for convience. 

## Basic tips

BASH is a 0 indexed language. This means that arrays start counting from 0. Thus, the first item in a list is 0, then 1, then `n - 1` for the ending item.

*Note you can use the tab key to autocomplete file and directory names.*

The filesystem manages files and directories in the computer system. These are defined by absoulute paths to the system's root. The root being the lowest level directory holding all other system files designated by `/`.

A file and directory can be defined as such: 

- `/home/usr/username/Documents/`
- `/home/usr/username/Documents/somefile.txt`

- Never use spaces in file names; use underscores `_`.
- `history` prints a list of recent commands; then use `!n` to re-use a specific command by index.

Quotes are understood a little different depending on which kind are used: double `""` or single `''`. 

- `'sometext'` single quotes means the SHELL understands this literally.
- `"sometext"` double quotes means the SHELL understands this literally expcept when it sees a `$` or backticks \`\`.

Backticks create a SHELL within a SHELL. This syntax can be very powerful and useful.

- \`some_command\` the SHELL runs the command inside and captures the STDOUT (output) back into the above SHELL as a variable.
    - A newer syntax for this same method is `$(some_command)`.

## Absolute vs relative paths

There are two main kinds of paths in the filesystem. Absolute and relative. These are defined by the first character of the path; paths begining with `/` are absolute. These paths can be from anywhere in the file system and will always use as a starting point the root directory of the computer. A relative path may be defined by either `./` or a directory name at the begining of the path. These will only work when inside the directory above the rest of the path.

## Wildcards

Wildcards allow you to match all files in a directory by use of `*`; you can also use regex in your bash commands to read in certain files:

```bash
ls -l Documents/*\.csv # this will print all files that are .csv extensions
```

## Change directories

Changing directories can be done with the command `cd` followed by either a relative or absolute path to go to. Once done you can use `pwd` to verify you've navigated correctly.

Use `cd ..` in order to move up one directory. The `..` designates the above directory.

## Copying files

The command `cp` can be used to copy a file. It takes two arguments the first being the original file and the following the copy. Note that this overwrites any exisiting files. The `cp` command can also take multiple files and if the last argument is a directory it will copy all files to that directory as shown below.

```bash
cp original.txt copy.txt
cp seasonal/autumn.csv seasonal/winter.csv backup
```

## Moving a file

In order to move a file you can use the `mv` command. It has a similar syntax to the `cp` command except it deletes the original file. This command `mv` can also move multiple files in the same way as `cp`. Note `mv` can also rename files.

## Deleting/creating files/directories

Use the `rm` to remove or delete files. It takes as many names of files as you want. This command can even be done recursively: `rm text.txt`. 

Note that there is a separate command for deleting directories; or you can use the recursive option on `rm -r`. Use `rmdir` to delete directories.

In order to create directories use the `mkdir directory-name` command. In order to create files use the `touch file-name.txt` command.

## Temporarily storing files

When working on a project you often generate intermediate files. One place to temporarily store files is the `tmp` directory right below the root: `/tmp`.

## Printing a file's content

Use the `cat` command to print the file contents to the terminal. Sometimes you may have a very large file and printing with `cat` can cause issues. Instead use `less`. This command will display some of the content on one page and you can use the spacebar to page down and `q` command to quit.

In order to print just the top of a file use the `head` command. Use the arugments `head -n 5 filename.txt` to specify the amount of lines to print.

### `head`/`tail`

In order to get rows or columns from a file use the `cut` command. It has several arguments but a common use looks something like this:

```bash
cut -f -2-5,8 -d , file.csv
```
d
This can be translated as select columns 2 to 5 and columns 8 using a comma as a separator. The `-f`argument means fields, it is used to specify columns and `-d` means delimiter or separator.

Note that cut doesn't work well with quoted text, this because there could be commas inside the quoted text. Such as:

```csv
name,age
"Dereck, Mezquita", 28
```

This would print:

```bash
cut -f 2 -d , file.txt
age
Mezquita
```

### `head`/`tail` the middle of a file

This trick might be useful to get lines in an interval. Use `tail` to get the last lines `n` to `...`. Then use a subsequent `head` to get the top of that:

```bash
tail -n 20 file.csv | head -n 3
```

## `paste` combine data

Can be used to combine data files. 

## `grep` regex selection

In order to select text that contains a certain string use the command `grep`. This can be used with a quoted argument which is the string to match as such:

```bash
grep "studio"
```

Note that the above command does nothing as it has no text to select from. This command is often used in conjunction with another that has some kind of text or string output. This command can also be used by itself for printing content:

```bash
grep -c string-to-match directory/text-1.csv directory/text-2.csv # -c prints number of matches
ls -l /Documents | grep ".*\.csv"
```

That command allows us to get all files in a given directory that have the extension `.csv`.

Here are some common flags with `grep`:

- `-q` make grep return a boolean `true`/`false`.
- `-c` print the number of matching lines per file.
- `-h` don't print names of files when searching.
- `-i` ignore capitalisations ("Name" and "name" treated as matches).
- `-l` print the names of files containing matches but not the matches.
- `-n` print line numbers for matching lines.
- `-v` invert the match; only show lines that don't match.

## `sed` regex string replacement

The `sed` command allows you to replace a matching string with another. The syntax requires a regular expression as follows:

```bash
echo "The duck went to the market." | sed "s/duck/fox/g"
```

## Outputing to a file aka redirecting outputs

In BASH you don't necessarily have an output argument. Instead the output, which would and could normally go to the console/terminal, can be redirected to a file with use of `>` as a connector; right side argument is a file name:

```bash
ls -la > list-of-files.txt
```

## `wc` word/character/line count

This command will let you count the number of works, characters, or lines in a document. Use the appropriate arguments:

- `-w` word count.
- `-c` character count.
- `-l` line count.

```bash
wc -l text.csv
```

## `sort` data

In order to sort use the command `sort` with flags:

- `-f` ignore case.
- `-n` sort numerically.
- `-r` sort in reverse order.
- `-b` ignore leading blanks.

## `uniq` removing duplicates

This commamnd removes adjacent duplicated lines. Bellow is an example:

```bash
cut -d , -f 1 data.csv
Elephant
Elephant
Tiger
Tiger
Zebra
Tiger

cut -d , -f 1 data.csv | uniq 
Elephant
Tiger
Zebra
Tiger
```

Note that as state above this only works on adjacent lines so note that Tiger is left in duplicate where duplicate lines are not adjacent; sort to get strictly unique.

# BASH scripting

Here we get into actually creating more permanent scripts and code; not just typing single commands into the terminal.

## Manually editing a file

There are number of different editors that can be used in `Unix`: `nano` and `vim` just to name two very popular ones.

To use them use the command name and a file as an argument:

```bash
nano data.csv
```

You can then navigate and edit with:

- `Ctrl + K` deletes a line.
- `Ctrl + U` undo line deletion.
- `Ctrl + O` save file ("o" for "output").
- `Ctrl + X` exit the editor.

## Printing variables

In order to store information you can use environment variables; you are storing information in these pre-existing variables that is. These are named as such with all capitals. 

- HOME User's home directory `/home/repl`
- PWD Working directory	`pwd`
- SHELL Which shell program	`/bin/bash | /bin/zsh`
- USER User ID `repl`

Type `set` in the terminal to get a full list (there are many):

```bash
set | head
'!'=0
'#'=0
'$'=8043
'*'=(  )
-=569Xils
0=/bin/zsh
'?'=130
@=(  )
ARGC=0
CDPATH=''
```

You can print the value of a variable, even user defined ones, by using the `echo` command and the variable preceded by a dollar sign `$`.

```bash
echo $SHELL
/bin/zsh
```

## Anatomy of a BASH script

The first part of a BASH script is a "shebang" often seen as this: `#!/bin/bash` on the very first line. This is so that the interpreter knows to use BASH and where it's located on your machine.

If you are having issues try to check where it's located using the command: `which bash`.

The next part of the script is your code. 

```bash
#!/bin/bash

# your code goes here
for item in item1 item2 item3
do
    echo "Print: $item"
done
```

These files are typically used with the extension `.sh`. Be sure to read the next section on execution permissions.

Run your script by using the command: `bash script.sh`. Or if the file contains the "shebang" on the first line the no need to define the interpreter simply use `./script.sh`.

## Saving and running scripts

In order to write shell scripts in a file and use them use the `.sh` extension on a file name. Be sure to change the permissions on the file you created to allow for execution. This may require use of `chmod` as follows:

```bash
chmod u+x script.sh
```

You can then run the file using the following syntax in the terminal:

```bash
bash script.sh
```

## Pass filenames to a script

In order to have a script use files we give it as an argument in the terminal we can use the following syntax inside the script: `$@`. This allows the script to the use our arguments in the CLI.

```bash
echo "sort $@ | uniq -c" > script.sh
bash script.sh Documents/*\.csv
```

## Process arguments in a script

In order to have more complex scripts with more than one input you can use the syntax of `$n`; where n is the number of the argument. Note that an order is applied. The arguments in a script are processed in the same order in which they are sent. So if your script and command are as such then expect the following:

```bash
echo '{
    echo "Username: $1";
    echo "Age: $2";
}' > script.sh

bash script.sh 28 John
Username: 28
Age: John
bash script.sh John 28
Username: John
Age: 28
```

## Special arguments array from script

When passing multiple arguments to a script - these are saved to a `ARGV` variable. This has some special properties and can even be printed out.

- `$@`/`$*` prints out all arguments array.
- `$#` prints the length of the array of arguments

## Streams in BASH

There are three kinds of streams of data in BASH:

1. `STDIN` standard input going into a programme.
1. `STDOUT` standard output going out of a programme.
1. `STDERR` standard errors from the programme.

Sometimes in a programme you can see the following lines at the end of a script:

```bash
2> /dev/null # redirects STDERR to be suppressed
1> /dev/null # STDOUT is being suppressed

cat file.txt 1> std-output-redirection.txt # redirects the standard output to a file
```

## Arithmetic and numbers in BASH

Numbers are not natively supported in BASH; in R or JS for example you could type something like: `3 + 2` in a console and the arithmetic would return a result. In BASH this does not work. 

In order to do arithmetic you can use the utility `expr` with the following syntax: `expr 2 + 2`.

Note that `expr` cannot handle decimals. In order to solve this you could instead use `bc`, it invokes an interactive calculator. However you can pipe values to it and use it in a similar way to `expr` but with decimals: 

```bash
expr 1 + 6.2
expr: not a decimal number: '6.2'

echo "1 + 6.2" | bc
```

Note `bc` also takes an argument for stipulating how many decimal places to return - `scale`. By default it returns whole numbers rounding.

When using numbers for example assigning them to a variable name be sure not to assign them as a string with quotes. Keep them as numbers in order to be able to use them as number types later on.

*You might see some people use a double paranethesis method for invoking `expr`: `$((1 + 2))`.*


## Objects in BASH: storing variables

In order to create a variable use the following syntax. Note you set the variable with no spaces between the variable name and the value: `var_name=value`. Then you can call the variable by use of a dollar sign `$` as such:

```bash
test="A value or file input of some sort."
echo $test
A value or file input of some sort.
```

## Objects in BASH: arrays

There are two types of arrays in BASH: numerical-indexed arrays or list with key value pairs.

### Numerical-indexed array

There are two ways to create a numerical-indexed arrays:

```bash
declare -a my_array # creates an empty array
my_array=(1 2 3) # creates an array of 1, 2, 3
```

Note the separation with spaces, *not* commas.

In order to print you array you can print all elements by use of the `{array[@]}` syntax. Like so:

```bash
my_array=(1 2 3)
echo ${my_array[@]} # prints all elements
echo ${#my_arary[@]} # prints the length 
```

In order to access elements of array use `[]` brackets. As stated before BASH is 0 indexed. Elements can be changed by using the bracket notation and setting the value.

```bash
my_array=(1 2 3)
echo ${my_array[2]} # prints 3

my_array[1]=10
echo ${my_array[@]}
```

**Again please note that BASH is often 0 indexed, but MacOS's recent implementation of `zsh` is indeed 1 indexed.**

In order to slice a part of an array or get things in a certain interval use the syntax:

```bash
array[@]:n:m
```

Note that `m` is the number of elements to return after the starting index `n`.

Appending to an array uses the operator `+=`:

```bash
my_array=(1 2 3 4 5 6 7 8 9)
my_array+=(10) # note the use of parenthesis

echo ${my_array[@]}
1 2 3 4 5 6 7 8 9 10

my_array+=10 # not using parenthesis yields different results
110 2 3 4 5 6 7 8 9 10
```

Note the difference in results; however, this does not occur in `zsh`. In `zsh` you get the same result as when using parenthesis: `1 2 3 4 5 6 7 8 9 10`.

Here is a quick example using ararys, backticks (SHELL in SHELL), pipes, and arithmetic all in one:

```bash
decalre -a my_array=`echo "scale=3; (${other_array[1]} + ${other_array[2]}) + ${other_array[3]} / 3" | bc`
```

### Associative arrays; key-value paired

*Note this feature is only available in BASH v4+.*

To create an associative array you must use the `declare` syntax. Either declare an empty array first and then add key-values or declare with key-value all at once.

Set keys with square brackets `[]` and values after the equals `=` sign. Multiple elements at once can be declared.

```bash
declare -A friends_list # declare first
friends_list=([name]="Guy" [age]=21) # add elements

declare -A friends_list=([name]="Guy" [age]=21) # all at once
```

Associative arrays' keys can all be got with the following syntax `!`:

```bash
echo ${!friends_list[@]} # return all keys
```

## `for` loops

The structure and syntax of a for loop in BASH is as follows:

```bash
for item in  list1 list2 list3; do echo $item; done
list1
list2
list3

for item in ./*; do ls -l $item; done
-rw-r--r--  1 work  staff  9680 12 Mar 18:01 ./README.md
-rw-r--r--  1 work  staff  42 12 Mar 17:42 ./data.csv
```

Note that a variable is defined and then called. 

A multi-line syntax for `for` loops in a script is as follows:

```bash
for item in $@
do
    echo "Testing: $item"
done
```

To create a numeric range to iterate through you can use something called brace extension. This is done with curly brackets: `{start..stop..increment}` by default this increments by 1 if you do not specify the third argument.

You can also use three expression syntax using parenthesis: `((x=2;x<=10;x+=3))`. This might seem very familiar if you are experiences with `JavaScript`.

```bash
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
```

You can also use something called glob expansions to iterate in place, this uses the `*` asterisk. This can be used for example to read in all files from a directory at once:

```bash
# read in all files from directory
for car in cars_dir/*\.txt # only matches .txt files
do
    cat $car
done
```

A nested SHELL cna also be used to create a `for` loop. This can be useful for matching specific files on a condition or otherwise then passing the result to the `for` above loop for more work:

```bash
for car in `ls cars_dir/ | grep -i 'Honda'``
do
    echo $car
done
```

## `while` loops

These are similar to `for` loops but they have a condition that is tested at each iteration. This is useful if you have a variable that is being modified each loop that needs to be checked. Iterations continue until the conidition is no longer met:

```bash
x=1
while [ $x -le 100 ]
do
    echo $x
    ((x+=1))
done
```

**BEWARE OF INFINITE LOOPS; MODIFY YOUR CONDITIONS INSIDE WHILE LOOPS**

## `if` statements and conditional flow

An if statement can be written with the following syntax; note that when using a numerical condition use double parenthesis `(())` or you can use `[]` brackets with a flag:

```bash
if [ boolean_condition ]; then # spaces!!! [ logical ];
    # CODE
else
    # OTHER CODE
fi # finishes an if statement

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
```

The possible flags for use as comparators are:

- -eq equal to.
- -ne not equal to.
- -lt less than.
- -le less than or equal to.
- -gt greater than.
- -ge greater than or equal to.

You can also file related flags for checking things in the system:

- -e does a file exist.
- -s if the file has a size larger than 0.
- -r if the file is readable.
- -w if the file is writable.

You can use multiple conditions with and/or notations:

- `&&`
- `||`

Here is a demonstration of some chained conditions; note you can also use a double bracket syntax for a more simple expression:

```bash
var=1
if [ $var -gt 1 ] && [ Documents/file.txt -w ]; then
    echo "Memory states greater than 1 with a value of $var \n and the files are writable."
fi

if [[ 2 -gt 1 && Documents/file.txt -w ]]; then
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
```

## `case` statements

Case statements are light in syntax than `if` statements. This is often useful when you have multiple conditions and actions to take. These can technically be done with `if` statements but case statements are useful.

```bash
# case statement
case "string_or_var" in # pass string or variable; even a nested SHELL
    CONDITION_1)
    code_command;;
    CONDITION_2)
    code_command;;
    *)
    DEFAULT_CONDITION code_command;;
esac # case backwards
```

Here is an example demonstrating an `if` statement refactored as a `case` statement:

```bash
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
case $1 in
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
```

## `function`s in BASH

Functions allow you to write code that can be re-used - modular code. There are two main syntax for functions in BASH as follows:

```bash
func_name () {
    # code goes here
    return # something
}

function func_name () { # parenthesis optional here
    # code goes here
    return # something
}
```

In order to pass arguments into functions is very simple. Use the dollar `$` sign:

The same system as shown above applies:

- `$1 ... $n`
- `$@`/`$*` arguments in `ARGV`.
- `$#` number of elements.

Note that when building functions you must take into consideration the scope of your code; local and global. All variables in BASH are global by default. Beware as this might be unfamiliar. 

To restrict a scope use the `local` keyword:

```bash
function a_func () {
    local var="Something" # restrict to local scope
}
```

### `return` keyword

In BASH the function returns based on if the function was successfully executed `O` or not `1-255`. This is captured in the global variable `$?`.

We have some options:

1. Assign results to a global variable.
1. `echo` in the last line and capture it in a variable using a nested SHELL.

```bash
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
```

# Automation and `cron` jobs

You can schedule a script to be run on a schedule. This is done through a utility called `cron`. This helps to optimise your time and resources. The use `cron` is an essential skill.

`cron` has been a part of the `unix` systems since about the 70's. The name cron comes from the Greek "chronos". 

It works with something called a `crontab`. This is a file that contains jobs called `cronjobs` which directs the programme as to what to run and when.

Call `crontab -l` in order to see what jobs are schedule by the user.

You can get an idea of how `cronjobs` work by the following structure:

```txt
# ┌───────────── minute (0 - 59)
# │ ┌───────────── hour (0 - 23)
# │ │ ┌───────────── day of the month (1 - 31)
# │ │ │ ┌───────────── month (1 - 12)
# │ │ │ │ ┌───────────── day of the week (0 - 6) (Sunday to Saturday;
# │ │ │ │ │                                   7 is also Sunday on some systems)
# │ │ │ │ │
# │ │ │ │ │
# * * * * * <command to execute>
```

*Source: [wikipedia - cron](https://en.wikipedia.org/wiki/Cron)*

**Note in some `unix` systems Sunday can be designated as 0 not 7.**

In a `crontab` file you have many jobs - one per line. The starts are one for each unit of time: min, hour, day of month, month, day of the week. Note that you replace a placeholder start with what values you desire. Here is a quick example:

```cron
15 2 * * * bash script.sh
```

The minutes star is set to fifteen, this means fifteen minutes after the hour has set 0. Hours star is set to two, this means the second hour after 0 *eg.* 0200 (2 a.m.) The last are not set and left to stars so that means every day and month.

This means that the job runs every day at 0215 (2:15 a.m.).

You can run programmes at `t` time intervals:

```cron
10,20,40 * * * * bash script.sh
```

The above job would run at 10, 20, and 40 minutes every hour. You can also use a `/` for every `t` increment.

```cron
*/5 * * * * bash script.sh
```

The above would run every five minutes every day every hour.

## To schedule a `cron` job

1. Use the command `crontab -e` to edit the `cronjobs` list. 
1. Create the job's command: `*/5 * * * * bash script.sh`.

To check that the job is scheduled and running check with `crontab -l`.

