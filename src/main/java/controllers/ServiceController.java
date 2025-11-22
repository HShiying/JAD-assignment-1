package controllers;

import java.io.IOException;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import dao.ServiceDao;
import models.Service;

@WebServlet("/ServiceController")
public class ServiceController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        ServiceDao dao = new ServiceDao();

        if ("addService".equals(action)) {
            Service s = new Service(
                0,
                request.getParameter("serviceName"),
                request.getParameter("serviceDesc"),
                Double.parseDouble(request.getParameter("price")),
                Integer.parseInt(request.getParameter("categoryId")),
                request.getParameter("imagePath")
            );
            dao.addService(s);
            response.sendRedirect("admin/services/adminListServices.jsp");
        }

        if ("updateService".equals(action)) {
            Service s = new Service(
                Integer.parseInt(request.getParameter("serviceId")),
                request.getParameter("serviceName"),
                request.getParameter("serviceDesc"),
                Double.parseDouble(request.getParameter("price")),
                Integer.parseInt(request.getParameter("categoryId")),
                request.getParameter("imagePath")
            );
            dao.updateService(s);
            response.sendRedirect("admin/services/adminListServices.jsp");
        }

        if ("deleteService".equals(action)) {
            int id = Integer.parseInt(request.getParameter("serviceId"));
            dao.deleteService(id);
            response.sendRedirect("admin/services/adminListServices.jsp");
        }
    }
}


