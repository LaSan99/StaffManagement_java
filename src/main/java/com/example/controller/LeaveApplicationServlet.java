package com.example.controller;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.*;
import javax.servlet.http.*;
import com.example.dao.LeaveRequestDAO;
import com.example.dao.StaffDAO;
import com.example.model.LeaveRequest;

public class LeaveApplicationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private LeaveRequestDAO leaveRequestDAO;
    private StaffDAO staffDAO;

    @Override
    public void init() {
        leaveRequestDAO = new LeaveRequestDAO();
        staffDAO = new StaffDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");

        String startDateStr = request.getParameter("startDate");
        String endDateStr = request.getParameter("endDate");
        String reason = request.getParameter("reason");

        // Retrieve staffId from DAO
        int staffId = staffDAO.getStaffIdByUsername(username);

        // Convert startDate and endDate to java.sql.Date
        java.sql.Date startDate = java.sql.Date.valueOf(startDateStr);
        java.sql.Date endDate = java.sql.Date.valueOf(endDateStr);
        java.sql.Date today = new java.sql.Date(System.currentTimeMillis());

        // Server-side validation
        if (startDate.before(today)) {
            request.setAttribute("errorMessage", "Start date cannot be in the past.");
            request.getRequestDispatcher("leaveRequestForm.jsp").forward(request, response);
            return;
        }
        if (endDate.before(startDate)) {
            request.setAttribute("errorMessage", "End date cannot be before the start date.");
            request.getRequestDispatcher("leaveRequestForm.jsp").forward(request, response);
            return;
        }

        LeaveRequest leaveRequest = new LeaveRequest(0, staffId, null, startDate, endDate, reason, "Pending");

        try {
            leaveRequestDAO.insertLeaveRequest(leaveRequest);
            request.setAttribute("successMessage", "Your leave application has been submitted successfully!");
            request.getRequestDispatcher("leaveRequestForm.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error processing your request. Please try again.");
            request.getRequestDispatcher("leaveRequestForm.jsp").forward(request, response);
        }
    }
}