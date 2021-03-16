declare -a my_array
my_array=(1 2 3)

echo ${my_array[2]} # prints 3

my_array[1]=10
echo ${my_array[@]}
