#! /bin/bash

echo "Coin Simulator"

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

function sortingPercentage()
{
	echo "Win Combination Percentage"
	for i in ${!coin[@]}
	do
		echo "$i ${coin[$i]}"
	done | sort -k2 -rn | head -1
}

read -p "Wheater you want to paly [y/n] : " input
while [ $input == "y" ]
do
	declare -A coin
	read -p "Enter number of time you want to flip a coin : " noOfFlip
	read -p "Enter your choice : 1) Singlet 2) Doublet 3) Triplet : " choice
	case $choice in
		1)
			noOfCoin=1
			;;
		2)
			noOfCoin=2
			;;
		3)
			noOfCoin=3
			;;
		*)
			echo "Invalid Choice"
			;;
	esac
	flipCoin $noOfFlip $noOfCoin
	calculatePercentage
	sortingPercentage
	unset coin
	read -p "Do you want continue [y/n] : " input
done
