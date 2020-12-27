filePath="/var/log/anaconda/X.log"
awk '{ if ($3=="(WW)") print $0}' "filePath" | sed "s/(WW)/Warning/p">"full.log"
awk '{ if ($3=="(II)") print $0}' "filePath" | sed "s/(II)/Information/p">"full.log"

