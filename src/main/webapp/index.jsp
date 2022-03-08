<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
<head>
    <title>Group Assignment 1</title>
</head>
<body>
<% if (request.getAttribute("DBUser") == null){
    request.setAttribute("message", "Please log in to SQL");

    String forward = "SQLGetInfo.jsp";
    RequestDispatcher view = request.getRequestDispatcher(forward);
    view.forward(request,response);
}%>
<header>
    <h1 class="title">Group Assignment 1</h1>
    <nav class="navContainer">
        <ul class="navUl">
            <li class="navLi"><a href="GeographicalAreaClassificationList.jsp">Geographical Area Classification list</a></li>
            <li class="navLi"><a href="IndividualGeographicAreaDetails.jsp">Individual Geographical Area Details</a></li>
            <li class="navLi"><a href="Age.jsp">Age</a></li>

        </ul>
    </nav>
</header>

<footer>
    Page created by: Allen wu, Keith Sialana, Chinar Shakari
</footer>
</body>
</html>
