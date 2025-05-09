package com.staffmanagement.servlets;

import com.staffmanagement.dao.TaskDAO;
import com.staffmanagement.model.Task;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/StaffDashboardServlet")
public class StaffDashboardServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String empName = request.getParameter("empName"); // Retrieve the employee name from the form
        TaskDAO taskDAO = new TaskDAO();
        List<Task> taskList;

        if (empName != null && !empName.isEmpty()) {
            // Search tasks by employee name
            taskList = taskDAO.getTasksByEmpName(empName);
        } else {
            // Retrieve all tasks if no search term is provided
            taskList = taskDAO.getAllTasks();
        }

        request.setAttribute("taskList", taskList);
        request.getRequestDispatcher("staffdashboard.jsp").forward(request, response);
    }
}
