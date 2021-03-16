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
