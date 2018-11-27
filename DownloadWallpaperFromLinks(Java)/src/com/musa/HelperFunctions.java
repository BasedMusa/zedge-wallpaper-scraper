package com.musa;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.firefox.FirefoxOptions;

class HelperFunctions {

    static WebDriver driverWithCustomSettings() {
        String geckoDriverPath = "/home/musa/Development/Plugins/Java/geckodriver";
        String downloadDir = "/home/musa/Downloads/Scraped_Wallpapers/";

        System.setProperty("webdriver.gecko.driver", geckoDriverPath);
        FirefoxOptions options = new FirefoxOptions()
                .addPreference("browser.download.folderList", 2)
                .addPreference("browser.download.manager.showWhenStarting", false)
                .addPreference("browser.download.dir", downloadDir)
                .addPreference("browser.helperApps.neverAsk.saveToDisk", "application/image/jpeg");
        WebDriver driver = new FirefoxDriver(options);
        print("Driver launching...");
        printDivider();

        return driver;
    }

    static void printDivider() {
        print("-----");
    }

    static void print(String str) {
        System.out.println(str);
    }

}
