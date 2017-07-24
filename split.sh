now=`date`
echo "Start job $1 to $2 at : $now"
sed -n "$1,$2p" $4 > $3_$1_$2.tab
if test $1 -ne 1; then gsed -i "1i$5" $3_$1_$2.tab; fi;
#gsed -i "1i$4" $3_$1_$2.taa
#cat $3_$1_$2.tab | tr -d '\000' > $1_$2.taa
#rm $3_$1_$2.tab
now=`date`
echo "$3_$1_$2.tab be create at $now"
