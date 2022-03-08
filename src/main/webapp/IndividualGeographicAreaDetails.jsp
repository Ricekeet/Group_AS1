<%@ page import="com.example.group_as1.GeographicalAreaHandler" %><%--
  Created by IntelliJ IDEA.
  User: Chinar
  Date: 3/6/2022
  Time: 11:35 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% GeographicalAreaHandler handler = new GeographicalAreaHandler();
    request.setAttribute("areas", handler.getAllAreas()); %>
<html>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
<head>
    <title>Individual Geographical Area Details</title>
</head>
<body>
    <h1>Individual Geographical Area Details</h1>
    <form action="IndividualGeographicAreaController" method="post">
        <select name="areas" id="areas">

            <c:forEach var="item" items="${requestScope.areas}">
                <option id="${item.id}" value="${item.id}">${item.name}</option>
            </c:forEach>
        </select>
        <input type="submit" value="Show Details">
    </form>
    <h4>
        <c:if test="${requestScope.areaDetails != null}">
            <c:forEach items="${requestScope.areaDetails}" var="item">
                <p>
                    name: ${item.name}
                </p>
                <p>
                    code: ${item.code}
                </p>
                <p>
                    level: ${item.level}
                </p>
                <p>
                    population: ${item.combined}
                </p>
            </c:forEach>
        </c:if>

    </h4>
</body>
</html>
