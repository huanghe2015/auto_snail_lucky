#!/usr/bin/ksh

# Directory in which you want to detect file change
DIRECTORY=/data/data/com.eg.android.AlipayGphone
cd $DIRECTORY

list1=`(ls -ltr)`
echo "----- List 1 -----"
echo "${list1}"

while true; do

echo "Sleeping 5 sec!"
sleep 5

list2=`(ls -ltr)`
echo "----- List 2 -----"
echo "${list2}"

if [[ $list1 != $list2 ]]
then
	echo "----------------------- File changed -----------------------"
	diff <(echo "${list1}") <(echo "${list2}")
fi

list1="${list2}"

done