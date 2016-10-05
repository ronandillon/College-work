package com.assignment.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import com.assignment.business.Meal;
import com.assignment.exceptions.DaoException;
import com.mysql.jdbc.Statement;

public class Dao {
	Connection con=null;

    protected Connection getConnection() throws DaoException {

        String driver = "com.mysql.jdbc.Driver";
        String url = "jdbc:mysql://localhost:3306/assignment";
        String username = "";
        String password = "";
        try {
            Class.forName(driver);
            con = DriverManager.getConnection(url, username, password);
        } catch (ClassNotFoundException ex1) {
            System.out.println("Failed to find driver class " + ex1.getMessage());
            System.exit(1);
        } catch (SQLException ex2) {
            System.out.println("Connection failed " + ex2.getMessage());
            System.exit(2);
        }
        return con;
    }

    protected void freeConnection(Connection con) throws DaoException  {
        try {
            if (con != null) {
                con.close();
                con = null;
            }
        } catch (SQLException e) {
            System.out.println("Failed to free connection: " + e.getMessage());
            System.exit(1);
        }
    }
    public Meal addMeal(String type, int calories) throws SQLException
    {
    	Statement statement =null;
		String query = "INSERT INTO meals (Type,Calories) VALUES ('"+type+','+calories+"');";
		con=this.getConnection();
		//statement = con.createStatement();
		statement.executeUpdate(query);
		return null;
    }

    
}