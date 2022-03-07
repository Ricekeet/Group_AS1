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
    <h1>Pick a year</h1>
    <h3>${message}</h3>
</header>
<form action="<%=request.getContextPath()%>/AgeController" method="post">
       <select name="year" id="year">
           <option value="1">2011</option>
           <option value="2">2016</option>
       </select>
    <br>
    <input type="submit" value="Submit" />
</form>
</body>
</html>