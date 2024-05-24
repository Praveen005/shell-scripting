#!/bin/bash

NAME="Prateek"

# if condition
if [ "$NAME" ]
then
    echo "My name is $NAME"
fi

CITY=""

# if-else condition
if [ "$CITY" ]
then
    echo "My city is $CITY"
else
    echo "City name has not been provided!"
fi

