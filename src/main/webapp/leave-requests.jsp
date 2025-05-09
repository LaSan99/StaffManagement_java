<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

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
<html>
<head>
    <title>Manage Leave Requests</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            background-color: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h3 {
            color: #343a40;
            border-bottom: 2px solid #6c757d;
            padding-bottom: 10px;
        }
        .table th, .table td {
            vertical-align: middle;
        }
        .btn {
            border-radius: 20px;
        }
        .btn-sm {
            font-size: 0.875rem;
        }
        .alert {
            font-size: 1.2rem;
        }
        .navbar {
            background-color: #343a40;
        }
        .navbar-brand {
            color: #ffffff;
        }
            .navbar-nav {
            margin-left: auto;
        }
        .navbar-nav .nav-link {
            color: #ffffff;
            font-weight: bold;
        }
        .navbar-nav .nav-link:hover {
            color: #dcdcdc;
        }
        .navbar .fas {
            margin-right: 8px;
        }
                 /* From Uiverse.io by vinodjangid07 */ 
.Btn {
  display: flex;
  align-items: center;
  justify-content: flex-start;
  width: 45px;
  height: 45px;
  border: none;
  border-radius: 50%;
  cursor: pointer;
  position: relative;
  overflow: hidden;
  transition-duration: .3s;
  box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.199);
  background-color: rgb(255, 65, 65);
}

/* plus sign */
.sign {
  width: 100%;
  transition-duration: .3s;
  display: flex;
  align-items: center;
  justify-content: center;
}

.sign svg {
  width: 17px;
}

.sign svg path {
  fill: white;
}
/* text */
.text {
  position: absolute;
  right: 0%;
  width: 0%;
  opacity: 0;
  color: white;
  font-size: 1.2em;
  font-weight: 600;
  transition-duration: .3s;
}
/* hover effect on button width */
.Btn:hover {
  width: 125px;
  border-radius: 40px;
  transition-duration: .3s;
}

.Btn:hover .sign {
  width: 30%;
  transition-duration: .3s;
  padding-left: 20px;
}
/* hover effect button's text */
.Btn:hover .text {
  opacity: 1;
  width: 70%;
  transition-duration: .3s;
  padding-right: 10px;
}
/* button click effect*/
.Btn:active {
  transform: translate(2px ,2px);
}
    </style>
</head>
<body style="background-image: url('https://images.unsplash.com/photo-1493934558415-9d19f0b2b4d2?q=80&w=2054&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'); 
             background-size: cover; 
             background-repeat: no-repeat; 
             background-position: center;">

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark">
    <a class="navbar-brand" href="#"><i class="fas fa-user-shield"></i> Admin Panel</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" href="adminDashboard.jsp"><i class="fas fa-tachometer-alt"></i> Dashboard</a>
            </li>
             <li class="nav-item">
                    <a href="LogoutServlet" class="Btn">
                  <div class="sign">
                     <svg viewBox="0 0 512 512">
                          <path d="M377.9 105.9L500.7 228.7c7.2 7.2 11.3 17.1 11.3 27.3s-4.1 20.1-11.3 27.3L377.9 406.1c-6.4 6.4-15 9.9-24 9.9c-18.7 0-33.9-15.2-33.9-33.9l0-62.1-128 0c-17.7 0-32-14.3-32-32l0-64c0-17.7 14.3-32 32-32l128 0 0-62.1c0-18.7 15.2-33.9 33.9-33.9c9 0 17.6 3.6 24 9.9zM160 96L96 96c-17.7 0-32 14.3-32 32l0 256c0 17.7 14.3 32 32 32l64 0c17.7 0 32 14.3 32 32s-14.3 32-32 32l-64 0c-53 0-96-43-96-96L0 128C0 75 43 32 96 32l64 0c17.7 0 32 14.3 32 32s-14.3 32-32 32z"></path>
                     </svg>
                   </div>
                  <div class="text">Logout</div>
                </a>
                </li>
        </ul>
    </div>
</nav>

<!-- Content -->
<div class="container mt-5">
    <h3 class="mb-4"><i class="fas fa-tasks"></i> Manage Leave Requests</h3>
    
    <div class="form-group">
    <form action="SearchLeaveRequestsServlet" method="get">
        <div class="input-group mb-3">
            <input type="text" class="form-control" placeholder="Search by Staff ID" name="staffId" required>
            <div class="input-group-append">
                <button class="btn btn-primary" type="submit">Search</button>
            </div>
        </div>
    </form>
</div>
    
    
    <!-- Check if leaveRequests list is empty -->
    <c:choose>
        <c:when test="${empty leaveRequests}">
            <div class="alert alert-info text-center" role="alert">
                <i class="fas fa-info-circle"></i> No leave requests available.
            </div>
        </c:when>
        <c:otherwise>
            <table class="table table-bordered table-hover">
                <thead class="thead-dark">
                    <tr>
                        <th>ID</th>
                        <th>Staff ID</th>
                        <th>Start Date</th>
                        <th>End Date</th>
                        <th>Reason</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="leaveRequest" items="${leaveRequests}">
                        <tr>
                            <td>${leaveRequest.id}</td>
                            <td>${leaveRequest.staffIdFromDb}</td> 
                            <td>${leaveRequest.startDate}</td>
                            <td>${leaveRequest.endDate}</td>
                            <td>${leaveRequest.reason}</td>
                            <td>
                                <span class="badge badge-${leaveRequest.status eq 'Accepted' ? 'success' : leaveRequest.status eq 'Rejected' ? 'danger' : 'warning'}">${leaveRequest.status}</span>
                            </td>
                            <td>
                                <!-- Accept Button -->
                                <a href="LeaveStatusServlet?id=${leaveRequest.id}&status=Accepted" 
                                   class="btn btn-success btn-sm"><i class="fas fa-check-circle"></i> Accept</a>
                                
                                <!-- Reject Button -->
                                <a href="LeaveStatusServlet?id=${leaveRequest.id}&status=Rejected" 
                                   class="btn btn-danger btn-sm"><i class="fas fa-times-circle"></i> Reject</a>
                                
                                <!-- Delete Button -->
                                <a href="DeleteLeaveRequestServlet?id=${leaveRequest.id}" 
                                   class="btn btn-warning btn-sm"
                                   onclick="return confirm('Are you sure you want to delete this leave request?');"><i class="fas fa-trash-alt"></i> Delete</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:otherwise>
    </c:choose>

</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
