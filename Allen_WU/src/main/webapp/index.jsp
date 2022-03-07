<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<br/>
<h1>Pick a year</h1>
<h3>${message}</h3>
<form action="<%=request.getContextPath()%>/AgeController" method="post">
       <select name="year" id="year">
           <option value="1">2011</option>
           <option value="2">2016</option>
       </select>
    <input type="submit" value="Submit" />
</form>

</body>
</html>