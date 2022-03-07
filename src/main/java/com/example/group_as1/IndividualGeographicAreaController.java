package com.example.group_as1;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "IndividualGeographicAreaController", value = "/IndividualGeographicAreaController")
public class IndividualGeographicAreaController extends HttpServlet {

    private GeographicalAreaHandler handler;

    public IndividualGeographicAreaController() throws ClassNotFoundException{
        super();
        handler = new GeographicalAreaHandler();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int areaId = Integer.parseInt(request.getParameter("id"));

        request.setAttribute("details", handler.RecordDetails(areaId));

        getServletContext().getRequestDispatcher("/IndividualGeographicAreaDetails")
                .forward(request,response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
