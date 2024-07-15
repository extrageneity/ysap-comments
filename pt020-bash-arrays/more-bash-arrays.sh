#!/usr/bin/env bash

my_array=(a b c "d e")

echo "\${#my_array[@]} is ${#my_array[@]}"

my_array+=(f g h "i j")
echo "after my_array+=(f g h \"i j\"), \${#my_array[@]} is now ${#my_array[@]}"


count=0;
for field in "${my_array[@]}"
do
	echo "field $((++count)) with \"\${my_array[@]}\" is ${field}, which is \${my_array[$((count-1))]}"
done

echo

count=0;
for field in ${my_array[*]}
do
	echo "field $((++count)) with \${my_array[*]} is ${field}, which is \${my_array[$((count-1))]}"
done

echo

count=0;
for field in "${my_array[*]}"
do
	echo "field $((++count)) with \"\${my_array[*]}\" is ${field}"
done

echo

IFS=":-"
count=0;
for field in "${my_array[@]}"
do
	echo "field $((++count)) with \"\${my_array[@]}\" and IFS=${IFS} is ${field}"
done

echo

count=0;
for field in "${my_array[*]}"
do
	echo "field $((++count)) with \"\${my_array[*]}\" and IFS=${IFS} is ${field}"
done

IFS=''
count=0;
for field in ${my_array[@]}
do
	echo "field $((++count)) with \${my_array[@]} and IFS='' is ${field}, which is \${my_array[$((count-1))]}"
done

echo

count=0;
for field in ${my_array[*]}
do
	echo "field $((++count)) with \${my_array[*]} IFS='' is ${field}, which is \${my_array[$((count-1))]}"
done

echo

IFS=$' \t\n'

array2[0]="this is the first element"
array2[3]="this is the next element"

echo "\${#array2[@]} is ${#array2[@]}"
for key in "${!array2[@]}"
do
	echo "\${array2[$key]} is '${array2[key]}'"
done

echo "\${array2[-1]} is '${array2[-1]}'"
echo "\${array2[-2]} is '${array2[-2]}'"
echo "\${array2[-4]} is '${array2[-4]}'"

unset array2[0]
array2+=("this is the added element")

echo "ran unset array2[0]"
echo "also added an element to array2 with +="

echo "\${#array2[@]} is ${#array2[@]}"
for key in "${!array2[@]}"
do
	echo "\${array2[$key]} is '${array2[key]}'"
done

echo "\${array2[-1]} is now '${array2[-1]}'"
echo "\${array2[-2]} is now '${array2[-2]}'"
echo "\${array2[-4]} is now '${array2[-4]}'"

a=(a b c)
x=2

echo "set a with a=(a b c)"
echo "with x=$x, \${a[x]} is ${a[x]}"
echo "with x=$x, \${a[x-2]} is ${a[x-2]}"
