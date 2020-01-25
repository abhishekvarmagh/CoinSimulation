#! /bin/bash

echo "Welcome to Coin Simulator"

if [ $(( RANDOM%2 )) -eq 1 ]
	then
		echo "Head"
	else
		echo "Tail"
fi
