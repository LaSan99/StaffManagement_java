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
    <title>Apply for Leave</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            height: 100vh;
            display: flex;
            flex-direction: column;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
        }

        .navbar {
            background-color: gray;
            
        }

        .navbar-brand {
            color: white;
            font-weight: bold;
        }

        .nav-link {
            color: white !important;
        }

        .container {
            background-color: rgba(255, 255, 255, 0.9);
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            max-width: 500px;
            margin: auto;
            margin-top: 20px;
        }

        h2 {
            color: #2c3e50;
            margin-bottom: 20px;
            font-weight: bold;
            text-align: center;
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
    </style>
</head>

<body style="background-image: url('https://c0.wallpaperflare.com/path/841/708/39/adult-business-busy-character-e000c432c996fa8ca28972c1c4e1da1b.jpg'); background-size: cover; background-repeat: no-repeat; background-position: center;">

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark">
        <a class="navbar-brand" href="#">Staff Management System</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="staffDashboard.jsp"><i class="fas fa-home"></i> Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#"><i class="fas fa-user"></i> Profile</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#"><i class="fas fa-cogs"></i> Settings</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link btn btn-danger text-white" href="LogoutServlet"><i class="fas fa-sign-out-alt"></i> Logout</a>
                </li>
            </ul>
        </div>
    </nav>

    <!-- Leave Request Form -->
    <div class="container">
        <h2>Apply for Leave</h2>
        <ul>
            <li>Fill out the form below to submit your leave request.</li>
            <li>Ensure that all fields are completed accurately before submission.</li>
            <li>You must agree to the terms and conditions before proceeding.</li>
            <li>Confirm that the information provided is accurate and truthful.</li>
        </ul>

        <form action="LeaveApplicationServlet" method="post" onsubmit="return validateDates()">
            <div class="form-group">
                <label for="startDate">Start Date</label>
                <input type="date" class="form-control" id="startDate" name="startDate" required>
            </div>
            <div class="form-group">
                <label for="endDate">End Date</label>
                <input type="date" class="form-control" id="endDate" name="endDate" required>
            </div>
            <div class="form-group">
                <label for="reason">Reason for Leave</label>
                <textarea class="form-control" id="reason" name="reason" rows="3" required></textarea>
            </div>
            <div class="form-check mb-3">
                <input type="checkbox" class="form-check-input" id="acceptTerms" required>
                <label class="form-check-label" for="acceptTerms">
                    I confirm that all information provided is accurate, and I accept the terms and instructions for leave requests.
                </label>
            </div>
            <button type="submit" class="btn btn-primary">Submit Request</button>
        </form>
    </div>

    <!-- Success Modal -->
    <div class="modal fade" id="successModal" tabindex="-1" role="dialog" aria-labelledby="successModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="successModalLabel">Success</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p>Your leave application has been submitted successfully!</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
    <script>
    function validateDates() {
        const startDate = new Date(document.getElementById("startDate").value);
        const endDate = new Date(document.getElementById("endDate").value);
        const today = new Date();

        // Reset the time part for accurate comparison
        today.setHours(0, 0, 0, 0);

        if (startDate < today) {
            alert("Start date cannot be in the past.");
            return false; // Prevent form submission
        }
        if (endDate < startDate) {
            alert("End date cannot be before the start date.");
            return false; // Prevent form submission
        }
        return true; // Allow form submission
    }

    // Show success modal if message exists
    $(document).ready(function() {
        <% if (request.getAttribute("successMessage") != null) { %>
            $('#successModal').modal('show');
        <% } %>
    });
    </script>
</body>
</html>