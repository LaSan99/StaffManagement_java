package com.example.model;

import java.sql.Date;

public class LeaveRequest {
    private int id;
    private int staffId;
    private String staffIdFromDb; // New field for staff_id from the staff table
    private Date startDate;
    private Date endDate;
    private String reason;
    private String status;

    // Constructor with all fields
    public LeaveRequest(int id, int staffId, String staffIdFromDb, Date startDate, Date endDate, String reason, String status) {
        this.id = id;
        this.staffId = staffId;
        this.staffIdFromDb = staffIdFromDb; // Initialize the new field
        this.startDate = startDate;
        this.endDate = endDate;
        this.reason = reason;
        this.status = status;
    }
    
    public LeaveRequest(int id, String staffIdFromDb, Date startDate, Date endDate, String reason, String status) {
        this.id = id;
        this.staffIdFromDb = staffIdFromDb; // Initialize the new field
        this.startDate = startDate;
        this.endDate = endDate;
        this.reason = reason;
        this.status = status;
    }

	// Getter and Setter methods
    
    public String getStaffIdFromDb() {
        return staffIdFromDb;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getStaffId() {
        return staffId;
    }

    public void setStaffId(int staffId) {
        this.staffId = staffId;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}