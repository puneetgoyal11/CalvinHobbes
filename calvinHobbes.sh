#!/bin/zsh

downloadMonth()
{
	year=$1
	month=$2
	zero=0
	if [ $month -lt 10 ];
	then
		monthFormatted=0$month
	else
		monthFormatted=$month
	fi

	for day in {1..31}
	do
		if [ $day -lt 10 ]; 
		then
			wget --append-output=/tmp/calvinHobbesLogs.txt http://marcel-oehler.marcellosendos.ch/comics/ch/$year/$monthFormatted/$year$monthFormatted$zero$day.gif 
		else
			wget --append-output=/tmp/calvinHobbesLogs.txt http://marcel-oehler.marcellosendos.ch/comics/ch/$year/$monthFormatted/$year$monthFormatted$day.gif 
		fi
	done
}

downloadYearRange(){
	yearStart=$1
	yearEnd=$2
        monthStart=$3
	monthEnd=$4
	for year in {$yearStart..$yearEnd}
	do
        	mkdir $year
        	cd $year
        	for month in {$monthStart..$monthEnd}
        	do
        		mkdir $month
        		cd $month
        		downloadMonth $year $month
        		cd ..
        	done
        	cd ..
	done	
}

main()
{
touch /tmp/calvinHobbesLogs.txt
mkdir calvin-hobbes
cd calvin-hobbes
downloadYearRange 1985 1985 11 12
downloadYearRange 1986 1995 1 12
}

#Entry point
main
