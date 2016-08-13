#! /bin/bash
matches=$(goobook dquery $* |tr -d -|grep -E [0-9]{9} )

name=$*

numbers=$(echo -e $matches |sed 's/[^0-9 ]*//g' |tr " " "\n")

echo -e "$numbers" | nl

echo "Pick an Number any Number"

read whatnumber

contact=$(echo -e "$numbers" | sed -n "$whatnumber"p | sed "s/^1//")

output=$(echo "add 0 _1"$contact $name)

echo "$output" | pbcopy

echo "$output"
