package com.staffmanagement.servlets;

import com.staffmanagement.dao.TaskDAO;
import com.staffmanagement.model.Task;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class EditTaskServlet extends HttpServlet {
    private TaskDAO taskDAO = new TaskDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Task task = taskDAO.getTaskById(id);
        request.setAttribute("task", task);
        RequestDispatcher dispatcher = request.getRequestDispatcher("EditTask.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String deadline = request.getParameter("deadline");
        String status = request.getParameter("status");

        Task task = new Task(id, "", title, description, "", deadline, status);
        taskDAO.updateTask(task);
        
        response.sendRedirect("TaskDashboardServlet");
    }
}
