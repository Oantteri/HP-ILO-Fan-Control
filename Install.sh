#!/bin/bash
echo "You are about to Download/Install the required items for the HP ILO Fan control, "
echo "Do you accept that your are about to install? [yes] or [no] :"
read input
if [ $input = yes ] ; then
# agreement confirmed
# refresh OR create agreement file status
        echo "Installing required apt packages sshpass, lm-sensors and wget"
        apt install sshpass wget lm-sensors -y
        echo "Installed required apt packages"
        cd /
        echo "Downloading ILO_250 for ROM Upgrade"
        echo "Downloading to / directory"
        wget https://github.com/That-Guy-Jack/HP-ILO-Fan-Control/tree/main/Files/ilo_250
        echo "Finished Download"
        echo "Making autofan.service"
        cd /etc/systemd/system/
        wget https://raw.githubusercontent.com/That-Guy-Jack/HP-ILO-Fan-Control/main/Files/autofan.service
        echo "Finished making autofan.service"
        echo "Preping latest autofan.sh"
        cd /
        echo "Downloading Latest autofan.sh"
        wget https://raw.githubusercontent.com/That-Guy-Jack/HP-ILO-Fan-Control/main/Files/autofan.sh
	echo "Do you you want to add the script to crontab? [yes] or [no] :"
	read input
	if [ $input = yes ] ; then
	crontab -l 2>/dev/null; echo "*/1 * * * * /bin/bash /autofan.sh >> /tmp/cron.log"
	echo "Added the autofan to be run at every minute to crontab."       
        echo "Downloaded autofan.sh Change Placeholders with correct info"
        echo "Please Visit the Github Page to Follow Instructions"
        echo "https://github.com/That-Guy-Jack/HP-ILO-Fan-Control"
	exit 1
	else
echo " :( exitting"
   exit 1
   fi
