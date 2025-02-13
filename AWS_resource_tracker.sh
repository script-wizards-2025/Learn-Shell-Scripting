#!/bin/bash

###############################################
# Author :- Ritik Gupta 
# Date   :- 13 Feb 2025
# Version:- v1 
#
# This script will report the AWS resource usage
#
################################################ 

#set -x 

echo " listing all the s3 buckets here " 

aws s3 ls 

echo " listing all the instances " 

aws ec2 describe-instances| jq '.Reservations[].Instances[].InstanceId'

echo " listing all the iam users " 

aws iam list-users

