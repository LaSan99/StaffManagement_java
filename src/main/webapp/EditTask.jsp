<%@ page import="com.staffmanagement.model.Task" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Task</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f7f6;
            margin: 0;
            padding: 20px;
            color: #333;
        }
        .container {
            max-width: 600px;
            margin: 0 auto;
            background-color: #ffffff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        h1 {
            color: #2c3e50;
            text-align: center;
            margin-bottom: 30px;
        }
        form {
            display: grid;
            gap: 20px;
        }
        label {
            font-weight: bold;
            margin-bottom: 5px;
            display: block;
        }
        input[type="text"],
        input[type="date"],
        textarea,
        select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
            font-size: 16px;
        }
        textarea {
            height: 100px;
            resize: vertical;
        }
        input[type="submit"] {
            background-color: #3498db;
            color: white;
            border: none;
            padding: 12px 20px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }
        input[type="submit"]:hover {
            background-color: #2980b9;
        }
        .error {
            color: #e74c3c;
            font-size: 14px;
            margin-top: 5px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Edit Task</h1>
        <form action="EditTaskServlet" method="post" id="editTaskForm">
            <input type="hidden" name="id" value="${task.id}"/>
            
            <div>
                <label for="title">Title:</label>
                <input type="text" id="title" name="title" value="${task.title}" required/>
                <span class="error" id="titleError"></span>
            </div>
            
            <div>
                <label for="description">Description:</label>
                <textarea id="description" name="description" required>${task.description}</textarea>
                <span class="error" id="descriptionError"></span>
            </div>
            
            <div>
                <label for="deadline">Deadline:</label>
                <input type="date" id="deadline" name="deadline" value="${task.deadline}" required/>
                <span class="error" id="deadlineError"></span>
            </div>
            
            <div>
                <label for="status">Status:</label>
                <select id="status" name="status">
                    <option value="Pending" <c:if test="${task.status == 'Pending'}">selected</c:if>>Pending</option>
                    <option value="Completed" <c:if test="${task.status == 'Completed'}">selected</c:if>>Completed</option>
                </select>
            </div>
            
            <input type="submit" value="Update Task"/>
        </form>
    </div>

    <script>
        document.getElementById('editTaskForm').addEventListener('submit', function(e) {
            let isValid = true;
            
            // Validate Title
            const title = document.getElementById('title');
            if (title.value.trim() === '') {
                document.getElementById('titleError').textContent = 'Title is required';
                isValid = false;
            } else {
                document.getElementById('titleError').textContent = '';
            }
            
            // Validate Description
            const description = document.getElementById('description');
            if (description.value.trim() === '') {
                document.getElementById('descriptionError').textContent = 'Description is required';
                isValid = false;
            } else {
                document.getElementById('descriptionError').textContent = '';
            }
            
            // Validate Deadline
            const deadline = document.getElementById('deadline');
            if (deadline.value === '') {
                document.getElementById('deadlineError').textContent = 'Deadline is required';
                isValid = false;
            } else {
                document.getElementById('deadlineError').textContent = '';
            }
            
            if (!isValid) {
                e.preventDefault();
            }
        });
    </script>
</body>
</html>