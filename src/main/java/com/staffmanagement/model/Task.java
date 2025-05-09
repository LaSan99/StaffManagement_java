package com.staffmanagement.model;

public class Task {
    private int id;
    private String empName;
    private String title;
    private String description;
    private String createdAt;
    private String deadline;
    private String status;

    // Constructors, Getters, Setters
    public Task() {}

    public Task(int id, String empName, String title, String description, String createdAt, String deadline, String status) {
        this.id = id;
        this.empName = empName;
        this.title = title;
        this.description = description;
        this.createdAt = createdAt;
        this.deadline = deadline;
        this.status = status;
    }
    
 // Getters and Setters for each field
	public void setId(int id) {
		this.id = id;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public void setCreatedAt(String createdAt) {
		this.createdAt = createdAt;
	}

	public void setDeadline(String deadline) {
		this.deadline = deadline;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getId() {
		return id;
	}

	public String getEmpName() {
		return empName;
	}

	public String getTitle() {
		return title;
	}

	public String getDescription() {
		return description;
	}

	public String getCreatedAt() {
		return createdAt;
	}

	public String getDeadline() {
		return deadline;
	}

	public String getStatus() {
		return status;
	}

    
}
