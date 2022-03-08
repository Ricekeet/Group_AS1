package com.example.group_as1;

import Util.DBUtil;
import bean.SQLInformation;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "SQLLogin", value = "/SQLLogin")
public class SQLCredentialsServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String forward;
        if (DBUtil.getConnection(request.getParameter("database"),
                request.getParameter("user"), request.getParameter("password"))
        != null){
            // If a connection was found
            SQLInformation.databaseName = (request.getParameter("database"));
            SQLInformation.username = (request.getParameter("user"));
            SQLInformation.password = (request.getParameter("password"));

            request.setAttribute("DBUser", "Valid");
            forward = "index.jsp";
            RequestDispatcher view = request.getRequestDispatcher(forward);
            view.forward(request,response);
        }else{
            // If getConnection returned a null, SQL database is inaccessable.
            request.setAttribute("message", "One or more of your inputs were wrong");

            forward = "SQLGetInfo.jsp";
            RequestDispatcher view = request.getRequestDispatcher(forward);
            view.forward(request,response);
        }
    }
}
