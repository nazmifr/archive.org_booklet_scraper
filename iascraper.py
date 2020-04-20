# Python implementation of the archive.org booklet scraper for Bash (on GNU/Linux)
# Fully cross-platform
# Less giberish in the terminal window (only current page being downloaded and total number of pages to download, no HTTP headers and shiet
# https://github.com/phoemur/wgetter

import os
import requests

# Pages to download
fraum = 1 # 1st page to download
tou = 500 # Last page to download (overshoot is not an issue, will just add empty images easy to delete afterwards)

# Item to download
part1 = 'https://ia801305.us.archive.org/BookReader/BookReaderImages.php?zip=/6/items/KurtSaxonThePoorMansJamesBondVol5.pdf/Kurt%20Saxon%20-%20The%20Poor%20Mans%20James%20Bond%20-%20Vol%201_jp2.zip&file=Kurt%20Saxon%20-%20The%20Poor%20Mans%20James%20Bond%20-%20Vol%201_jp2/Kurt%20Saxon%20-%20The%20Poor%20Mans%20James%20Bond%20-%20Vol%201_'  # Cut at the underscore '_' before the four digits of the page 
part2 = '.jp2&scale=0&rotate=0' # if you increase the scale value you'll have smaller images (less space but lesser quality), best is 0 or 1 (500kB/1MB per page), worst is 4 (50-100kB per page)

# change the user agent if needed, the cookies is on the wget line with cookies.txt by default
useragent = "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)"

# change extension if not jpeg
ext = ".jpg"

# this is the default number of zeroes for 1 digit numbers, 0000 0001 0002 0003 0004 (leave as default for any item with less than 9999 pages, raise a github issue if you have an item with 10k pages or more to download)
zer = "000"

# Name of the folder where the item pages are going to be put (TODO: Regex)
name= "my_archive_book"  #"$(echo $ura | sed 's/.*items\/\(.*\)/\1/' | awk -F'/' '{print $1}')"

pwd = os.getcwd()
folder = pwd + '\\' + name

try:
    os.mkdir(folder)
except OSError:
    print ("Creation of the directory %s failed" % name)
else:
    print ("Successfully created the directory %s " % name)

while fraum <= tou:
  if fraum >= 10:
    zer = "00"
  if fraum >= 100:
    zer = "0"
  if fraum >= 1000:
    zer = ""
  no = str(fraum)
  noext = folder + '\\' + no + ".jpg"
  image_url = part1 + no + part2
  print('\r\npage ', fraum, '/', tou)
  filename = wgetter.download(image_url, outdir=noext, cj="cookies.txt")
  fraum = fraum + 1
