package com.example.controller;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.*;
import javax.servlet.http.*;
import com.example.dao.StaffDAO;
import com.example.model.Staff;

public class InsertStaffServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private StaffDAO staffDAO;

    @Override
    public void init() {
        staffDAO = new StaffDAO();  // Initialize StaffDAO
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String staffId = request.getParameter("staffId");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String department = request.getParameter("department");
        double salary = Double.parseDouble(request.getParameter("salary"));

        // Validate uniqueness of username and staffId
        if (staffDAO.isUsernameTaken(username)) {
            request.setAttribute("errorMessage", "Username is already taken");
            RequestDispatcher dispatcher = request.getRequestDispatcher("staffForm.jsp");
            dispatcher.forward(request, response);
            return;
        }

        if (staffDAO.isStaffIdTaken(staffId)) {
            request.setAttribute("errorMessage", "Staff ID is already taken");
            RequestDispatcher dispatcher = request.getRequestDispatcher("staffForm.jsp");
            dispatcher.forward(request, response);
            return;
        }

        // If both are unique, proceed to insert the new staff member
        Staff newStaff = new Staff(staffId, username, password, name, address, department, salary);
        try {
            staffDAO.addStaff(newStaff);
            response.sendRedirect("listStaff"); // Redirect after successful insert
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Failed to add staff");
            RequestDispatcher dispatcher = request.getRequestDispatcher("error.jsp");
            dispatcher.forward(request, response);
        }
    }

}
