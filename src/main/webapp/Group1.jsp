<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="bean.SQLInformation" %><%--
  Created by IntelliJ IDEA.
  User: Allen Wu
  Date: 3/6/2022
  Time: 6:56 PM
  To change this template use File | Settings | File Templates.
--%>
<!--Database stuff-->
<%
    String driverName = "com.mysql.jdbc.Driver";
    String connectionUrl = "jdbc:mysql://localhost:3306/";
    String dbName = SQLInformation.databaseName;
    String userId = SQLInformation.username;
    String password = SQLInformation.password;

    try {
        Class.forName(driverName);
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    }
    Connection connection = null;
    ResultSet resultSet = null;
    Statement statement = null;
%>
<html>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/table.css">
<head>
    <title>Census Age group from ${message}</title>
</head>
<body>
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
<h2 >Census Age group from ${message}</h2>
<div align="center">
    <table align="center" cellpadding="4" cellspacing="4">
        <tr>
            <th>GeographicArea</th>
            <th>AgeGroup</th>
            <th>Male</th>
            <th>Female</th>
        </tr>
        <tr>
            <%
                try {
                    connection= DriverManager.getConnection(
                            connectionUrl + dbName, userId, password);
                    statement = connection.createStatement();
                    String sql = "SELECT * FROM age WHERE censusYear = 1";

                    resultSet = statement.executeQuery(sql);
                    while(resultSet.next()){
            %>
            <td><%=resultSet.getInt("geographicArea")%></td>
            <td><%=resultSet.getInt("ageGroup")%></td>
            <td><%=resultSet.getInt("male")%></td>
            <td><%=resultSet.getInt("female")%></td>
        </tr>
        <%
                }} catch (Exception e){
                e.printStackTrace();
            }
        %>
    </table>
</div>
<footer>
    Page created by: Allen wu, Keith Sialana, Chinar Shakari
</footer>
</body>
</html>
