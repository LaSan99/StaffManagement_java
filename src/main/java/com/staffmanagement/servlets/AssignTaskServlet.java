package com.staffmanagement.servlets;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.staffmanagement.dao.TaskDAO;
import com.staffmanagement.model.Task;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@SuppressWarnings("serial")
public class AssignTaskServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Get task data from the request
		String name = request.getParameter("name");
		String title = request.getParameter("title");
		String description = request.getParameter("description");
		String deadline = request.getParameter("deadline");
		String status = request.getParameter("status");

		TaskDAO.addTask(name, title, description, deadline, status);

		// Redirect to Task Dashboard after assignment
		response.sendRedirect("TaskDashboardServlet");
	}
}
