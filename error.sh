i="time:"
j=0
touch error_timestamps.txt
grep -h "ERROR" errorLog.txt >> error.txt
while read line
do
	i=${line:1:22}
	if grep -Fxq "$i" error_timestamps.txt
	then
		continue
	fi
	echo "$i">> error_timestamps.txt
	grep -h "$i" errorLog.txt >> "timestamp".txt
done < error.txt

