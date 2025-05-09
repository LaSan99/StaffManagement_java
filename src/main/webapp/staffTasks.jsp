<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.staffmanagement.model.Task"%>
<%@page import="com.staffmanagement.dao.TaskDAO"%>
<%@page import="javax.servlet.http.HttpSession"%>

<%
    HttpSession session1 = request.getSession(false);
    if (session1 == null || session1.getAttribute("username") == null) {
        response.sendRedirect("login.jsp"); // Redirect to login if not logged in
        return;
    }

    String empName = (String) session1.getAttribute("username");
    TaskDAO taskDAO = new TaskDAO();
    List<Task> tasks = taskDAO.getTasksByEmpName(empName); // Fetch tasks for the logged-in user
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Tasks</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> <!-- Bootstrap CDN -->
    <link rel="stylesheet" href="path/to/custom.css"> <!-- Optional Custom CSS -->
</head>
<body>
<!-- Modern Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="#">Staff Management</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="staffDashboard.jsp">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Profile</a> <!-- Profile or other links can go here -->
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="LogoutServlet">Logout</a> <!-- Logout option -->
                </li>
            </ul>
        </div>
    </nav>
    <div class="container mt-5">
        <h2 class="text-center mb-4">My Assigned Tasks</h2>
        <form action="UpdateTaskStatus" method="post"> <!-- Ensure this matches the url-pattern in web.xml -->

            <table class="table table-bordered table-striped">
                <thead class="thead-dark">
                    <tr>
                        <th scope="col">Select</th>
                        <th scope="col">Title</th>
                        <th scope="col">Description</th>
                        <th scope="col">Deadline</th>
                        <th scope="col">Status</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        if (tasks.isEmpty()) {
                    %>
                        <tr>
                            <td colspan="5" class="text-center">No tasks assigned.</td>
                        </tr>
                    <%
                        } else {
                            for (Task task : tasks) {
                    %>
                                <tr>
                                    <td>
                                        <input type="checkbox" name="completedTasks" value="<%= task.getId() %>">
                                    </td>
                                    <td><%= task.getTitle() %></td>
                                    <td><%= task.getDescription() %></td>
                                    <td><%= task.getDeadline() %></td>
                                    <td><%= task.getStatus() %></td>
                                </tr>
                    <%
                            }
                        }
                    %>
                </tbody>
            </table>
            <div class="text-center">
                <button type="submit" class="btn btn-success">Mark Selected as Completed</button>
            </div>
        </form>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
