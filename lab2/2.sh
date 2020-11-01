ps axo pid,command | grep "/sbin/" | awk '{print "PID:"$1}'
