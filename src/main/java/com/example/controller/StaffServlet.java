package com.example.controller;

import com.example.dao.StaffDAO;
import com.example.model.Staff;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "StaffServlet", urlPatterns = {"/listStaff", "/updateStaff", "/deleteStaff", "/newStaff", "/createStaff"})
public class StaffServlet extends HttpServlet {
    private StaffDAO staffDAO;

    @Override
    public void init() {
        staffDAO = new StaffDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getServletPath();

        try {
            switch (action) {
                case "/listStaff":
                    listStaff(request, response);
                    break;
                case "/newStaff":
                    showNewForm(request, response);
                    break;
                case "/updateStaff":
                    showEditForm(request, response);
                    break;
                case "/deleteStaff":
                    deleteStaff(request, response);
                    break;
                default:
                    response.sendRedirect("404.jsp");
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getServletPath();

        try {
            switch (action) {
                case "/updateStaff":
                    updateStaff(request, response); 
                    break;
                default:
                    response.sendRedirect("404.jsp");
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    private void listStaff(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        List<Staff> staffList = staffDAO.selectAllStaff();
        request.setAttribute("staffList", staffList);
        request.getRequestDispatcher("adminDashboard.jsp").forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("staffForm.jsp").forward(request, response);
    }


    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Staff existingStaff = staffDAO.selectStaff(id);
        request.setAttribute("staff", existingStaff);
        request.getRequestDispatcher("updateStaff.jsp").forward(request, response);
    }

    private void updateStaff(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        // Extract parameters from the request
        int id = Integer.parseInt(request.getParameter("id"));
        String staffId = request.getParameter("staffId");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String department = request.getParameter("department");
        double salary = Double.parseDouble(request.getParameter("salary"));

        // Create a Staff object with the provided details
        Staff staff = new Staff(staffId, username, password, name, address, department, salary);
        staff.setId(id); // Set the ID for the staff member

        // Debug print statement (remove in production)
        System.out.println("Updating staff: " + staff);

        // Attempt to update the staff member in the database
        boolean updated = staffDAO.updateStaff(staff);

        if (updated) {
            // Redirect to the listStaff page if update was successful
            response.sendRedirect("listStaff");
        } else {
            // Forward to the updateStaff.jsp page with an error message if update failed
            request.setAttribute("error", "Failed to update staff member.");
            request.setAttribute("staff", staff); // Ensure staff details are reloaded
            RequestDispatcher dispatcher = request.getRequestDispatcher("updateStaff.jsp");
            dispatcher.forward(request, response);
        }
    }


    private void deleteStaff(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        staffDAO.deleteStaff(id);
        response.sendRedirect("listStaff");
    }
}
