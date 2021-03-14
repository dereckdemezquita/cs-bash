declare -a my_array
my_array=(1 2 3 4 5 6 7 8 9)
my_array+=(10) # note the use of parenthesis

echo ${my_array[@]}

my_array+=10 # not using parenthesis yields different results

echo ${my_array[@]}
