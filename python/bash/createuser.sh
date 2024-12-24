#!/bin/bash

read -p "enter a username" username 

echo "you entered $username  "


sudo useradd  -m $username

echo " user is added"

echo "argument $0 and  $1 "
