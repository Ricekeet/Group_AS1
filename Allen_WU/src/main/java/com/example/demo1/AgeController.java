package com.example.demo1;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AgeController", value = "/AgeController")
public class AgeController extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //Takes the number
        String year = request.getParameter("year");

        //Check which year it is
        int yearCensus = Integer.parseInt(year);
        //Year 2011
        if(yearCensus == 1){
            HttpSession session = request.getSession();
            session.setAttribute("message", "2011");

            getServletContext()
                    .getRequestDispatcher("/Group1.jsp")
                    .forward(request, response);
        }
        //Year 2016
        else if(yearCensus == 2){
            HttpSession session = request.getSession();
            session.setAttribute("message", "2016");

            getServletContext()
                    .getRequestDispatcher("/Group2.jsp")
                    .forward(request, response);
        }
        //For whatever reason, no value
        else{
            String message = "Something went wrong";
            request.setAttribute("message", message);

            getServletContext()
                    .getRequestDispatcher("/index.jsp")
                    .forward(request, response);
        }

    }
}
