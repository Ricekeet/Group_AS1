<%--
  Created by IntelliJ IDEA.
  User: Keith
  Date: 3/7/2022
  Time: 8:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
<head>
    <title>SQL stuff</title>
</head>
<body>
<header>
    <h1 class="title">Log in to MySQL</h1>
</header>
    <form class="SQLinfo" action="SQLLogin" method="post">
        <div class="error">${requestScope.message}</div>
        <br>
        <label for="database">SQL Database Name:</label><br>
        <input type="text" id="database" name="database"><br>
        <label for="user">SQL User:</label><br>
        <input type="text" id="user" name="user"><br>
        <label for="password">SQL Password:</label><br>
        <input type="password" id="password" name="password"><br>
        <input type="submit" value="Login">
    </form>
</body>
</html>
