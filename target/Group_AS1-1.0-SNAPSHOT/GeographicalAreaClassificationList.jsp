<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.example.group_as1.GeographicalAreaHandler" %><%--
  Created by IntelliJ IDEA.
  User: Keith
  Date: 3/5/2022
  Time: 7:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% GeographicalAreaHandler handler = new GeographicalAreaHandler();
    request.setAttribute("levels", handler.getAllLevels()); %>
<html>
<head>
    <title>Geographical Area Classification List</title>
</head>
<body>
    <h1>Geographical Area Classification List</h1>
    <p>Geographical Areas are classified by a hierarchy level.</p>
    <h3>Classification Levels</h3>
    <ul>
        <li>0 - The Country of Canada</li>
        <li>1 - Province of Canada</li>
        <li>2 - Census Metropolitan Areas (CMA) and Census Agglomerations (CA)</li>
        <li>3 - One MCA and three CAs are divided between adjacent provinces. A value equal to 3 signifies that this
        unit is one provincial part of a larger area.</li>
    </ul>
    <br><br>
    <form action="GeographicalAreaController" method="post">
        <h3>Choose a level</h3>
        <select name="levels" id="levels">

<%--    Add levels into the dropdown list--%>
            <c:forEach var="item" items="${requestScope.levels}">
                <option value="${item.id}">${item}</option>
            </c:forEach>
        </select>
        <input type="submit" value="Search">
    </form>
    <br>
    <h3>Results</h3>
    <ul>
        <c:if test="${requestScope.areaResults != null}">
            <c:forEach items="${requestScope.areaResults}" var="item">
                <li>
                    ${item.name}
                </li>
            </c:forEach>
        </c:if>
    </ul>
</body>
</html>
