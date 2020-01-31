#!/bin/bash
ura="https://ia801504.us.archive.org/BookReader/BookReaderImages.php?zip=/32/items/baiestoxiques/Les%20baies%20toxiques_300ppi_jp2.zip&file=Les%20baies%20toxiques_300ppi_jp2/Les%20baies%20toxiques_300ppi_"
urb=".jp2&scale=4&rotate=0"
zer="000"
n="12"

while [ $n -le 100 ]
do
	if [ $n -ge 10 ]
	then
		zer="00"
	fi
	if [ $n -ge 100 ]
	then
		zer="0"
	fi
	if [ $n -ge 1000 ]
	then
		zer=""
	fi
  url="$ura$zer$n$urb"
  echo $url
  echo "\n\r\n\r"
  echo $zer$n
  wget -U "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)" --load-cookies cookies.txt $url
  n=$[$n+1]
done
