#! /bin/bash

#loop forever
while [$a = $a]
do
#grab unorganised can 2E4 from candump and cut the beggining off
dirtycan=$(timeout 1 candump -n 1 vcan0,2E4:DFFFFFFF | cut -d "]" -f2)
#take the previous can and remove the spaces
oldcan=${dirtycan//[[:blank:]]/}
#split the can you grabbed and split it into 5 sections, This is a 5 bit example, add more as needed.
b1=$(echo $oldcan | cut -b 1-2)
b2=$(echo $oldcan | cut -b 3-4)
b3=$(echo $oldcan | cut -b 5-6)
b4=$(echo $oldcan | cut -b 7-8)
b5=$(echo $oldcan | cut -b 9-10)
#print out all 5 sections to make sure everything works
echo $b1$b2$b3$b4$b5
#this is where you would edit the canbus code if you want.
#/////------------------////
#b1="0A"
#b2="FF"




#/////-----------------/////

#Send the canbus code
cansend vcan0 1E2#$b1$b2$b3$b4$b5

done
#return to the start


#cansend can0 01a#11223344AABBCCDD --example
#https://github.com/Matthewklop/EasyCan
