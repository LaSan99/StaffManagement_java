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
    <title>Staff Form</title>
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

        /* Navbar styling */
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


/* From Uiverse.io by gagan-gv */ 
.button {
  padding: 15px 20px;
  font-size: 16px;
  background: transparent;
  border: none;
  position: relative;
  color: #f0f0f0;
  z-index: 1;
}

.button::after,
.button::before {
  content: '';
  position: absolute;
  bottom: 0;
  right: 0;
  z-index: -99999;
  transition: all .4s;
}

.button::before {
  transform: translate(0%, 0%);
  width: 100%;
  height: 100%;
  background: #28282d;
  border-radius: 10px;
}

.button::after {
  transform: translate(10px, 10px);
  width: 35px;
  height: 35px;
  background: #ffffff15;
  backdrop-filter: blur(5px);
  border-radius: 50px;
}

.button:hover::before {
  transform: translate(5%, 20%);
  width: 110%;
  height: 110%;
}

.button:hover::after {
  border-radius: 10px;
  transform: translate(0, 0);
  width: 100%;
  height: 100%;
}

.button:active::after {
  transition: 0s;
  transform: translate(0, 5%);
}
    </style>
</head>

<body>
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

    <!-- Form -->
    <div class="container">
        <div class="form-container">
            <div class="form-header">
                <h2><i class="fas fa-user-plus"></i> Add New Staff</h2>
            </div>

            <!-- Display error message -->
            <c:if test="${not empty errorMessage}">
                <div class="alert alert-danger">
                    ${errorMessage}
                </div>
            </c:if>

            <form onsubmit="return validateForm()" action="insertStaff" method="post">
                <div class="form-group form-control-icon">
                    <label for="staffId" class="form-label">Staff ID:</label>
                    <input type="text" name="staffId" id="staffId" class="form-control" required>
                    <i class="fas fa-id-badge"></i>
                </div>
                <div class="form-group form-control-icon">
                    <label for="username" class="form-label">Username:</label>
                    <input type="text" name="username" id="username" class="form-control" required>
                    <i class="fas fa-user"></i>
                </div>
                <div class="form-group form-control-icon">
                    <label for="password" class="form-label">Password:</label>
                    <input type="password" name="password" id="password" class="form-control" required>
                    <i class="fas fa-lock"></i>
                </div>
                <div class="form-group form-control-icon">
                    <label for="name" class="form-label">Name:</label>
                    <input type="text" name="name" id="name" class="form-control" required>
                    <i class="fas fa-user-tag"></i>
                </div>
                <div class="form-group form-control-icon">
                    <label for="address" class="form-label">Address:</label>
                    <input type="text" name="address" id="address" class="form-control">
                    <i class="fas fa-home"></i>
                </div>
                <div class="form-group form-control-icon">
                    <label for="department" class="form-label">Department:</label>
                    <input type="text" name="department" id="department" class="form-control">
                    <i class="fas fa-building"></i>
                </div>
                <div class="form-group form-control-icon">
                    <label for="salary" class="form-label">Salary:</label>
                    <input type="number" step="0.01" name="salary" id="salary" class="form-control">
                    <i class="fas fa-dollar-sign"></i>
                </div>
                <div class="form-group">
                   
                   <button class="button" type="submit"> Add Member</button>

                </div>
            </form>

            <div id="errorMessage" class="alert alert-danger"></div>
        </div>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <script>
        function validateForm() {
            var staffId = document.getElementById("staffId").value;
            var password = document.getElementById("password").value;
            var errorMessage = document.getElementById("errorMessage");

            // Check password length
            if (password.length < 8) {
                errorMessage.style.display = 'block';
                errorMessage.innerHTML = 'Password must be at least 8 characters long.';
                return false;
            }

            // Validate staff ID format (e.g., IT12345678)
            var staffIdPattern = /^IT\d{8}$/;
            if (!staffIdPattern.test(staffId)) {
                errorMessage.style.display = 'block';
                errorMessage.innerHTML = 'Staff ID must be in the format "IT" followed by 8 digits (e.g., IT12345678).';
                return false;
            }

            // If no errors, hide the error message and allow form submission
            errorMessage.style.display = 'none';
            return true;
        }
    </script>
</body>

</html>
