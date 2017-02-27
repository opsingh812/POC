
package com.retail.springservice.utility;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBUtility {
 private static Connection connection = null;

    public static Connection getConnection() {
        if (connection != null)
            return connection;
        else {
            try {
             
            	String DRIVER="com.mysql.jdbc.Driver";  
            	String CONNECTION_URL="jdbc:mysql://10.10.78.150:3306/oab";  
            	String USERNAME="root";  
            	String PASSWORD="admin";  
                Class.forName(DRIVER);
                
                connection = DriverManager.getConnection(CONNECTION_URL,USERNAME,PASSWORD);
            } catch (Exception e) {
                e.printStackTrace();
            } /*catch (SQLException e) {
                e.printStackTrace();
            } catch (FileNotFoundException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }*/
            return connection;
        }

    }

}