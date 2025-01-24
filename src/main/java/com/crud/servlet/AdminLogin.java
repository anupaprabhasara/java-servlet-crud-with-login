package com.crud.servlet;

import com.crud.model.Admin;
import com.crud.service.AdminService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/admin/login")
public class AdminLogin extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private AdminService adminService = new AdminService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String identifier = request.getParameter("email"); // Can be email or username
        String password = request.getParameter("password");

        // Check if session already exists
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("admin") != null) {
            response.sendRedirect(request.getContextPath() + "/admin");
            return;
        }

        // Authenticate admin
        Admin admin = authenticateAdmin(identifier, password);

        if (admin != null) {
            // Create a new session for the authenticated admin
            session = request.getSession(true);
            session.setAttribute("admin", admin);
            session.setAttribute("firstName", admin.getFirstName());
            session.setAttribute("lastName", admin.getLastName());
            session.setAttribute("picture", admin.getPicture());
            session.setMaxInactiveInterval(30 * 60); // Session expires after 30 minutes

            // Redirect to the dashboard
            response.sendRedirect(request.getContextPath() + "/admin");
        } else {
            // Authentication failed, redirect back to login page with error
            request.setAttribute("error", "Invalid email/username or password");
            request.getRequestDispatcher("/admin/login.jsp").forward(request, response);
        }
    }

    private Admin authenticateAdmin(String identifier, String password) {
        for (Admin admin : adminService.getAllAdmins()) {
            if ((admin.getEmail().equalsIgnoreCase(identifier) || admin.getUsername().equalsIgnoreCase(identifier)) 
                    && admin.getPassword().equals(password)) {
                return admin;
            }
        }
        return null;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Check for existing error message (e.g., from invalid login attempt)
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("admin") != null) {
            // Redirect authenticated user to the dashboard
            response.sendRedirect(request.getContextPath() + "/admin");
        } else {
            // Redirect to login page
            request.getRequestDispatcher("/admin/login.jsp").forward(request, response);
        }
    }
}
