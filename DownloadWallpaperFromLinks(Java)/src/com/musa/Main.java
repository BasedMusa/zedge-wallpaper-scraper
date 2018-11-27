package com.musa;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.Scanner;

public class Main {

    public static void main(String[] args) throws FileNotFoundException, InterruptedException {


        String downloadLinksFilePath = "/home/musa/Development/Scripts/Zedge Scraper/download-links-file.txt";

        Scanner s = new Scanner(new File(downloadLinksFilePath));
        ArrayList<String> wallpaperDownloadPageLinks = new ArrayList<>();
        while (s.hasNext()) {
            wallpaperDownloadPageLinks.add(s.next());
        }
        s.close();

        //Open web driver
        WebDriver driver = HelperFunctions.driverWithCustomSettings();

        for (int i = 0; i < wallpaperDownloadPageLinks.size(); i++) {

            String url = wallpaperDownloadPageLinks.get(i);

            HelperFunctions.print("Scraping " + (i + 1) + ": " + url);

            //Get to download page
            driver.get(url);

            //Click on download button and wait for download to start
            if (driver.findElements(By.className("download-icon-container")).size() > 0) {
                WebElement downloadButton = driver.findElement(By.className("download-icon-container"));
                downloadButton.click();
            } else if (driver.findElements(By.xpath("//button[@class='btn download-btn']")).size() > 0) {
                WebElement downloadButton = driver.findElement(By.xpath("//button[@class='btn download-btn']"));
                downloadButton.click();
            }
            Thread.sleep(3000);
        }

        HelperFunctions.print("");
        HelperFunctions.printDivider();
        HelperFunctions.print("\nDownload completed!");


    }
}

