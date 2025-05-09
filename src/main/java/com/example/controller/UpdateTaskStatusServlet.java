package com.example.controller;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;
import com.staffmanagement.dao.*;

public class UpdateTaskStatusServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private TaskDAO taskDAO;

    @Override
    public void init() {
        taskDAO = new TaskDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String[] completedTaskIds = request.getParameterValues("completedTasks");

        if (completedTaskIds != null) {
            for (String taskId : completedTaskIds) {
                int id = Integer.parseInt(taskId);
                taskDAO.updateTaskStatus(id, "completed");
            }
            // Redirect to the tasks page with a success message
            request.setAttribute("message", "Selected tasks marked as completed.");
        } else {
            request.setAttribute("message", "No tasks selected.");
        }

        // Redirecting back to the staff tasks page
        RequestDispatcher dispatcher = request.getRequestDispatcher("staffTasks.jsp");
        dispatcher.forward(request, response);
    }
}
