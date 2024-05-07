package com.hexaware.date.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;

public class DateUtil {
    // Method to convert string to java.util.Date
    public static java.util.Date stringToDate(String dateString) {
        java.util.Date date = null;
        try {
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            date = formatter.parse(dateString);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return date;
    }

    // Method to convert java.util.Date to java.sql.Date
    public static java.sql.Date utilToSqlDate(java.util.Date utilDate) {
        java.sql.Date sqlDate = null;
        if (utilDate != null) {
            sqlDate = new java.sql.Date(utilDate.getTime());
        }
        return sqlDate;
    }

    // Method to convert java.sql.Date to java.util.Date
    public static java.util.Date sqlToUtilDate(java.sql.Date sqlDate) {
        java.util.Date utilDate = null;
        if (sqlDate != null) {
            utilDate = new java.util.Date(sqlDate.getTime());
        }
        return utilDate;
    }

    // Method to getCurrent date
    public static String getCurrentDateAsString() {
        // Create a Date object representing the current date
        java.util.Date currentDate = new java.util.Date();

        // Create a SimpleDateFormat object with the desired date format
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

        // Format the current date using the SimpleDateFormat object
        String formattedDate = dateFormat.format(currentDate);

        // Return the formatted date as a string
        return formattedDate;
    }
}
