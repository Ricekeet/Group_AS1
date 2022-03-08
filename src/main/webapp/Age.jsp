<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<br/>
<header>
    <h1 class="title">Age</h1>
    <nav class="navContainer">
        <ul class="navUl">
            <li class="navLi"><a href="GeographicalAreaClassificationList.jsp">Geographical Area Classification list</a></li>
            <li class="navLi"><a href="IndividualGeographicAreaDetails.jsp">Individual Geographical Area Details</a></li>
            <li class="navLi"><a href="Age.jsp">Age</a></li>

        </ul>
    </nav>
</header>
<h1>Pick a year</h1>
<h3>${message}</h3>
<form action="<%=request.getContextPath()%>/AgeController" method="post">
       <select name="year" id="year">
           <option value="1">2011</option>
           <option value="2">2016</option>
       </select>
    <br>
    <input type="submit" value="Submit" />
</form>
<footer>
    Page created by: Allen wu, Keith Sialana, Chinar Shakari
</footer>
</body>
</html>