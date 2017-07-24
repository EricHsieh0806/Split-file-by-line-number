#!/bin/bash
START=$1  ## start line number
INTERVAL=$2  ## per file line number
END=$( sed -n '$=' $3 )  ## find the file all line number
FILENAME=$3  ## tab file name
echo Line count:$END Filename:$FILENAME
UNIX_F_NAME=${FILENAME//.tab/.txt}  ## replace fileiname extension
echo "Begin transfer dos file to unix"
dos2unix -k -n $FILENAME $UNIX_F_NAME  ## transfer dos file to unix format
echo $UNIX_F_NAME
HEADER=$( cat $UNIX_F_NAME | head -n 1 )  ## get the file header line
echo "$HEADER"
## save $START, just in case if we need it later ##
i=$START
v=$INTERVAL
e=$END-1
fc=1
while [[ $i -le $e ]]  ## for loop to seprate file by line number
do
    echo "$i" "$((i+v-1))"
    file_order=${FILENAME//.tab/}_$( echo "$fc" | awk '{printf "%03d", $0}' )  ## new file name by order number. e.g. 001, 002, etc.
    sh split.sh $i $((i+v-1)) $file_order "$UNIX_F_NAME" "$HEADER"
    ((i = i + v))  
    ((fc = fc + 1))
done
rm $UNIX_F_NAME  ## rm the temporary txt file

