package com.staffmanagement.servlets;

import com.staffmanagement.dao.TaskDAO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


public class UpdateTaskStatusServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String[] completedTaskIds = request.getParameterValues("completedTaskIds");

        if (completedTaskIds != null) {
            TaskDAO taskDAO = new TaskDAO();
            for (String taskIdStr : completedTaskIds) {
                int taskId = Integer.parseInt(taskIdStr);
                taskDAO.updateTaskStatus(taskId, "Completed");
            }
        }

        response.sendRedirect("staffdashboard.jsp");
    }
}