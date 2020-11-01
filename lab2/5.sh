file="fouth.txt"

sum=0
count=0
p_ppid=-1

while read line
do
	ppid=$(echo $line | tr -d "[a-z][A-Z]_=:" | awk '{print $2}')
	avg=$(echo $line | tr -d "[a-z][A-Z]_=:" | awk '{print $3}')

	if ((p_ppid != -1 && ppid != p_ppid))
	then
		echo Average_Sleeping_Children_of_ParentID=$p_ppid is $(echo "scale=3; $sum/$count" | bc | awk '{printf "%f", $0}')
		sum=0
		count=0
	fi
	echo $line
	sum=$(echo "scale=3; $sum+$avg" | bc)
	p_ppid=$ppid
	((count++))
done < $file > fifth.txt

echo Average_Sleeping_Children_of_ParentID=$p_ppid is $(echo "scale=3; $sum/$count" | bc | awk '{printf "%f", $0}') >>fifth.txt
