#/bin/sh

retries=3
interval=5
num=$retries; 
while test $num -ge 0; do
  if test $num -lt $retries; then sleep $interval; fi;
  PID1=`pgrep nginx|wc -l`; sleep 1;
  PID2=`pgrep frps|wc -l`; sleep 1;
  if test $PID1 -eq 0 || test $PID2 -eq 0;
  then num=$((num-1));
  elif [ $num -lt $retries ];
  then num=$((num+1));
  fi; 
done
echo "stop" ; exit 1;