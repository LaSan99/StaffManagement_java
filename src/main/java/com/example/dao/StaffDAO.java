package com.example.dao;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.model.LeaveRequest;
import com.example.model.Staff;

public class StaffDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/staffdb";
    private String jdbcUsername = "root";
    private String jdbcPassword = "lasan2002";

    // SQL queries for staff management
    private static final String INSERT_STAFF_SQL = "INSERT INTO staff (staff_id, username, password, name, address, department, salary) VALUES (?, ?, ?, ?, ?, ?, ?)";
    private static final String SELECT_STAFF_BY_ID = "SELECT id, staff_id, username, name, address, department, salary FROM staff WHERE id = ?";
    private static final String SELECT_ALL_STAFF = "SELECT * FROM staff";
    private static final String DELETE_STAFF_SQL = "DELETE FROM staff WHERE id = ?";
    private static final String UPDATE_STAFF_SQL = "UPDATE staff SET staff_id = ?, username = ?, name = ?, address = ?, department = ?, salary = ? WHERE id = ?";


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

    // Staff management methods
    public void addStaff(Staff staff) throws SQLException {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_STAFF_SQL)) {
            preparedStatement.setString(1, staff.getStaffId());
            preparedStatement.setString(2, staff.getUsername());
            preparedStatement.setString(3, staff.getPassword());
            preparedStatement.setString(4, staff.getName());
            preparedStatement.setString(5, staff.getAddress());
            preparedStatement.setString(6, staff.getDepartment());
            preparedStatement.setDouble(7, staff.getSalary());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public Staff selectStaff(int id) {
        Staff staff = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_STAFF_BY_ID)) {
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                String staffId = rs.getString("staff_id");
                String username = rs.getString("username");
                String name = rs.getString("name");
                String address = rs.getString("address");
                String department = rs.getString("department");
                double salary = rs.getDouble("salary");
                staff = new Staff(id, staffId, username, name, address, department, salary);
            }
        } catch (SQLException e) {
        	System.out.println(e);
        }
        return staff;
    }

    public List<Staff> selectAllStaff() {
        List<Staff> staff = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_STAFF)) {
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String staffId = rs.getString("staff_id");
                String username = rs.getString("username");
                String name = rs.getString("name");
                String address = rs.getString("address");
                String department = rs.getString("department");
                double salary = rs.getDouble("salary");
                staff.add(new Staff(id, staffId, username, name, address, department, salary));
            }
        } catch (SQLException e) {
        	System.out.println(e);
        }
        return staff;
    }

    public boolean updateStaff(Staff staff) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(UPDATE_STAFF_SQL)) {
            statement.setString(1, staff.getStaffId());
            statement.setString(2, staff.getUsername());
            statement.setString(3, staff.getName());
            statement.setString(4, staff.getAddress());
            statement.setString(5, staff.getDepartment());
            statement.setDouble(6, staff.getSalary());
            statement.setInt(7, staff.getId());

            System.out.println("Executing update for staff with ID: " + staff.getId());
            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }


    
    public void deleteStaff(int id) throws SQLException {
        String sql = "DELETE FROM staff WHERE id = ?";

        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            throw new SQLException("Error deleting staff", e);
        }
    }

    
    public int getStaffIdByUsername(String username) {
        int staffId = -1;
        String sql = "SELECT id FROM staff WHERE username = ?";

        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, username);
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                staffId = rs.getInt("id");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return staffId;
    }

    public List<LeaveRequest> getLeaveRequestsByStaffId(int staffId) {
        List<LeaveRequest> leaveRequests = new ArrayList<>();
        String sql = "SELECT * FROM leave_requests WHERE staff_id = ?";

        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, staffId);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                int staffIdFromDB = rs.getInt("staff_id");
                Date startDate = rs.getDate("start_date");
                Date endDate = rs.getDate("end_date");
                String reason = rs.getString("reason");
                String status = rs.getString("status");

                LeaveRequest leaveRequest = new LeaveRequest(id, staffIdFromDB, null, startDate, endDate, reason, status);
                leaveRequests.add(leaveRequest);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return leaveRequests;
    }
    
    public boolean validateUser(String username, String password) {
        String sql = "SELECT * FROM staff WHERE username = ? AND password = ?";
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password);
            ResultSet rs = preparedStatement.executeQuery();
            return rs.next(); // If a result is found, credentials are valid
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

 // Check if the username already exists in the database
    public boolean isUsernameTaken(String username) {
        String sql = "SELECT COUNT(*) FROM staff WHERE username = ?";
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, username);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0; // If count > 0, username exists
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Check if the staffId already exists in the database
    public boolean isStaffIdTaken(String staffId) {
        String sql = "SELECT COUNT(*) FROM staff WHERE staff_id = ?";
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, staffId);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0; // If count > 0, staffId exists
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public List<Staff> searchStaffById(String staffId) {
        List<Staff> staffList = new ArrayList<>();
        String SEARCH_STAFF_SQL = "SELECT * FROM staff WHERE staff_id LIKE ?";
        
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SEARCH_STAFF_SQL)) {
            preparedStatement.setString(1, "%" + staffId + "%");
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String username = rs.getString("username");
                String name = rs.getString("name");
                String address = rs.getString("address");
                String department = rs.getString("department");
                double salary = rs.getDouble("salary");
                staffList.add(new Staff(id, staffId, username, name, address, department, salary));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return staffList;
    }



}
