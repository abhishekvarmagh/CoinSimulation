#! /bin/bash

function flipCoin()
{
	for (( i=1; i<=$1; i++ ))
	do
		side=""
		for (( j=1; j<=$2; j++))
		do
			if [ $(( RANDOM%2 )) -eq 1 ]
			then
				side+=H
			else
				side+=T
			fi
		done
		updateCount $side
	done
}

function updateCount()
{
	coin[$1]=$((${coin[$1]}+1))
}

function calculatePercentage()
{
	for i in ${!coin[@]}
	do
		coin[$i]=$(( coin[$i]*100/noOfFlip ))
	done
	echo "Keys are ${!coin[@]}"
   echo "Percentage ${coin[@]}"
}

declare -A coin
read -p "Enter number of time you want to flip a coin : " noOfFlip
read -p "Enter number of coin you want to flip : " noOfCoin
flipCoin $noOfFlip $noOfCoin
calculatePercentage
