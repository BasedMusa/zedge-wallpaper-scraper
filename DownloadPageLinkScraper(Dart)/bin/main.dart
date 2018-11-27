import 'dart:io';
import 'functions.dart';

main(List<String> arguments) async {
  stdout.writeln('Starting download links scraping...');
  stdout.writeln('--------------\n');

  String keyword = "hello"; //getKeywordArgument(arguments);
  int startIndex = 0; //getStartIndexArgument(arguments);
  int maxLinks = 50; //getMaxLinksArgument(arguments);

  bool scrapeKeywordsSuccessful = await scrapeKeywordFromSiteMapToFile(
      startIndex: startIndex, maxLinks: maxLinks, keyword: keyword);

  if (scrapeKeywordsSuccessful) {
    stdout.writeln('\nScrape download links completed!\n--------------');
  } else {
    stdout.writeln('Scrape download links incomplete!\n--------------');
  }
}

//String getKeywordArgument(List<String> arguments) {
//  if (arguments != null && arguments.isNotEmpty) {
//    return arguments[0];
//  } else {
//    throw Exception(
//        "You need to pass in the following arguments:\n - Keyword\n - MaxWallpapersLinksToScrape(10)\n - NumberOfWallpapersToSkip(0)\n");
//  }
//}
//
//int getStartIndexArgument(List<String> arguments) {
//  if (arguments.length >= 1) {
//    return int.parse(arguments[1]);
//  } else {
//    return 0;
//  }
//}
//
//int getMaxLinksArgument(List<String> arguments) {
//  if (arguments.length >= 2) {
//    return int.parse(arguments[2]);
//  } else {
//    return 10;
//  }
//}
