<html>
<head>
    <title>Delete Task</title>
</head>
<body>
    <h1>Delete Task</h1>
    <p>Are you sure you want to delete this task?</p>
    <form action="DeleteTaskServlet" method="post">
        <input type="hidden" name="id" value="${task.id}"/>
        <input type="submit" value="Yes"/>
        <a href="TaskDashboardServlet">No</a>
    </form>
</body>
</html>
