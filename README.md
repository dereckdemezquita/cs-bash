# cs-bash

A primer on BASH scripting and Linux systems, will make it into a course for: [derecksnotes.com](www.derecksnotes.com)

# Bash quick start; basic commands

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
ls -la > list-of-files.txt # redirect outputs
wc -l text.csv # count word/characters/lines
sort -r -n -b # sort in reverse numerical order and ignore leading white spaces
uniq # gets unique non-adjacent data
echo $SHELL # print a variable (preceed with $ sign)
test="A value or file input of some sort." # define a variable
for item in  list1 list2 list3; do echo $item; done # for loop
```

`|` the pipe command separator allows the passsage of one output to another command. Chains can be built in this way for example: `ls -l | grep ".*\.file-extension` that command allows one to find all files from `ls -l` that have the given extension.

# Introduction to BASH scripting

Before computers had GUIs they had command-line interfaces. The shell is an interface through which we can run other programmes and points their output to a human readable form; it then prompts for the next command. 

With shell scripting you can automate repetitive tasks and more.

*Note you can use the tab key to autocomplete file and directory names.*

The filesystem manages files and directories in the computer system. These are defined by absoulute paths to the system's root. The root being the lowest level directory holding all other system files designated by `/`.

A file and directory can be defined as such: 

- `/home/usr/username/Documents/`
- `/home/usr/username/Documents/somefile.txt`

## Basic tips

- Never use spaces in file names; use underscores `_`.
- `history` prints a list of recent commands; then use `!n` to re-use a specific command by index.

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

## `grep` text selection

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

- `-c` print the number of matching lines per file.
- `-h` don't print names of files when searching.
- `-i` ignore capitalisations ("Name" and "name" treated as matches).
- `-l` print the names of files containing matches but not the matches.
- `-n` print line numbers for matching lines.
- `-v` invert the match; only show lines that don't match.

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

## Storing variables

In order to create a variable use the following syntax.

```bash
test="A value or file input of some sort."
echo $test
A value or file input of some sort.
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

## Getting help

Use the `man command-name` command to get help for a specific command. For example `man ls` would get you the documentation in a paginated view for `ls`. 

Note the following for help:

- `NAME` tells you what the command does.
- `SYNOPSIS` list all possible flags.
- `[...]` are optional flags.
- `|` separates alternatives.
- `...` arguments that can be repeats.


