<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %><%--
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
    String dbName = "census";
    String userId = "root";
    String password = "!Shanghai1";

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
<h2>Census Age group from ${message}</h2>
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
</body>
</html>
