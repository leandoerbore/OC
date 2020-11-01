WasCreate()
{
listFileSource=$(ls ~/source)
cp -r ~/source/* ~/Backup-$currentDate/
echo "Directory Backup-$currentDate was created with files: " >> ~/backup-report
echo "$listFileSource" >> ~/backup-report
}

WasNot()
{
flag=0
listFileSource=$(ls ~/source)
for i in $listFileSource;do
	currentSize=$(wc -l ~/source/$i | awk '{printf $1}')
	lastSize=$(wc -l ~/Backup-$currentDate/$i 2>/dev/null | awk '{printf $1}')
	if [[ -z $lastSize ]];then
		if [[ flag -eq 0 ]];then
			echo "Directory Backup-$currentDate was changed" >> ~/backup-report
			flag=1
		fi
		cp ~/source/$i ~/Backup-$currentDate/
		echo "$i is add" >> ~/backup-report
		continue
	fi

	if [[ currentSize -ne lastSize ]]; then
		mv ~/Backup-$currentDate/$i ~/Backup-$currentDate/$i.$currentDate 2>/dev/null
		cp ~/source/$i ~/Backup-$currentDate/
		if [[ flag -eq 0 ]];then
			echo "Directory Backup-$currentDate was changed" >> ~/backup-report
			flag=1
		fi
		echo "$i : $i.$currentDate" >> ~/backup-report
	fi
done
}

currentDate=$(date +"%F")
#BackupDir=$(ls ~/ | grep -E "^Backup-" | sort -n | tail -1 | cut -d- -f 2,3,4)
BackupDir=$(ls ~/ | grep -E "^Backup-" | cut -d- -f 2,3,4 | sort -k2 | head -1)
if ! [[ -z $BackupDir ]] && [[ -d ~/Backup-$BackupDir ]];then
	lifeBackupdir=$(date -d $BackupDir +"%s")
	lifeCurrentDate=$(date -d $currentDate +"%s")

	difDate=$(echo "($lifeCurrentDate-$lifeBackupdir)/60/60/24" | bc | awk '{printf "%d", $0}')
	if [[ difDate -gt 7 ]];then
		mkdir ~/Backup-$currentDate
		echo "YES!"
		WasCreate
	else
		echo "NO!"
		WasNot
	fi
else
	mkdir ~/Backup-$currentDate
	WasCreate
fi
