package com.example.dao;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import com.example.model.LeaveRequest;

public class LeaveRequestDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/staffdb";
    private String jdbcUsername = "root";
    private String jdbcPassword = "lasan2002";

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

    public void insertLeaveRequest(LeaveRequest leaveRequest) throws SQLException {
        String sql = "INSERT INTO leave_requests (staff_id, start_date, end_date, reason, status) VALUES (?, ?, ?, ?, 'Pending')";
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, leaveRequest.getStaffId());
            preparedStatement.setDate(2, leaveRequest.getStartDate());
            preparedStatement.setDate(3, leaveRequest.getEndDate());
            preparedStatement.setString(4, leaveRequest.getReason());
            preparedStatement.executeUpdate();
        }
    }
    
    public List<LeaveRequest> selectAllLeaveRequests() throws SQLException {
        List<LeaveRequest> leaveRequests = new ArrayList<>();
        String sql = "SELECT lr.id, s.staff_id AS actualStaffId, lr.start_date, lr.end_date, lr.reason, lr.status " +
                     "FROM leave_requests lr JOIN staff s ON lr.staff_id = s.id";
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                //int staffId = rs.getInt("leaveStaffId"); // Staff ID from leave_requests
                String staffIdFromDb = rs.getString("actualStaffId"); // Staff ID from staff table
                Date startDate = rs.getDate("start_date");
                Date endDate = rs.getDate("end_date");
                String reason = rs.getString("reason");
                String status = rs.getString("status");

                LeaveRequest leaveRequest = new LeaveRequest(id, staffIdFromDb, startDate, endDate, reason, status);
                leaveRequests.add(leaveRequest);
            }
        }
        return leaveRequests;
    }

public void updateLeaveStatus(int id, String status) throws SQLException {
        String sql = "UPDATE leave_requests SET status = ? WHERE id = ?";
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, status);
            preparedStatement.setInt(2, id);
            preparedStatement.executeUpdate();
        }
    }

    public void deleteLeaveRequest(int id) throws SQLException {
        String sql = "DELETE FROM leave_requests WHERE id = ?";
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        }
    }
    
    
    public List<LeaveRequest> selectLeaveRequestsByStaffId(String staffId) throws SQLException {
        List<LeaveRequest> leaveRequests = new ArrayList<>();
        String sql = "SELECT lr.id, s.staff_id AS actualStaffId, lr.start_date, lr.end_date, lr.reason, lr.status " +
                     "FROM leave_requests lr JOIN staff s ON lr.staff_id = s.id WHERE s.staff_id = ?";
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, staffId);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String staffIdFromDb = rs.getString("actualStaffId");
                Date startDate = rs.getDate("start_date");
                Date endDate = rs.getDate("end_date");
                String reason = rs.getString("reason");
                String status = rs.getString("status");

                LeaveRequest leaveRequest = new LeaveRequest(id, staffIdFromDb, startDate, endDate, reason, status);
                leaveRequests.add(leaveRequest);
            }
        }
        return leaveRequests;
    }




}
