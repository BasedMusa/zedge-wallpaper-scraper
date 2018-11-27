# Zedge Wallpaper Scraper

This project contains two scripts. Both of them are not compiled yet and some variables have to be changed for usage on other computers and OS.

* First script is in Dart language, it scrapes the sitemap of [Zedge](http://www.zedge.net/) and gets urls of download pages for all wallpapers whose titles contain the given keyword, e.g "amoled".
It stores the urls in the following directory: e.g 
```
/scraped/amoled_wallpaper_links.txt
```

* Second script is in Java language, it uses Selenium plugin for automation of Firefox to download the wallpapers. It reads wallpaper links file and downloads all the wallpapers to the directory: e.g
```
/home/musa/Downloads/Scraped_Wallpapers
```

## How to use

* Open first script (Dart) in IntelliJ IDEA

* Change the following 3 variables in main.dart according to your need;
```
keyword; maxLinks; startIndex;
```
* Run script, it will create a file in the following directory:
```
/scraped/<keyword>_wallpaper_links.txt
``` 
* After file is created and all links are scraped, copy it to the root directory of the project and rename it to download-links-file.txt

* Download geckodriver and Mozilla Firefox

* Open second script in IntelliJ IDEA

* In HelperFunctions.java file, edit geckoDriverPath variable, set it to where you have saved gecko driver.

* Also, edit downloadDir variable, set it to where you want to download the wallpapers

* In Main.java file, edit downloadLinksFilePath variable, set it to where you have the file on your computer

* Run script and wait for it download the wallpapers, voila!

### Me
This script is by Musa Usman. Email me at barbaricgamester@gmail.com 
