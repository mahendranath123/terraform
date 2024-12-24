#!/bin/bash

read -p " enter a name to create a account for user "  name
 #sudo userdel  -fr $name
 sudo useradd -m $name
 echo "user is added sucessfully"
 echo "arguments $0 is   $1 "
