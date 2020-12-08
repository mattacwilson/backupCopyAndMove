#! /bin/bash
#Matthew Wilson EC1841586
#
#
#
#Loop until input is Q
while [ "$MENU_INPUT" != "Q" ]
do

#PRINT MENU
echo
echo '======================'
echo '1. Backup script file'
echo '2. Info'
echo '3. Copy'
echo '4. Move'
echo 'Q. Quit'
echo '======================'
echo 'Please input selection'


#READ INPUT
read MENU_INPUT

#ACT ON INPUT
case $MENU_INPUT in

#Create backup copy of this script
1)
#Assign variables for script backup
scriptfile='Ass2_MatthewWilson.sh'
scriptbackupfile=$scriptfile'_backup_'$(date +"%d_%m_%Y")'.sh'
#Test to see if scriptfile exists. Print error if not.
echo "sourcefile= " $scriptfile
echo "destination file= " $scriptbackupfile


if test -f $scriptfile
then
	cp $scriptfile $scriptbackupfile

else
	echo 'Error, file does not exist or is not a normal file.'
fi

#Test to see if created file exists. Print error if not
if test -f $scriptbackupfile
then
	echo $scriptbackupfile 'has been created and is a normal file.'
else
	echo 'Has not been created or is not a normal file.'
fi
;;

#Info Menu, saves to log_dir. Generic system/user info
2)
#Gather information and store in variables
who=$(who)
host=$(hostname)
path=$(echo ~)
user=$(whoami)
date=$(date)
logfile='log_dir/log_file_'$(date +"%d_%m_%Y")'.txt' 
 
#Print info to file
echo 'Login: ' $who > $logfile
echo 'Host: ' $host >> $logfile
echo 'Directory: ' $path >> $logfile
echo 'Shell: ' $SHELL >> $logfile

#Check if file created and print content. Else print error.
if test -e  $logfile
then
	echo $logfile 'has been created, contents below'

	cat $logfile
else 
	echo 'Error creating file'
fi

;;
#Create copy of a file
3)

#Ask for file name
echo 'Name of file to copy'
read sourcefile
#Ask for destination directory
echo 'Destination directory to copy to'
read destinationdirectory

#Check if source file exists
if test -f $sourcefile
then
	#Check if destination directory exists
	if test -d $destinationdirectory
	then
		#If both exist then copy file
        	cp $sourcefile $destinationdirectory
	else
		echo 'Directory does not exist'
	fi

else
        echo 'Error, file does not exist or is not a normal file.'
fi

#Checking to confirm copy of the file and show file has been created
if test -e $destinationdirectory/$sourcefile
then
        echo $destinationdirectory/$sourcefile ' A copy has been created.'
else
        echo 'Error has not been copied successfully.'
fi
;;
#Move file
4)

#Ask for file name
echo 'Name of file to move'
read sourcefile
#Ask for destination directory
echo 'Destination directory to move file to'
read destinationdirectory

#Check if source file exists
if test -f $sourcefile
then
	#Check if destination directory exists
        if test -d $destinationdirectory
        then
		#Move source file to destination directory
                mv $sourcefile $destinationdirectory
        else
                echo 'Directory does not exist'
        fi

else
        echo 'Error, file does not exist or is not a normal file.'
fi
#Confirm move of the file and show file has been created

if test -e $destinationdirectory/$sourcefile
then
        echo $destinationdirectory/$sourcefile ' File successfully moved.'
else
        echo 'Error has not been moved successfully.'
fi


;;
#Print quit
Q) echo 'Bye!';;

esac

done
