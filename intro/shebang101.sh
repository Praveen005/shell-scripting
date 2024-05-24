#!/bin/bash
echo "Hello Ji"
MY_NAME="Praveen"
echo "My name is $MY_NAME!"
# You can enclose the variable name in curly braces
MY_CITY="Gaya"
echo "I live in ${MY_CITY}."


# We can assign the output of a command to a variable, enclose the command in parentheses preceded by $
SERVER_NAME=$(hostname)
echo "You are running script on $SERVER_NAME"

# We can enclose the command in backtick as well :  legacy syntax 
SERVER_NAME=`hostname`
echo "You are running script on $SERVER_NAME"
