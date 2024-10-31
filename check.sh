#/bin/bash
retries=3
interval=5
let num=retries; 
while (($num>=0)); do
  if [ $num -lt $retries ]; then sleep $interval; fi;
  PID1=`pgrep nginx|wc -l`; sleep 1;
  PID2=`pgrep frpc|wc -l`; sleep 1;
  if [ $PID1 -eq 0 ] || [ $PID2 -eq 0 ];
    then let num=num-1;
  elif [ $num -lt $retries ];
    then let num=num+1;
  fi; 
done
echo "stop" ; exit 1;
