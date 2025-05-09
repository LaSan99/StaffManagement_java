package com.example.controller;

import com.example.dao.LeaveRequestDAO;
import com.example.model.LeaveRequest;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

public class LeaveStatusServlet extends HttpServlet {
    private LeaveRequestDAO leaveRequestDAO;

    @Override
    public void init() throws ServletException {
        leaveRequestDAO = new LeaveRequestDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int leaveRequestId = Integer.parseInt(request.getParameter("id"));
        String status = request.getParameter("status");

        try {
            // Update the leave request status
            leaveRequestDAO.updateLeaveStatus(leaveRequestId, status);

            // Retrieve the updated list of leave requests
            List<LeaveRequest> leaveRequests = leaveRequestDAO.selectAllLeaveRequests();
            request.setAttribute("leaveRequests", leaveRequests);

            // Forward to leave-requests.jsp with the updated data
            RequestDispatcher dispatcher = request.getRequestDispatcher("leave-requests.jsp");
            dispatcher.forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new ServletException("Error updating leave status", e);
        }
    }
}
