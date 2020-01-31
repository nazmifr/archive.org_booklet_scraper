# archivebooks

The archive.org site is an amazing project, they host so much great content, are an example of what a true information society and progress will look like, the one and only caveat i've found is that their document viewer doesn't let you download the individual images. Yes it would be really easy to just download the pdf and extract the images but I'm a lazy fuck so I've done this little script that allows you to automatically download all the images of a book item.

My use case is that I need to get my own items in this form to browse them offline with another viewer. To some users it might be a way to get offline access to their items as well as it is cumbersome and not resilient to have to rely on a working broadband connection to access important knowledge and files.

## Dependencies
  - bash (should be already installed)
  
     ``` sudo apt-get install bash ```
  - wget 
  
      ``` sudo apt-get install wget ```
  
## How To

### Downloading the images

1. Clone the repository OR copy the contents of **iadownload.sh** file
2. Create a repertory on your system
3. Put iadownload.sh in it
4. Open a terminal and cd to your repertory
5. Execute command 

    ``` sudo chmod +x iadownload.sh ```
6. open the text file to edit for your item (nano iadownload.sh or just open it with geany or mousepad)
7. save the file
8. run the script and see all the pages appearing in your folder, they don't have an extension but any image viewer should work

### Batch renaming:

### Converting to PDF:


## Revision history
### V0.1
 - The Script is working with personal, public and borrowed items (as of Janunary 31st of 2020)
 - user agent and cookie spoofing for private and restricted items (use export cookies on firefox and put the cookies.txt in the folder of the .sh script)
 - the user must manually set the url and the number of pages in the .sh script
 
### Todo
  - store all the created images in a repertory
  - rename the created images to PP****.jpg
  - port to JS userscript on tampermonkey / greasyfork / greasemonkey
  - automatic URL and number of pages retrieval
  - automatic renaming of the created files
