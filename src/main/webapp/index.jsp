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
    <h1>Group Assignment 1</h1>
    <div class="navContainer">
        <ul>
            <a href="GeographicalAreaClassificationList.jsp"><li>Geographical Area Classification list</li></a>
            <a href="IndividualGeographicAreaDetails.jsp"><li>Individual Geographical Area Details</li></a>
            <a href="Age.jsp"><li>Age</li></a>
        </ul>
    </div>
<br/>
</body>
</html>
