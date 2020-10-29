
#!/bin/bash
#
# crontab -l > mycron
# echo "#" >> mycron
# echo "# At every 2nd minute" >> mycron
# echo "*/1 * * * * /bin/bash /autofan.sh >> /tmp/cron.log" >> mycron
# crontab mycron
# rm mycron
# chmod +x /autofan.sh
#
PASSWORD="your password"
USERNAME="your username"
ILOIP="your ilo ip"
T1="$(sensors | sed -rn 's/.*Core 0:\s+.([0-9]+).*/\1/p')"

echo "==============="
echo "CPU 1 Temp $T1 C"
echo "==============="

if [ $T1 -gt 67 ]
   then
        sshpass -p $PASSWORD ssh $USERNAME@$ILOIP 'fan p 0 max 39'
        sshpass -p $PASSWORD ssh $USERNAME@$ILOIP 'fan p 1 max 39'
        sshpass -p $PASSWORD ssh $USERNAME@$ILOIP 'fan p 2 max 39'
        sshpass -p $PASSWORD ssh $USERNAME@$ILOIP 'fan p 3 max 39'
elif [ $T1 -gt 58 ]
    then
        sshpass -p $PASSWORD ssh $USERNAME@$ILOIP 'fan p 0 max 30'
        sshpass -p $PASSWORD ssh $USERNAME@$ILOIP 'fan p 1 max 30'
        sshpass -p $PASSWORD ssh $USERNAME@$ILOIP 'fan p 2 max 30'
        sshpass -p $PASSWORD ssh $USERNAME@$ILOIP 'fan p 3 max 30'
elif [ $T1 -gt 54 ]
    then
        sshpass -p $PASSWORD ssh $USERNAME@$ILOIP 'fan p 0 max 28'
        sshpass -p $PASSWORD ssh $USERNAME@$ILOIP 'fan p 1 max 28'
        sshpass -p $PASSWORD ssh $USERNAME@$ILOIP 'fan p 2 max 28'
        sshpass -p $PASSWORD ssh $USERNAME@$ILOIP 'fan p 3 max 28'
        elif [ $T1 -gt 52 ]
    then
        sshpass -p $PASSWORD ssh $USERNAME@$ILOIP 'fan p 0 max 24'
        sshpass -p $PASSWORD ssh $USERNAME@$ILOIP 'fan p 1 max 24'
        sshpass -p $PASSWORD ssh $USERNAME@$ILOIP 'fan p 2 max 24'
        sshpass -p $PASSWORD ssh $USERNAME@$ILOIP 'fan p 3 max 24'
elif [ $T1 -gt 50 ]
    then
        sshpass -p $PASSWORD ssh $USERNAME@$ILOIP 'fan p 0 max 22'
        sshpass -p $PASSWORD ssh $USERNAME@$ILOIP 'fan p 1 max 22'
        sshpass -p $PASSWORD ssh $USERNAME@$ILOIP 'fan p 2 max 22'
        sshpass -p $PASSWORD ssh $USERNAME@$ILOIP 'fan p 3 max 22'
    else
        sshpass -p $PASSWORD ssh $USERNAME@$ILOIP 'fan p 0 max 20'
        sshpass -p $PASSWORD ssh $USERNAME@$ILOIP 'fan p 1 max 20'
        sshpass -p $PASSWORD ssh $USERNAME@$ILOIP 'fan p 2 max 20'
        sshpass -p $PASSWORD ssh $USERNAME@$ILOIP 'fan p 3 max 20'
fi
