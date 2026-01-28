#!bin/bash


## variables with hardcode values
#P1=Prashanth
#P2=Reddy

#Dynamic arguments from command line
P1=$1
P2=$2

echo ${P1} : hello how are you ${P2}
echo ${P2} : i am good $P1, how about you

echo -e "\n"

#special variables in shell

echo all args passed to script : $@
echo number of args passed to script : $#
echo current user : $USER
echo current user home directory path : $HOME
echo process id of scriot : $$
sleep 8 &
echo recent background process id : $!
echo all args passed to script : $*
echo script name : $0
echo -e "\n"

#read from user
echo enter user name :
read -p "" USER_NAME

echo user name is : $USER_NAME
echo -e "\n"


echo enter password :
read -sp "" PASSWORD

echo password is :
echo -e "\n"

echo success

echo -e "\n"

#Get the dynamic value and assign it to variable
START_TIME=$(date +%s)

sleep 4

END_TIME=$(date +%s)

RUN_TIME=$(($END_TIME-$START_TIME))
echo excuted time : $RUN_TIME in seconds

echo -e "\n"


#data types
#strings and integers

x=10
y=prashant

sum=$(($x+$y))

echo sum is : $sum
echo -e "\n"


#Array

FRUITS=("apple" "banana" "orange")

#to print all values from array
echo Fruits are: ${FRUITS[@]}

#access values by index
echo First fruit is: ${FRUITS[0]}
echo Second fruit is: ${FRUITS[1]}
echo Third fruit is: ${FRUITS[2]}

echo -e "\n"



#conditions in shell

NUMBER=100

# -gt -lt -eq -ne 

#if open block
if [ $NUMBER -gt 100 ]; then
	echo $NUMBER is greater than 100
elif [ $NUMBER -eq 100 ]; then
	echo $NUMBER is equals to 100
else
	echo $NUMBER is less than 100
fi #if closing block


