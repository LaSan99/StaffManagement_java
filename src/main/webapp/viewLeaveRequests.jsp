<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%
    HttpSession session1 = request.getSession(false);
    if (session == null || session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp"); // Redirect to login page if not logged in
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Leave Requests</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background: linear-gradient(to right, #f5f7fa, #c3cfe2); /* Light gradient background */
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            height: 100%;
        }
        .container {
            background-color: rgba(255, 255, 255, 0.9);
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
            margin-top: 70px;
        }
        h3 {
            color: #2c3e50;
            text-align: center;
            margin-bottom: 25px;
            font-weight: bold;
        }
        .table thead {
            background-color: #34495e;
            color: white;
        }
        .table tbody tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        .table tbody tr:hover {
            background-color: #e9ecef;
        }
        .btn-primary {
            background-color: #2980b9;
            border-color: #2980b9;
            width: 100%;
        }
        .btn-primary:hover {
            background-color: #1c6d9e;
            border-color: #1c6d9e;
        }
        /* Navbar styling */
        .navbar {
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .nav-link {
            font-weight: bold;
            color: #2c3e50;
        }
        .nav-link:hover {
            color: #2980b9;
        }
        .btn-danger {
            border-radius: 20px;
            padding: 5px 15px;
            font-weight: bold;
        }
        .description {
            font-size: 16px;
            margin-bottom: 20px;
            color: #34495e;
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="#">Staff Management System</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item"><a class="nav-link" href="staffDashboard.jsp">Home</a></li>
            <li class="nav-item"><a class="nav-link" href="#">Profile</a></li>
            <li class="nav-item"><a class="nav-link" href="#">Settings</a></li>
            <li class="nav-item"><a class="nav-link btn btn-danger text-white" href="LogoutServlet">Logout</a></li>
        </ul>
    </div>
</nav>

<!-- Content -->
<div class="container mt-4">
    <h3>My Leave Requests</h3>

    <!-- Relatable Description Section -->
    <p class="description">
        Here you can view all your past and upcoming leave requests. Keep track of your leaves and their approval status, ensuring that you plan your time off effectively. If a request is still pending, you will be notified once an admin processes it.
    </p>

    <table class="table table-bordered table-hover">
        <thead>
            <tr>
                <th>Start Date</th>
                <th>End Date</th>
                <th>Reason</th>
                <th>Status</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="leaveRequest" items="${leaveRequests}">
                <tr>
                    <td>${leaveRequest.startDate}</td>
                    <td>${leaveRequest.endDate}</td>
                    <td>${leaveRequest.reason}</td>
                    <td>${leaveRequest.status}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
