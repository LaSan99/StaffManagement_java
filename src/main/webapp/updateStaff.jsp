<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <title>Update Staff Details</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }

        .container {
            margin-top: 50px;
            max-width: 600px;
        }

        .form-control {
            border-radius: 0.25rem;
            box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        .form-label {
            font-weight: bold;
            color: #495057;
        }

        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
            border-radius: 0.25rem;
            font-size: 1rem;
            padding: 0.5rem 1rem;
        }

        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #004085;
        }

        .form-container {
            background: white;
            padding: 2rem;
            border-radius: 0.5rem;
            box-shadow: 0 0.125rem 0.25rem rgba(0, 0, 0, 0.075);
        }

        .form-control-icon {
            position: relative;
        }

        .form-control-icon i {
            position: absolute;
            top: 0.75rem;
            right: 0.75rem;
            color: #6c757d;
        }

        .form-header {
            margin-bottom: 2rem;
        }

        .form-header h2 {
            font-size: 1.5rem;
            font-weight: 600;
        }
    </style>
</head>

<body>
    <div class="container">
        <div class="form-container">
            <div class="form-header">
                <h2><i class="fas fa-user-edit"></i> Update Staff Details</h2>
            </div>

            <form action="updateStaff" method="post">
                <input type="hidden" name="id" value="${staff.id}">

                <div class="form-group form-control-icon">
                    <label for="staffId" class="form-label">Staff ID:</label>
                    <input type="text" name="staffId" id="staffId" class="form-control" value="${staff.staffId}" required>
                    <i class="fas fa-id-badge"></i>
                </div>
                <div class="form-group form-control-icon">
                    <label for="username" class="form-label">Username:</label>
                    <input type="text" name="username" id="username" class="form-control" value="${staff.username}" required>
                    <i class="fas fa-user"></i>
                </div>
                <div class="form-group form-control-icon">
                    <label for="password" class="form-label">Password:</label>
                    <input type="password" name="password" id="password" class="form-control" value="${staff.password}">
                    <i class="fas fa-lock"></i>
                </div>
                <div class="form-group form-control-icon">
                    <label for="name" class="form-label">Name:</label>
                    <input type="text" name="name" id="name" class="form-control" value="${staff.name}" required>
                    <i class="fas fa-user-tag"></i>
                </div>
                <div class="form-group form-control-icon">
                    <label for="address" class="form-label">Address:</label>
                    <input type="text" name="address" id="address" class="form-control" value="${staff.address}">
                    <i class="fas fa-home"></i>
                </div>
                <div class="form-group form-control-icon">
                    <label for="department" class="form-label">Department:</label>
                    <input type="text" name="department" id="department" class="form-control" value="${staff.department}">
                    <i class="fas fa-building"></i>
                </div>
                <div class="form-group form-control-icon">
                    <label for="salary" class="form-label">Salary:</label>
                    <input type="number" step="0.01" name="salary" id="salary" class="form-control" value="${staff.salary}">
                    <i class="fas fa-dollar-sign"></i>
                </div>
                <div class="form-group">
                    <input type="submit" value="Update Details" class="btn btn-primary">
                </div>
            </form>
        </div>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>

</html>
