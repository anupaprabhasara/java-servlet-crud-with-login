package com.crud.servlet;

import com.crud.model.Admin;
import com.crud.service.AdminService;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;

@WebServlet("/admin")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50) // 50MB
public class AdminServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private AdminService adminService;

    @Override
    public void init() throws ServletException {
        super.init();
        adminService = new AdminService();
    }

    private String handlePhotoUpload(Part filePart, String uploadDirectory) throws IOException {
        if (filePart != null && filePart.getSize() > 0) {
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            String uploadPath = getServletContext().getRealPath("") + File.separator + uploadDirectory;

            // Ensure directory exists
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdirs();
            }

            // Save the file to the specified directory
            String filePath = uploadPath + File.separator + fileName;
            filePart.write(filePath);

            return fileName;
        }
        return null;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("admin") == null) {
            response.sendRedirect(request.getContextPath() + "/admin/login");
            return;
        }

        // Add session variables to the request for use in JSP
        request.setAttribute("firstName", session.getAttribute("firstName"));
        request.setAttribute("lastName", session.getAttribute("lastName"));
        request.setAttribute("picture", session.getAttribute("picture"));

        if (action == null) {
            request.setAttribute("admins", adminService.getAllAdmins());
            request.getRequestDispatcher("admin/manageAdminsIndex.jsp").forward(request, response);
        } else if (action.equals("create")) {
            request.getRequestDispatcher("admin/manageAdminsCreate.jsp").forward(request, response);
        } else if (action.equals("view")) {
            int id = Integer.parseInt(request.getParameter("id"));
            Admin admin = adminService.getAdmin(id);
            request.setAttribute("admin", admin);
            request.getRequestDispatcher("admin/manageAdminsIndex.jsp").forward(request, response);
        } else if (action.equals("edit")) {
            int id = Integer.parseInt(request.getParameter("id"));
            Admin admin = adminService.getAdmin(id);
            request.setAttribute("admin", admin);
            request.getRequestDispatcher("admin/manageAdminsUpdate.jsp").forward(request, response);
        } else if (action.equals("delete")) {
            int id = Integer.parseInt(request.getParameter("id"));
            adminService.deleteAdmin(id);
            response.sendRedirect("admin");
        } else if (action.equals("logout")) {
            session.invalidate();
            response.sendRedirect(request.getContextPath() + "/admin/login");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action.equals("create")) {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String email = request.getParameter("email");
            String firstName = request.getParameter("first_name");
            String lastName = request.getParameter("last_name");
            Part picturePart = request.getPart("picture");

            String picture = handlePhotoUpload(picturePart, "admin/picture");

            Admin admin = new Admin();
            admin.setUsername(username);
            admin.setPassword(password);
            admin.setPicture(picture);
            admin.setEmail(email);
            admin.setFirstName(firstName);
            admin.setLastName(lastName);

            if (adminService.createAdmin(admin)) {
                response.sendRedirect("admin");
            } else {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            }
        } else if (action.equals("update")) {
            int id = Integer.parseInt(request.getParameter("id"));
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String email = request.getParameter("email");
            String firstName = request.getParameter("first_name");
            String lastName = request.getParameter("last_name");
            Part picturePart = request.getPart("picture");

            String picture = handlePhotoUpload(picturePart, "admin/picture");

            Admin admin = new Admin();
            admin.setId(id);
            admin.setUsername(username);
            admin.setPassword(password);
            admin.setEmail(email);
            admin.setFirstName(firstName);
            admin.setLastName(lastName);

            if (picture != null) {
                admin.setPicture(picture);
            }

            if (adminService.updateAdmin(admin)) {
                response.sendRedirect("admin");
            } else {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            }
        } else if (action.equals("delete")) {
            int id = Integer.parseInt(request.getParameter("id"));
            if (adminService.deleteAdmin(id)) {
                response.sendRedirect("admin");
            } else {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            }
        }
    }
}
