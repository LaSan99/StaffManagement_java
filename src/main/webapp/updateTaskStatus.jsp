<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Task Status</title>
    <link rel="stylesheet" href="styles.css"> <!-- Add a link to your CSS file if needed -->
</head>
<body>

    <h2>Update Task Status</h2>

    <form action="UpdateTaskStatusServlet" method="post">
        <label for="taskId">Task ID:</label>
        <input type="text" id="taskId" name="taskId" required readonly value="${task.id}"><br><br>

        <label for="empName">Employee Name:</label>
        <input type="text" id="empName" name="empName" readonly value="${task.empName}"><br><br>

        <label for="title">Task Title:</label>
        <input type="text" id="title" name="title" readonly value="${task.title}"><br><br>

        <label for="description">Task Description:</label>
        <textarea id="description" name="description" readonly>${task.description}</textarea><br><br>

        <label for="deadline">Deadline:</label>
        <input type="text" id="deadline" name="deadline" readonly value="${task.deadline}"><br><br>

        <label for="status">Current Status:</label>
        <input type="text" id="status" name="status" readonly value="${task.status}"><br><br>

        <label for="newStatus">Update Status to:</label>
        <select id="newStatus" name="newStatus" required>
            <option value="Completed">Completed</option>
        </select><br><br>

        <input type="submit" value="Update Status">
    </form>

</body>
</html>
