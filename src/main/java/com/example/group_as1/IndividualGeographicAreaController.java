package com.example.group_as1;

import bean.AreaDetails;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "IndividualGeographicAreaController", value = "/IndividualGeographicAreaController")
public class IndividualGeographicAreaController extends HttpServlet {

    private GeographicalAreaHandler handler;

    public IndividualGeographicAreaController() throws ClassNotFoundException{
        super();
        handler = new GeographicalAreaHandler();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int areas = Integer.parseInt(request.getParameter("areas"));

        request.setAttribute("areaDetails", handler.RecordDetails(areas));

        String forward = "IndividualGeographicAreaDetails.jsp";
        RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request,response);
    }
}
