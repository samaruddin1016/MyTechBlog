package com.tech.blog.helper;

import java.sql.*;

/**
 *
 * @author samar
 */
public class ConnectionProvider {
    private static Connection con;
    public static Connection getConnection()
    {
        try
        {
            if(con==null)
            {
                Class.forName("com.mysql.jdbc.Driver");
                con=DriverManager.getConnection("jdbc:mysql:///techblog","root","root");
            }
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        
        return con;
    }
}
