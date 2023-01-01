#!/bin/bash

# GET new messages from S3(bucket-name[replace this with your bucket]) and save to newemail/ directory:
aws s3 cp \
   --recursive \
   s3://bucket-name/ \
   /home/wonder/s3-emails/newemail/  \
   --profile myaccount

# Set location variables:
tmp_file_dir=/home/wonder/s3-emails/newemail/*
base_dir=/home/wonder/s3-emails/emails/

# Create new directory to store today's messages:
today=$(date +"%m_%d_%Y")
[[ -d ${base_dir}/"$today" ]] || mkdir ${base_dir}/"$today"

# Give the message files readable names:
for FILE in $tmp_file_dir
do
   mv $FILE ${base_dir}/${today}/email$(rand)
done

# Open new files in VScode:
for NEWFILE in ${base_dir}/${today}/*
do
   code $NEWFILE
done