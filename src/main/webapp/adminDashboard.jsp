<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%
    HttpSession session1 = request.getSession(false);
    if (session1 == null || session1.getAttribute("username") == null) {
        response.sendRedirect("login.jsp"); // Redirect to login page if not logged in
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        /* Your existing CSS styles */
    </style>
</head>

<body style="background-image: url('https://images.unsplash.com/photo-1493934558415-9d19f0b2b4d2?q=80&w=2054&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'); 
             background-size: cover; 
             background-repeat: no-repeat; 
             background-position: center;">
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg">
        <a class="navbar-brand" href="adminDashboard.jsp"><i class="fas fa-user-shield"></i> Admin Dashboard</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="leaveRequests"><i class="fas fa-calendar-check"></i> Manage Leave Requests</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="TaskDashboardServlet"><i class="fas fa-tasks"></i> Manage Tasks</a>
                </li>
                <li class="nav-item">
                    <a href="addSalary.jsp" class="nav-link"><i class="fas fa-tasks"></i> Manage Salary</a>
                </li>
                <li class="nav-item">
                    <a href="LogoutServlet" class="btn btn-danger"><i class="fas fa-sign-out-alt"></i> Logout</a>
                </li>
            </ul>
        </div>
    </nav>

    <!-- Main Content -->
    <div class="container mt-4">
        <h3><i class="fas fa-users"></i> Staff Management</h3>
        <form action="adminDashboard" method="get" class="form-inline mb-3">
            <input type="text" name="searchId" class="form-control" placeholder="Search by Staff ID" required>
            <button type="submit" class="btn btn-primary ml-2"><i class="fas fa-search"></i> Search</button>
        </form>
        <a href="newStaff" class="btn btn-success mb-3"><i class="fas fa-user-plus"></i> Add Staff</a>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Staff ID</th>
                    <th>Name</th>
                    <th>Username</th>
                    <th>Address</th>
                    <th>Department</th>
                    <th>Salary</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="staff" items="${staffList}">
                    <tr>
                        <td>${staff.id}</td>
                        <td>${staff.staffId}</td>
                        <td>${staff.name}</td>
                        <td>${staff.username}</td>
                        <td>${staff.address}</td>
                        <td>${staff.department}</td>
                        <td>${staff.salary}</td>
                        <td>
                            <a href="updateStaff?id=${staff.id}" class="btn btn-warning"><i class="fas fa-edit"></i> Edit</a>
                            <a href="deleteStaff?id=${staff.id}" class="btn btn-danger"><i class="fas fa-trash-alt"></i> Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
