package com.example.dao;

import java.sql.*;

public class AdminDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/staffdb";
    private String jdbcUsername = "root";
    private String jdbcPassword = "lasan2002";

    // SQL query to validate admin login credentials
    private static final String SELECT_ADMIN_BY_USERNAME_PASSWORD = "SELECT * FROM admin WHERE username = ? AND password = ?";

    // Helper method to get a database connection
    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }

    // Method to validate admin credentials
    public boolean validateUser(String username, String password) {
        boolean isValid = false;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ADMIN_BY_USERNAME_PASSWORD)) {
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                isValid = true;  // If the result set contains a record, credentials are valid
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return isValid;
    }
}
