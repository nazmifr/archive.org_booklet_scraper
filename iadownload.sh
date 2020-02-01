#!/bin/bash

# first and second part of url
# example: https://ia801305.us.archive.org/BookReader/BookReaderImages.php?zip=/6/items/KurtSaxonThePoorMansJamesBondVol5.pdf/Kurt%20Saxon%20-%20The%20Poor%20Mans%20James%20Bond%20-%20Vol%201_jp2.zip&file=Kurt%20Saxon%20-%20The%20Poor%20Mans%20James%20Bond%20-%20Vol%201_jp2/Kurt%20Saxon%20-%20The%20Poor%20Mans%20James%20Bond%20-%20Vol%201_0010.jp2&scale=1&rotate=0
# please remove the 0003 or so page number and leave all the other characters, you can use any page, just remove the page number
ura="https://ia801305.us.archive.org/BookReader/BookReaderImages.php?zip=/6/items/KurtSaxonThePoorMansJamesBondVol5.pdf/Kurt%20Saxon%20-%20The%20Poor%20Mans%20James%20Bond%20-%20Vol%201_jp2.zip&file=Kurt%20Saxon%20-%20The%20Poor%20Mans%20James%20Bond%20-%20Vol%201_jp2/Kurt%20Saxon%20-%20The%20Poor%20Mans%20James%20Bond%20-%20Vol%201_"
urb=".jp2&scale=1&rotate=0"

# The pages will be downloaded from and to those two variables, change accordingly as to the number of pages your document has and the pages you already have downloaded if it applies, archive.org items start with page 0
from="0"
to="3"

# change the user agent if needed, the cookies is on the wget line with cookies.txt by default
useragent="Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)"
# change extension if not jpeg
ext=".jpg"

# this is the default number of zeroes for 1 digit numbers, 0000 0001 0002 0003 0004
zer="000"

# this may cause issues in case the archive.org item name is weird, you may then remove this regex parsing pipe chain and set an arbitrary name for the folder where the images are to be downloaded
folder="$(echo $ura | sed 's/.*items\/\(.*\)/\1/' | awk -F'/' '{print $1}')"
mkdir $folder


while [ $from -le $to ]
do
# this part of the script adds the required number of arbitrary zeroes to the url, it works up to 9999 pages which should suffice, raise an issue if you find an item with more pages
	if [ $from -ge 10 ]
	then
		zer="00"
	fi
	if [ $from -ge 100 ]
	then
		zer="0"
	fi
	if [ $from -ge 1000 ]
	then
		zer=""
	fi
# these two variables assemble the full url and local path of the downloaded image
  url="$ura$zer$from$urb"
  echo $url
  name="$folder/PP$zer$from$ext"
# wget sends the GET HTTP request and saves the file, if the file was already downloaded it'll be overwritten
  wget -U $useragent --load-cookies cookies.txt $url -O $name
  let "from++"
done
h
