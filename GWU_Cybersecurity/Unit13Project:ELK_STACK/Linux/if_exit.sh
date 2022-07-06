#!/bin/bash
# IF $x is equal to $y, run the echo command

if [ $UID != 1001 ]
then
echo "Your UID is wrong!"
fi

