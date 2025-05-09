package com.example.controller;


import com.example.dao.LeaveRequestDAO;
import com.example.model.LeaveRequest;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;


public class LeaveRequestServlet extends HttpServlet {
    private LeaveRequestDAO leaveRequestDAO;

    @Override
    public void init() throws ServletException {
        leaveRequestDAO = new LeaveRequestDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            List<LeaveRequest> leaveRequests = leaveRequestDAO.selectAllLeaveRequests();
            

            request.setAttribute("leaveRequests", leaveRequests);
            request.getRequestDispatcher("/leave-requests.jsp").forward(request, response);

        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

}
