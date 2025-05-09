<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Assign New Task</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f7f6;
            margin: 0;
            padding: 0;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }
        /* Navbar Styles */
        .navbar {
            width: 100%;
            background-color: #333;
            padding: 10px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: fixed;
            top: 0;
        }
        .navbar .logo {
            color: #fff;
            font-size: 1.5rem;
            font-weight: bold;
            text-transform: uppercase;
        }
        .navbar .nav-links {
            display: flex;
            gap: 20px;
            margin-right: 10px;
        }
        .navbar .nav-links a {
            color: #fff;
            text-decoration: none;
            font-size: 1rem;
        }
        .navbar .nav-links a:hover {
            color: #3498db;
        }

        .container {
            background-color: #ffffff;
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 600px;
            margin-top: 100px; /* Account for fixed navbar */
        }
        h1 {
            color: #2c3e50;
            text-align: center;
            margin-bottom: 1.5rem;
            font-size: 1.8rem;
        }
        form {
            display: flex;
            flex-direction: column;
            gap: 1rem;
        }
        .form-group {
            display: flex;
            flex-direction: column;
        }
        label {
            color: #34495e;
            font-weight: 600;
            margin-bottom: 0.5rem;
        }
        input, textarea, select {
            padding: 0.75rem;
            border: 1px solid #bdc3c7;
            border-radius: 5px;
            font-size: 1rem;
            transition: border-color 0.3s;
        }
        input:focus, textarea:focus, select:focus {
            border-color: #3498db;
            outline: none;
        }
        textarea {
            resize: vertical;
            min-height: 120px;
        }
        input[type="submit"] {
            background-color: #3498db;
            color: white;
            border: none;
            padding: 0.75rem;
            font-size: 1rem;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        input[type="submit"]:hover {
            background-color: #2980b9;
        }
    </style>
</head>
<body>

    <!-- Custom Navbar -->
    <div class="navbar">
        <div class="logo">Staff Management</div>
        <div class="nav-links">
            <a href="adminDashboard.jsp">Dashboard</a>
            <a href="#">Assign Task</a>
            <a href="LogoutServlet">Logout</a>
        </div>
    </div>

    <div class="container">
        <h1>Assign New Task</h1>
        <form action="AssignTaskServlet" method="post" id="taskForm">
            <div class="form-group">
                <label for="name">Employee Name:</label>
                <input type="text" id="name" name="name" required>
            </div>
            <div class="form-group">
                <label for="title">Title:</label>
                <input type="text" id="title" name="title" required>
            </div>
            <div class="form-group">
                <label for="description">Description:</label>
                <textarea id="description" name="description" required></textarea>
            </div>
            <div class="form-group">
                <label for="deadline">Deadline:</label>
                <input type="date" id="deadline" name="deadline" required>
            </div>
            <div class="form-group">
                <label for="status">Status:</label>
                <select id="status" name="status">
                    <option value="Pending">Pending</option>
                    <option value="Completed">Completed</option>
                </select>
            </div>
            <input type="submit" value="Assign Task">
        </form>
    </div>

</body>
</html>
