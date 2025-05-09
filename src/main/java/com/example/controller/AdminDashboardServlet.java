package com.example.controller;

import com.example.dao.StaffDAO;
import com.example.model.Staff;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/adminDashboard")
public class AdminDashboardServlet extends HttpServlet {
    private StaffDAO staffDAO;

    @Override
    public void init() {
        staffDAO = new StaffDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String searchId = request.getParameter("searchId");
        List<Staff> staffList;

        if (searchId != null && !searchId.isEmpty()) {
            staffList = staffDAO.searchStaffById(searchId);
        } else {
            staffList = staffDAO.selectAllStaff();
        }

        request.setAttribute("staffList", staffList);
        request.getRequestDispatcher("adminDashboard.jsp").forward(request, response);
    }
}
