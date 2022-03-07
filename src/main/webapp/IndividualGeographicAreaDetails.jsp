<%--
  Created by IntelliJ IDEA.
  User: Chinar
  Date: 3/6/2022
  Time: 11:35 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Individual Geographical Area Details</title>
</head>
<body>
    <h1>Individual Geographical Area Details</h1>
    <jsp:useBean id="areaDetails" class="bean.AreaDetails"></jsp:useBean>
    <h3>${areaDetails.toString()}</h3>
</body>
</html>
