# Archive.org booklet scraper: a tool to download and browse archive.org books offline

French article about the project on my [blog](https://nazmi.fr/archive_org_booklet_scraper/)

## Presentation

<a href="https://www.youtube.com/watch?v=O7IGLBied7c
" target="_blank"><img src="https://raw.githubusercontent.com/nazmifr/archive.org_booklet_scraper/master/thumb.png" 
alt="TUTORIAL VIDEO" width="240" height="180" border="10" /></a>


There is also a French 🇫🇷 version available here: https://youtu.be/VG9q_QVp8a0

The archive.org site is an amazing project, they host so much great content, are an example of what a true information society and progress will look like. The one and only caveat i've found is that their document viewer doesn't let you download the individual images. Yes it would be really easy to just download the pdf and extract the images but I'm a lazy fuck so I've done this little script that allows you to automatically download all the images of a book item.

My use case is that I need to get my own items in this form to browse them offline with another viewer. To some users it might be a way to get offline access to their items as well as it is cumbersome and not resilient to have to rely on a working broadband connection to access important knowledge and files.

The output is plain jpeg images (no DRM, TPM or anything) that you can read even without a PDF reader, which is useful to me who has a Samsung Galaxy 1 Tablet with android 2.3.7, no internet and no PDF reader.

![Samsung P1000 tablet][tablet.jpeg]

[tablet.jpeg]: https://raw.githubusercontent.com/nazmifr/archive.org_booklet_scraper/master/tablet.jpeg "Samsung Galaxy P1000"

When running the script, please use a folder that's dedicated to it as it may overwrite files that use this structure:
name_of_item/PPXXXX.jpg

## Dependencies
  - firefox browser with the extensions
    - [cookies.txt](https://addons.mozilla.org/en-US/firefox/addon/cookies-txt/?src=search) for restricted items (put the **cookies.txt** file in the same folder as the .sh script)
    - [absolute enable right click](https://addons.mozilla.org/en-US/firefox/addon/absolute-enable-right-click/) if you can't right click and copy the URL of the images
    
  - bash (should be already installed)
  
     ``` sudo apt-get install bash ```
  - wget 
  
      ``` sudo apt-get install wget ```
  
## How To

### Downloading the images

1. Clone the repository OR copy the contents of **iadownload.sh** file
2. Create a folder on your system
3. Put iadownload.sh in it
4. Open a terminal and cd to your foldhttps://addons.mozilla.org/en-US/firefox/addon/cookies-txt/?src=searcher
5. Execute command 

    ``` sudo chmod +x iadownload.sh ```
6. open the text file to edit for your item (nano iadownload.sh or just open it with geany or mousepad)
7. save the file
8. run the script and see all the pages appearing in your folder, they don't have an extension but any image viewer should work
9. If you have more than a hundred or so pages to download, you may start to get 403 errors, check which pages are downloaded fine in the folder (thumbnail or weight of the jpeg file) and change the range in the script, then update the **cookies.txt** file by going back to the page of the item on archive.org and pressing F5 and overwriting the old cookies.txt

### Batch renaming:

now integrated in the main script

### Converting to PDF:

you can use **gscan2pdf* raise issue if you have a better method

## Revision history

### V0.1
 - The Script is working with personal, public and borrowed items (as of Janunary 31st of 2020)
 - user agent and cookie spoofing for private and restricted items (use export cookies on firefox and put the cookies.txt in the folder of the .sh script)
 - the user must manually set the url and the number of pages in the .sh script
 
 ### V0.2
  - now the images are saved in a dedicated folder according to item (automatic REGEX parsing)
  - the files' name are now PPXXXX.jpg
  - added comments in the few lines of code of the script
  - variable are more clear and code easier to edit
 
### Todo
  - port to JS userscript on tampermonkey / greasyfork / greasemonkey
  - automatic URL and number of pages retrieval
  - automatic parsing of URL either from an archive.org link or an archive.org BookReader link
  - ~not redownloading already downloaded images~ (bad idea, some images are maybe corrupt, clean redownload > all)
  - ~store all the created images in a repertory~
  - ~rename the created images to PPxxxx.jpg~
