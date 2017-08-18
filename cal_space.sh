#! /bin/ksh
#####################################################################
# This script calculates the disk usage of the directory it runs in
# and sends an email if the usage is greater than 1 GB
#####################################################################


##The directory for which space has to be calculated
echo "Please enter the directory for which you need to calculate the space"
read dir_name
echo " The directory is $dir_name"

##Calculating the disk space left on the directory in KB
size=$(du -sk $dir_name | awk '{print $1}')

if [ $size -le 1048576 ]
then
   echo "The disk space left on $dir_name is ${size}K which is less than 1GB." | mailx -s"Disk space shortage" "aditi.i.sharma@accenture.com"
else
   return 0
fi
