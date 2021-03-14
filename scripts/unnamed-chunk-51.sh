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
