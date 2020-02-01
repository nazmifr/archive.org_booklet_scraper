# Archive.org booklet scraper: a tool to download and browse archive.org books offline

## Presentation

<a href="http://www.youtube.com/watch?feature=player_embedded&v=YOUTUBE_VIDEO_ID_HERE
" target="_blank"><img src="http://img.youtube.com/vi/YOUTUBE_VIDEO_ID_HERE/0.jpg" 
alt="IMAGE ALT TEXT HERE" width="240" height="180" border="10" /></a>

The archive.org site is an amazing project, they host so much great content, are an example of what a true information society and progress will look like. The one and only caveat i've found is that their document viewer doesn't let you download the individual images. Yes it would be really easy to just download the pdf and extract the images but I'm a lazy fuck so I've done this little script that allows you to automatically download all the images of a book item.

My use case is that I need to get my own items in this form to browse them offline with another viewer. To some users it might be a way to get offline access to their items as well as it is cumbersome and not resilient to have to rely on a working broadband connection to access important knowledge and files.

The output is plain jpeg images (no DRM, TPM or anything) that you can read even without a PDF reader, which is useful to me who has a Samsung Galaxy 1 Tablet

![Samsung P1000 tablet][tablet.jpeg]
[logo]: https://raw.githubusercontent.com/nazmifr/archive.org_booklet_scraper/master/tablet.jpeg "Samsung Galaxy P1000"

When running the script, please use a folder that's dedicated to it as it may overwrite files that use this structure:
name_of_item/PPXXXX.jpg

## Dependencies
  - firefox browser with [absolute enable right click](https://addons.mozilla.org/en-US/firefox/addon/absolute-enable-right-click/)
  - bash (should be already installed)
  
     ``` sudo apt-get install bash ```
  - wget 
  
      ``` sudo apt-get install wget ```
  
## How To

### Downloading the images

1. Clone the repository OR copy the contents of **iadownload.sh** file
2. Create a folder on your system
3. Put iadownload.sh in it
4. Open a terminal and cd to your folder
5. Execute command 

    ``` sudo chmod +x iadownload.sh ```
6. open the text file to edit for your item (nano iadownload.sh or just open it with geany or mousepad)
7. save the file
8. run the script and see all the pages appearing in your folder, they don't have an extension but any image viewer should work

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
