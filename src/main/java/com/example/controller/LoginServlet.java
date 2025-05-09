package com.example.controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.*;
import javax.servlet.http.*;
import com.example.dao.AdminDAO;
import com.example.dao.StaffDAO;
import com.example.model.Staff;

public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private AdminDAO adminDAO;
    private StaffDAO staffDAO;

    @Override
    public void init() {
        adminDAO = new AdminDAO();
        staffDAO = new StaffDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve the username and password from the login form
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Validate inputs (basic check to ensure username and password aren't null or empty)
        if (username == null || username.trim().isEmpty() || password == null || password.trim().isEmpty()) {
            request.setAttribute("status", "Failed");
            request.setAttribute("errorMessage", "Username and password cannot be empty.");
            forwardToLogin(request, response);
            return;
        }

        // Admin login validation
        if (adminDAO.validateUser(username, password)) {
            HttpSession session = request.getSession();
            session.setAttribute("role", "admin");
            session.setAttribute("username", username);

            // Fetch all staff members for admin
            List<Staff> staffList = staffDAO.selectAllStaff();
            session.setAttribute("staffList", staffList);

            // Redirect to admin dashboard
            response.sendRedirect("adminDashboard.jsp");
        }
        // Staff login validation
        else if (staffDAO.validateUser(username, password)) {
            HttpSession session = request.getSession();
            session.setAttribute("role", "staff");
            session.setAttribute("username", username);

            // Redirect to staff dashboard
            response.sendRedirect("staffDashboard.jsp");
        }
        // Invalid credentials
        else {
            // Set failure status and error message for invalid credentials
            request.setAttribute("status", "Failed");
            request.setAttribute("errorMessage", "Invalid username or password.");
            forwardToLogin(request, response);
        }
    }

    // Forward the request to the login page in case of error or failed login
    private void forwardToLogin(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Redirect GET requests to the login page (optional, or you could delegate to doPost)
        response.sendRedirect("login.jsp");
    }
}
