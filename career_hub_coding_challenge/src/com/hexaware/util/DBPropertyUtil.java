package com.hexaware.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.IOException;
import java.util.Properties;

public class DBPropertyUtil {
    public static String getConnectionString(String propertyFileName) {
        Properties properties = new Properties();
        final String SPACE = " ";
        try (FileReader fr = new FileReader(new File(propertyFileName))) {
            properties.load(fr);
            return properties.getProperty("url") + SPACE +
                    properties.getProperty("user") + SPACE + properties.getProperty("password");
        } catch (IOException e) {
            return e.getMessage();
        }

    }
}

