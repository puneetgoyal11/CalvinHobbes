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
			wget --append-output=/tmp/calvinHobbesLogs.txt http://marcel-oehler.marcellosendos.ch/comics/ch/$year/$monthFormatted/$year$monthFormatted$zero$day.gif >> /tmp/calvinHobbesLogs.txt
		else
			wget --append-output=/tmp/calvinHobbesLogs.txt http://marcel-oehler.marcellosendos.ch/comics/ch/$year/$monthFormatted/$year$monthFormatted$day.gif
		fi
	done
}

main()
{
touch /tmp/calvinHobbesLogs.txt
mkdir calvin-hobbes
cd calvin-hobbes
for year in {1985..1985}
do
	mkdir $year
	cd $year
        for month in {11..12}
        do
	mkdir $month
	cd $month
        downloadMonth $year $month
        cd ..
	done
	cd ..
done

for year in {1986..1995}
do
	mkdir $year
        cd $year
	for month in {1..12}
	do
	mkdir $month
        cd $month
	downloadMonth $year $month
	cd ..
	done
	cd ..
done
cd ..

	
}

#Entry point
main
