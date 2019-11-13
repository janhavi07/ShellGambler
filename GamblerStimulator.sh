#!/bin/bash -x

#VARIABLES
stake=0
value=0
resignVal=0
val=0
win=0
lost=0
#INPUTS
read -p "Enter the number of days : " noOfDays
read -p "Enter the number of Games : " noOfGames
read -p "Enter the % to resign for the day " resignValue

declare -A wonlost
function resignLow()
{
	resignVal1=$(( ($resignValue*$stake)/100 ))
	Val1=$(( $resignVal1 + $stake ))
	echo $Val1
	return $Val1
}

function resignHigh()
{
	resignVal2=$(( ($resignValue*$stake)/100 ))
        Val2=$(( $stake - $resignVal2 ))
        echo $Val2
        return $Val2

}

for (( i=1; i<=$noOfDays; i++ ))
do
	stake=$(( $stake +100 ))
	for(( j=1; j<=$noOfGames; j++ ))
	do	
		echo nOFDAYS $i
		bet=$(( $bet +1 ))
		winLose=$(( RANDOM%2 ))
		echo $winLose
		value1="$( resignLow )"
		value2="$( resignHigh )"
		if [ $value1 -gt $stake ] && [ $value2 -lt $stake ]
		then
			echo "He resigns for the day"
			break
		else

			if [ $winLose -eq 1 ]
			then
				wonlost[win]=$(( ${wonlost[win]} +1 ))
				stake=$(( $stake +1 ))
			else
				wonlost[lost]=$(( ${wonlost[lost]} +1 ))
				stake=$(( $stake -1 ))
			fi
		fi
		if [ $i -eq 20 ]
		then
			echo ${!wonlost[@]}
		fi

	done
done
echo stake : $stake
echo bets : $bet
#echo value : $value
