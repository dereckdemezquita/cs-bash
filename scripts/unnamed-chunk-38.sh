declare -a my_array_a
my_array_a=(1 2 3 4 5 6 7 8 9 10)
declare -a my_array_b
my_array_b=(10 11 12 13 14 15 16 17 18 19 20)

declare -a my_array_final=`echo "scale=3; (${my_array_a[1]} + ${my_array_b[2]}) + ${my_array_b[3]} / 3" | bc`

echo ${my_array_final[@]}
