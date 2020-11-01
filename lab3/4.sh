nice -n 19 bash 4_1.sh&pid1=$!
nice -n 5 bash 4_1.sh&pid2=$!
nice -n 5 bash 4_1.sh&pid3=$!

echo "1) $pid1"
echo "2) $pid2"
echo "3) $pid3"

echo "kill $pid3" | at now +1 minute

echo "kill $pid2 $pid1" | at now +2 minute
