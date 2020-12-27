man bash | tr "[:upper:]" "[:lower:]" | tr '[:punct:]' ' ' |
	tr ' ' '\n' | sed '/^$/d' | sed '/..../!d | sort |
	uniq -c | sort -rnk1 | head -3
