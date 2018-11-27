import 'dart:io';
import 'package:html/dom.dart';
import 'package:http/http.dart' as HTTP;

Future<bool> scrapeKeywordFromSiteMapToFile(
    {int maxLinks = 20, String keyword = 'amoled', int startIndex = 0}) async {
  int scrapedLinksCounter = 0;
  bool isSuccessful = true;
  try {
    File file = new File('scraped/${keyword}_wallpaper_links.txt');
    RandomAccessFile randomAccessFile = file.openSync(mode: FileMode.WRITE);
    randomAccessFile.writeStringSync('');
    randomAccessFile.flushSync();
    randomAccessFile.closeSync();

    String siteMapURL = "https://www.zedge.net/sitemap/46/index/";
    String pageDOM = await HTTP.read(siteMapURL);

    Document document = Document.html(pageDOM);

    List<Element> linkElements = document.querySelectorAll("a");
    List<String> siteMapURLs = [];

    for (Element e in linkElements) {
      siteMapURLs.add("https://www.zedge.net${e.attributes['href']}");
    }

    for (String url in siteMapURLs) {
      String pageDOM = await HTTP.read(url);
      Document document = Document.html(pageDOM);

      List<Element> linkElements = document.querySelectorAll("a");

      for (Element element in linkElements) {
        if (scrapedLinksCounter < maxLinks &&
            element.innerHtml.toLowerCase().contains(keyword.toLowerCase())) {
          if (scrapedLinksCounter >= startIndex) {
            String wallpaperDownloadPageURL =
                'https://www.zedge.net${element.attributes['href']}';

            ///Write link to file
            RandomAccessFile randomAccessFile =
                file.openSync(mode: FileMode.APPEND);
            randomAccessFile.writeStringSync('$wallpaperDownloadPageURL\n');
            randomAccessFile.flushSync();
            randomAccessFile.closeSync();

            scrapedLinksCounter++;

            stdout.writeln('($scrapedLinksCounter) $wallpaperDownloadPageURL');
          } else {
            stdout.writeln(
                '($scrapedLinksCounter) Skipping wallpaper...(Not in start range)');
          }
        }
      }
    }
  } catch (e) {
    if (scrapedLinksCounter < maxLinks) {
      isSuccessful = false;
      stdout.writeln(
          '\nErrorScrapingSitemap\nScraped wallpapers: $scrapedLinksCounter\nError: $e');
    }
  }
  return isSuccessful;
}
