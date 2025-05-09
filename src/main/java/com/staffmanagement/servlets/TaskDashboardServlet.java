package com.staffmanagement.servlets;

import com.staffmanagement.dao.TaskDAO;
import com.staffmanagement.model.Task;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class TaskDashboardServlet extends HttpServlet {
    private TaskDAO taskDAO = new TaskDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Task> tasks = taskDAO.getAllTasks();
       

        request.setAttribute("tasks", tasks);
        RequestDispatcher dispatcher = request.getRequestDispatcher("TaskDashboard.jsp");
        dispatcher.forward(request, response);
    }


}
