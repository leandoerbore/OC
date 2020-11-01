ps -u user | wc -l > first.txt
ps -u user -o pid,command | awk '{print $1":"$2}' >> first.txt
