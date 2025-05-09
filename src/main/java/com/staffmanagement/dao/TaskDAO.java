package com.staffmanagement.dao;

import com.staffmanagement.model.Task;
import com.staffmanagement.util.DBConnect;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TaskDAO {

	// Add a new task
	public static void addTask(String name, String title, String description, String deadline, String status) {

		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = DBConnect.getConnection();
			String sql = "INSERT INTO task (emp_name, title, description, created_at, deadline, status) VALUES (?, ?, ?, NOW(), ?, ?)";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, title);
			pstmt.setString(3, description);
			pstmt.setString(4, deadline);
			pstmt.setString(5, status);

			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// Close resources
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

	}

	// Get all tasks
	public List<Task> getAllTasks() {
	    List<Task> tasks = new ArrayList<>();
	    try (Connection conn = DBConnect.getConnection();
	         Statement stmt = conn.createStatement();
	         ResultSet rs = stmt.executeQuery("SELECT * FROM task")) {
	        while (rs.next()) {
	            Task task = new Task(rs.getInt("id"), rs.getString("emp_name"), rs.getString("title"),
	                    rs.getString("description"), rs.getString("created_at"), rs.getString("deadline"),
	                    rs.getString("status"));
	            tasks.add(task);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return tasks;
	}


	// Update a task
	public void updateTask(Task task) {
		try (Connection conn = DBConnect.getConnection();
				PreparedStatement ps = conn.prepareStatement(
						"UPDATE task SET title = ?, description = ?, deadline = ?, status = ? WHERE id = ?")) {
			ps.setString(1, task.getTitle());
			ps.setString(2, task.getDescription());
			ps.setString(3, task.getDeadline());
			ps.setString(4, task.getStatus());
			ps.setInt(5, task.getId());
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// Delete a task
	public void deleteTask(int id) {
		try (Connection conn = DBConnect.getConnection();
				PreparedStatement ps = conn.prepareStatement("DELETE FROM task WHERE id = ?")) {
			ps.setInt(1, id);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// Get a task by ID
	public Task getTaskById(int id) {
		Task task = null;
		try (Connection conn = DBConnect.getConnection();
				PreparedStatement ps = conn.prepareStatement("SELECT * FROM task WHERE id = ?")) {
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				task = new Task(rs.getInt("id"), rs.getString("emp_name"), rs.getString("title"),
						rs.getString("description"), rs.getString("created_at"), rs.getString("deadline"),
						rs.getString("status"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return task;
	}
	
	public void updateTaskStatus(int taskId, String newStatus) {
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = DBConnect.getConnection();
            String updateQuery = "UPDATE task SET status = ? WHERE id = ?";
            ps = conn.prepareStatement(updateQuery);
            ps.setString(1, newStatus);
            ps.setInt(2, taskId);

            ps.executeUpdate();  // Execute the update query
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
	
	
	public List<Task> getTasksByEmpName(String empName) {
        List<Task> tasks = new ArrayList<>();
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement("SELECT * FROM task WHERE emp_name = ?")) {
            ps.setString(1, empName);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Task task = new Task(rs.getInt("id"), rs.getString("emp_name"), rs.getString("title"),
                        rs.getString("description"), rs.getString("created_at"), rs.getString("deadline"),
                        rs.getString("status"));
                tasks.add(task);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return tasks;
    }
}
