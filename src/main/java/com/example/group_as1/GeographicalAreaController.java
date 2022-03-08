package com.example.group_as1;

import bean.SQLInformation;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "GeographicalAreaController", value = "/GeographicalAreaController")
public class GeographicalAreaController extends HttpServlet {

    private GeographicalAreaHandler handler;

    public GeographicalAreaController() throws ClassNotFoundException{
        super();
        handler = new GeographicalAreaHandler();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pageName = request.getParameter("pageName");
        String forward = "";

        // Check if SQL user object exists
        if (request.getAttribute("DBUser") == null && SQLInformation.username == null){
            request.setAttribute("message", "Please log in to SQL");

            forward = "SQLGetInfo.jsp";
            RequestDispatcher view = request.getRequestDispatcher(forward);
            view.forward(request,response);
        }

        request.setAttribute("areaResults",
                handler.findByLevel(Integer.parseInt(request.getParameter("levels"))));

        forward = "GeographicalAreaClassificationList.jsp";
        RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request,response);
    }
}
