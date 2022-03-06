package com.example.group_as1;

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
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pageName = request.getParameter("pageName");
        String forward = "";

        request.setAttribute("areaResults",
                handler.findByLevel(Integer.parseInt(request.getParameter("levels"))));

        forward = "GeographicalAreaClassificationList.jsp";
        RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request,response);
    }
}
