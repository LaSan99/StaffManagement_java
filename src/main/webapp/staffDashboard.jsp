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
    <title>Staff Dashboard</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        body {
            background-color: #EFEFEC;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            padding-top: 0;
        }

       .navbar {
    background-color: transparent; /* Make navbar transparent */
    position: absolute; /* Overlay on top of the hero section */
    top: 0;
    width: 100%;
    z-index: 10; /* Ensure it's above the hero section */
    border: none; /* Remove any border */
}

.navbar-brand {
    color: white; /* Make text white to contrast with the background */
    font-weight: bold;
}

.nav-link {
    color: white !important; /* Ensure navbar links are visible */
    transition: color 0.3s;
}

.nav-link:hover {
    color: #f8f9fa !important;
}

/* Ensure body content does not overlap the navbar */
body {
    padding-top: 0;
}


        .container {
            margin-top: 50px;
        }

        h2 {
            color: #007bff;
            font-weight: bold;
        }

        .jumbotron {
            background-color: #e9ecef;
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        }

        .card {
            border: none;
            border-radius: 10px;
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .card:hover {
            transform: translateY(-10px);
            box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.2);
        }

        .card-header {
            font-size: 1.25rem;
            font-weight: bold;
        }

        .btn-light {
            transition: background-color 0.3s, color 0.3s;
        }

        .btn-light:hover {
            background-color: #007bff;
            color: white;
        }

        .fa-icon {
            margin-right: 10px;
        }

        .about-us {
            background-color: #f8f9fa;
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        }

        .about-us h3 {
            color: #007bff;
            font-weight: bold;
        }

        .about-us .icon {
            font-size: 3rem;
            color: #007bff;
            margin-bottom: 1rem;
        }

        .about-us p {
            font-size: 1.1rem;
        }

        .footer {
            background-color: #007bff;
            color: white;
            padding: 1rem 0;
            text-align: center;
            position: fixed;
            width: 100%;
            bottom: 0;
        }

        .footer a {
            color: white;
            text-decoration: none;
            margin: 0 10px;
        }

        .footer a:hover {
            text-decoration: underline;
        }

        .footer .social-icons i {
            font-size: 1.5rem;
            margin: 0 10px;
            color: white;
        }
        
        .list-group-item:hover {
    background-color: #f1f1f1;
    cursor: pointer;
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


/* Hero Section */
       /* Hero Section */
.hero-section {
    position: relative;
    background-image: url('https://images.unsplash.com/photo-1541746972996-4e0b0f43e02a?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D');
    background-size: cover;
    background-position: center;
    color: white;
    height: 615px; /* Adjust height as needed */
    display: flex;
    align-items: center;
    justify-content: center;
    text-align: center;
    margin-bottom: 30px; /* Adjust as needed */
    border-bottom-left-radius: 15px; /* Adjust the radius as needed */
    border-bottom-right-radius: 15px; /* Adjust the radius as needed */
    overflow: hidden; /* Ensure background doesn't overflow */
}


.hero-content {
    max-width: 80%;
}

.hero-title {
    font-size: 2.5rem; /* Adjust size as needed */
    font-weight: bold;
    margin-bottom: 10px;
}

.hero-description {
    font-size: 1.25rem; /* Adjust size as needed */
}

    </style>
</head>

<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg">
        <a class="navbar-brand" href="#"><i class="fas fa-users-cog"></i> Staff Management System</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="#"><i class="fas fa-home fa-icon"></i>Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#"><i class="fas fa-user fa-icon"></i>Profile</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#"><i class="fas fa-cogs fa-icon"></i>Settings</a>
                </li>
                <a href="LogoutServlet" class="Btn">
                  <div class="sign">
                     <svg viewBox="0 0 512 512">
                          <path d="M377.9 105.9L500.7 228.7c7.2 7.2 11.3 17.1 11.3 27.3s-4.1 20.1-11.3 27.3L377.9 406.1c-6.4 6.4-15 9.9-24 9.9c-18.7 0-33.9-15.2-33.9-33.9l0-62.1-128 0c-17.7 0-32-14.3-32-32l0-64c0-17.7 14.3-32 32-32l128 0 0-62.1c0-18.7 15.2-33.9 33.9-33.9c9 0 17.6 3.6 24 9.9zM160 96L96 96c-17.7 0-32 14.3-32 32l0 256c0 17.7 14.3 32 32 32l64 0c17.7 0 32 14.3 32 32s-14.3 32-32 32l-64 0c-53 0-96-43-96-96L0 128C0 75 43 32 96 32l64 0c17.7 0 32 14.3 32 32s-14.3 32-32 32z"></path>
                     </svg>
                   </div>
                  <div class="text">Logout</div>
                </a>
             </ul>
        </div>
    </nav>

    <!-- Hero Section -->
    <section class="hero-section">
        <div class="hero-content">
            <h1 class="hero-title">Welcome to the Staff Dashboard</h1>
            <p class="hero-description">Your personalized space to manage your tasks, view notifications, and stay updated with the latest information.</p>
        </div>
    </section>

    
    
    <div class="container">

        <!-- Landing Page Sections -->
        <div class="mt-5">
            <div class="jumbotron">
                <h1 class="display-4">Welcome, ${username}!</h1>
                <p class="lead">This is your personalized dashboard where you can manage your profile, check notifications, and view your tasks.</p>
                <hr class="my-4">
                <p>Use the navigation bar to explore more options.</p>
            </div>

            <div class="row">
                <div class="col-md-4">
                    <div class="card text-white bg-primary mb-3">
                        <div class="card-header"><i class="fas fa-id-card fa-icon"></i>Profile</div>
                        <div class="card-body">
                            <h5 class="card-title">Manage Your Profile</h5>
                            <p class="card-text">Update your personal information and change your password.</p>
                            <a href="#" class="btn btn-light">Go to Profile</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card text-white bg-success mb-3">
                        <div class="card-header"><i class="fas fa-bell fa-icon"></i>Notifications</div>
                        <div class="card-body">
                            <h5 class="card-title">View Notifications</h5>
                            <p class="card-text">Stay updated with the latest announcements and alerts.</p>
                            <a href="#" class="btn btn-light">Check Notifications</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card text-white bg-warning mb-3">
                        <div class="card-header"><i class="fas fa-tasks fa-icon"></i>Tasks</div>
                        <div class="card-body">
                            <h5 class="card-title">View Tasks</h5>
                            <p class="card-text">Keep track of your tasks and deadlines.</p>
                            <a href="staffTasks.jsp" class="btn btn-light">View Tasks</a>
                        </div>
                    </div>
                </div>
       <div class="col-md-4"> 
    <div class="card text-white bg-success mb-3">
        <div class="card-header"><i class="fas fa-money-check-alt fa-icon"></i>Salary Information</div>
        <div class="card-body">
            <h5 class="card-title">View Salary Details</h5>
            <p class="card-text">Basic Salary: ${salary.basicSalary}</p>
            <p class="card-text">Bonus: ${salary.bonus}</p>
            <p class="card-text">Total Salary: ${salary.totalSalary}</p>
        </div>
    </div>
</div>

               <div class="col-md-4">
    <div class="card text-white bg-info mb-3" style="min-height: 250px; display: flex; flex-direction: column;">
        <div class="card-header"><i class="fas fa-plane-departure fa-icon"></i>Request For Leave</div>
        <div class="card-body" style="flex: 1;">
            <h5 class="card-title">Apply Leave</h5>
            <p class="card-text">Request for leave and view your leave status.</p>
            <a href="leaveRequestForm.jsp" class="btn btn-light">Request Leave</a>
            <a href="viewLeaveRequests" class="btn btn-light" style="margin-top: 10px">View My Leave Requests</a>
        </div>
    </div>
</div>

            </div>
        </div>
    
    
        
<div class="container mt-5">
    <h2 class="text-center">Dashboard</h2>
    <div class="row">
        <!-- Upcoming Events and Recent Activity -->
        <div class="col-md-6">
            <!-- Upcoming Events -->
            <div class="card shadow border-0 mb-4">
                <div class="card-header bg-info text-white font-weight-bold">Upcoming Events</div>
                <div class="card-body">
                    <ul class="list-group">
                        <li class="list-group-item d-flex justify-content-between align-items-center">
                            Team Meeting - Sept 25, 2024
                            <span class="badge badge-primary badge-pill">Upcoming</span>
                        </li>
                        <li class="list-group-item d-flex justify-content-between align-items-center">
                            Project Deadline - Sept 30, 2024
                            <span class="badge badge-danger badge-pill">Deadline</span>
                        </li>
                        <li class="list-group-item d-flex justify-content-between align-items-center">
                            Company Retreat - Oct 15, 2024
                            <span class="badge badge-success badge-pill">Plan Ahead</span>
                        </li>
                    </ul>
                </div>
            </div>

            <!-- Recent Activity -->
            <div class="card shadow border-0">
                <div class="card-header bg-secondary text-white font-weight-bold">Recent Activity</div>
                <div class="card-body">
                    <ul class="list-group">
                        <li class="list-group-item d-flex justify-content-between align-items-center">
                            Updated profile information - Sept 20, 2024
                            <span class="badge badge-light badge-pill">Info Update</span>
                        </li>
                        <li class="list-group-item d-flex justify-content-between align-items-center">
                            Completed task: Submit Report - Sept 18, 2024
                            <span class="badge badge-success badge-pill">Completed</span>
                        </li>
                        <li class="list-group-item d-flex justify-content-between align-items-center">
                            Received new notification - Sept 15, 2024
                            <span class="badge badge-warning badge-pill">New</span>
                        </li>
                    </ul>
                </div>
            </div>
        </div>

        <!-- Resources & Tools and Quick Tips -->
        <div class="col-md-6">
            <!-- Resources & Tools -->
            <div class="card shadow border-0 mb-4">
                <div class="card-header bg-success text-white font-weight-bold">Resources & Tools</div>
                <div class="card-body">
                    <ul class="list-group">
                        <li class="list-group-item"><a href="employeeHandbook.jsp" class="text-dark">Employee Handbook</a></li>
                        <li class="list-group-item"><a href="trainingMaterials.jsp" class="text-dark">Training Materials</a></li>
                        <li class="list-group-item"><a href="companyPolicies.jsp" class="text-dark">Company Policies</a></li>
                    </ul>
                </div>
            </div>

            <!-- Quick Tips -->
            <div class="card shadow border-0">
                <div class="card-header bg-warning text-dark font-weight-bold">Quick Tips</div>
                <div class="card-body">
                    <ul class="list-group">
                        <li class="list-group-item">Tip 1: Regularly update your profile to keep your information accurate.</li>
                        <li class="list-group-item">Tip 2: Use the task management feature to stay organized.</li>
                        <li class="list-group-item">Tip 3: Check notifications daily to stay informed.</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>

        
        
        
        

        <!-- About Us Section -->
        <div class="about-us mt-5">
            <h3><i class="fas fa-info-circle icon"></i>About Us</h3>
            <p>Welcome to the Staff Management System! Our goal is to streamline the management of staff activities and improve overall efficiency within your organization. We provide an intuitive and user-friendly interface to handle tasks, manage profiles, and keep track of important notifications and requests.</p>
            <p>Our team is dedicated to delivering top-notch features and continuous improvements to ensure that you have the best tools at your disposal. We are committed to supporting you with a reliable and efficient system designed to meet your needs.</p>
            <p>If you have any questions or need assistance, feel free to reach out to our support team. We are here to help!</p>
        </div>
    </div>
    
    
    
    
    
    
<!-- Footer -->
<footer style="background-color: gray; color: white; padding: 1rem 0; margin-top: 20px;">
    <div style="max-width: 1100px; margin: auto; text-align: center;">
        <div style="display: flex; justify-content: space-around; flex-wrap: wrap;">
            <div style="flex: 1; padding: 1rem;">
                <h5 style="color: white; margin-bottom: 1rem; font-weight: bold;">About Us</h5>
                <p style="color:white ;">We are dedicated to providing the best staff management tools to streamline your administrative tasks and improve efficiency. Contact us for more information or support.</p>
            </div>
            <div style="flex: 1; padding: 1rem;">
                <h5 style="color: white; margin-bottom: 1rem; font-weight: bold;">Quick Links</h5>
                <ul style="list-style-type: none; padding: 0;">
                    <li><a href="#" style="color: #d3d3d3; text-decoration: none;">Home</a></li>
                    <li><a href="#" style="color: #d3d3d3; text-decoration: none;">Profile</a></li>
                    <li><a href="#" style="color: #d3d3d3; text-decoration: none;">Settings</a></li>
                    <li><a href="viewLeaveRequests" style="color: #d3d3d3; text-decoration: none;">Leave Requests</a></li>
                </ul>
            </div>
            <div style="flex: 1; padding: 1rem;">
                <h5 style="color: white; margin-bottom: 1rem; font-weight: bold;">Contact Us</h5>
                <p style="color: white;">Email: support@example.com</p>
                <p style="color: white;">Phone: +123 456 7890</p>
                <div style="margin-top: 1rem;">
                    <a href="#" style="color: white; font-size: 1.5rem; margin: 0 10px; text-decoration: none;"><i class="fab fa-facebook-f"></i></a>
                    <a href="#" style="color: white; font-size: 1.5rem; margin: 0 10px; text-decoration: none;"><i class="fab fa-twitter"></i></a>
                    <a href="#" style="color: white; font-size: 1.5rem; margin: 0 10px; text-decoration: none;"><i class="fab fa-linkedin-in"></i></a>
                    <a href="#" style="color: white; font-size: 1.5rem; margin: 0 10px; text-decoration: none;"><i class="fab fa-instagram"></i></a>
                </div>
            </div>
        </div>
        <div style="margin-top: 1rem;">
            <p>&copy; 2024 Staff Management System. All rights reserved.</p>
        </div>
    </div>
</footer>


    <!-- Optional JavaScript -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>

</html>
