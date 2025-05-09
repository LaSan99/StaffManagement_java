package com.example.model;

public class Staff {
    private int id;
    private String staffId;
    private String username;
    private String password;
    private String name;
    private String address;
    private String department;
    private double salary;

    // Constructor for creating a new staff member (without the ID)
    public Staff(String staffId, String username, String password, String name, String address, String department, double salary) {
        this.staffId = staffId;
        this.username = username;
        this.password = password;
        this.name = name;
        this.address = address;
        this.department = department;
        this.salary = salary;
    }

    // Constructor for updating an existing staff member (with ID)
    public Staff(int id, String staffId, String username, String name, String address, String department, double salary) {
        this.id = id;
        this.staffId = staffId;
        this.username = username;
        this.name = name;
        this.address = address;
        this.department = department;
        this.salary = salary;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getStaffId() {
        return staffId;
    }

    public void setStaffId(String staffId) {
        this.staffId = staffId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public double getSalary() {
        return salary;
    }

    public void setSalary(double salary) {
        this.salary = salary;
    }
}
