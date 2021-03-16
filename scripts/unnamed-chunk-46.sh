declare -a my_array
my_array=(1 2 3 4 5 6 7 8 9 10)

echo ${my_array[@]:2:5}
