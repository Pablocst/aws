#!/bin/bash

Ec2IDsArray=()
declare -i counter=0

for i in `aws ec2 describe-instances | awk -F 'InstanceId' '{print $2}' | cut -f1 -d"," | cut -f2 -d" " | awk '!/^[[:space:]]*$/' | tr -d "\""`; 
do 
    Ec2IDsArray[$counter]=$i;
    let counter++
done

for i in "${Ec2IDsArray[@]}"
do
    aws ec2 stop-instances --instance-ids --no-cli-pager $i
done