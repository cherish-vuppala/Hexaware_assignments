package com.hexaware.util;

import com.hexaware.exception.DatabaseConnectionException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnectionUtil {
    public static Connection getConnection() throws DatabaseConnectionException {

          try{
              String[] properties = DBPropertyUtil.
                              getConnectionString("DBConfig.properties").
                              split(" ");
              String URL = properties[0];
              String USER = properties[1];
              String PASSWORD = properties[2];
              return DriverManager.getConnection(URL, USER, PASSWORD);
          } catch (SQLException e) {
              throw new DatabaseConnectionException("Error connecting database " + e.getMessage());
          }
    }






}

