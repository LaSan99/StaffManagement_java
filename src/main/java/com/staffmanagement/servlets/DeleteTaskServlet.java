package com.staffmanagement.servlets;

import com.staffmanagement.dao.TaskDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class DeleteTaskServlet extends HttpServlet {
    private TaskDAO taskDAO = new TaskDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        taskDAO.deleteTask(id);
        response.sendRedirect("TaskDashboardServlet");
    }
}
