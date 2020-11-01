rm -rf ~/test
d=$(date +"%F_%R")
host="www.net_nikogo.ru"
message="catalog test was created successfully"
pingError="cant ping host"

mkdir ~/test 2>/dev/null && { echo "$message" >> ~/report ; touch ~/test/$d; }
ping -q -c 1 "$host" 2>>/dev/null || { echo "$d $pingError">>~/report; }
