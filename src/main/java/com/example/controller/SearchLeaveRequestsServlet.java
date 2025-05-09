package com.example.controller;

import com.example.dao.LeaveRequestDAO;
import com.example.model.LeaveRequest;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;


public class SearchLeaveRequestsServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private LeaveRequestDAO leaveRequestDAO;

    @Override
    public void init() {
        leaveRequestDAO = new LeaveRequestDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String staffId = request.getParameter("staffId");
        List<LeaveRequest> leaveRequests;

        try {
            leaveRequests = leaveRequestDAO.selectLeaveRequestsByStaffId(staffId);
            request.setAttribute("leaveRequests", leaveRequests);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // Forward to the JSP page
        request.getRequestDispatcher("leave-requests.jsp").forward(request, response);
    }
}
