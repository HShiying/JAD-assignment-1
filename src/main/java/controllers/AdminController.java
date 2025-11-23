package controllers;

import java.io.IOException;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import dao.AdminDao;

@WebServlet("/AdminController")
public class AdminController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        AdminDao dao = new AdminDao();

        if ("deleteClient".equals(action)) {
            int id = Integer.parseInt(request.getParameter("clientId"));
            System.out.println("Deleting client with ID: " + id); // debug
            boolean deleted = dao.deleteClient(id);
            
            if(deleted) {
                System.out.println("Client deleted successfully");
            } else {
                System.out.println("Client deletion failed");
            }

            response.sendRedirect(request.getContextPath() + "/admin/clients/adminListClients.jsp");
        }

    }
}