#! /bin/bash


while [$a = $a]
do
dirtycan=$(timeout 1 candump -n 1 vcan0,2E4:DFFFFFFF | cut -d "]" -f2)
oldcan=${dirtycan//[[:blank:]]/}
b1=$(echo $oldcan | cut -b 1-2)
b2=$(echo $oldcan | cut -b 3-4)
b3=$(echo $oldcan | cut -b 5-6)
b4=$(echo $oldcan | cut -b 7-8)
b5=$(echo $oldcan | cut -b 9-10)
echo $b1$b2$b3$b4$b5
cansend vcan0 1E2#$b1$b2$b3$b4$b5
done

#cansend can0 01a#11223344AABBCCDD --example
#https://github.com/Matthewklop/EasyCan
