package com.example.controller;

import com.example.dao.StaffDAO;
import com.example.model.LeaveRequest;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;


public class ViewLeaveRequestsServlet extends HttpServlet {
    private StaffDAO staffDAO;

    public void init() {
        staffDAO = new StaffDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");

        int staffId = staffDAO.getStaffIdByUsername(username);
		List<LeaveRequest> leaveRequests = staffDAO.getLeaveRequestsByStaffId(staffId);

		request.setAttribute("leaveRequests", leaveRequests);

        RequestDispatcher dispatcher = request.getRequestDispatcher("viewLeaveRequests.jsp");
        dispatcher.forward(request, response);
    }
}
