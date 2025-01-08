package com.crud.servlet;

import com.crud.model.Admin;
import com.crud.service.AdminService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/admin")
public class AdminServlet extends HttpServlet {
    /**
     * 
     */
    private static final long serialVersionUID = 1L;
    private AdminService adminService;

    @Override
    public void init() throws ServletException {
        super.init();
        adminService = new AdminService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            // Default action: Show all admins
            request.setAttribute("admins", adminService.getAllAdmins());
            request.getRequestDispatcher("admin/manageAdminsIndex.jsp").forward(request, response);
        } else if (action.equals("create")) {
            // Show the create admin form
            request.getRequestDispatcher("createAdmin.jsp").forward(request, response);
        } else if (action.equals("view")) {
            // Fetch admin details by ID and forward to details page
            int id = Integer.parseInt(request.getParameter("id"));
            Admin admin = adminService.getAdmin(id);
            request.setAttribute("admin", admin);
            request.getRequestDispatcher("adminDetails.jsp").forward(request, response);
        } else if (action.equals("edit")) {
            // Fetch admin by ID and show the edit form
            int id = Integer.parseInt(request.getParameter("id"));
            Admin admin = adminService.getAdmin(id);
            request.setAttribute("admin", admin);
            request.getRequestDispatcher("editAdmin.jsp").forward(request, response);
        } else if (action.equals("delete")) {
            // Handle admin deletion, redirect to list page after deletion
            int id = Integer.parseInt(request.getParameter("id"));
            adminService.deleteAdmin(id);
            response.sendRedirect("admin");  // Default action, no action needed in URL
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action.equals("create")) {
            // Create a new admin
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String picture = request.getParameter("picture");
            String email = request.getParameter("email");
            String firstName = request.getParameter("first_name");
            String lastName = request.getParameter("last_name");

            Admin admin = new Admin();
            admin.setUsername(username);
            admin.setPassword(password);
            admin.setPicture(picture);
            admin.setEmail(email);
            admin.setFirstName(firstName);
            admin.setLastName(lastName);

            if (adminService.createAdmin(admin)) {
                response.sendRedirect("admin");  // Redirect to the admin list page
            } else {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            }
        } else if (action.equals("update")) {
            // Update existing admin details
            int id = Integer.parseInt(request.getParameter("id"));
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String picture = request.getParameter("picture");
            String email = request.getParameter("email");
            String firstName = request.getParameter("first_name");
            String lastName = request.getParameter("last_name");

            Admin admin = new Admin();
            admin.setId(id);
            admin.setUsername(username);
            admin.setPassword(password);
            admin.setPicture(picture);
            admin.setEmail(email);
            admin.setFirstName(firstName);
            admin.setLastName(lastName);

            if (adminService.updateAdmin(admin)) {
                response.sendRedirect("admin");  // Redirect to the admin list page
            } else {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            }
        } else if (action.equals("delete")) {
            // Delete an admin
            int id = Integer.parseInt(request.getParameter("id"));
            if (adminService.deleteAdmin(id)) {
                response.sendRedirect("admin");  // Redirect to the admin list page
            } else {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            }
        }
    }
}

