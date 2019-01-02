#!/bin/bash

while true
do
#Syntax to declare a simple function
print_date()
{
echo "Today is `date +"%A %d %B %Y (%r)"`"
return
}
#Calling the above function
print_date
done
