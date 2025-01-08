package com.crud.servlet;

import com.crud.model.User;
import com.crud.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/user")
public class UserServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private UserService userService;

    @Override
    public void init() throws ServletException {
        super.init();
        userService = new UserService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            // Default action: Show all users
            request.setAttribute("users", userService.getAllUsers());
            request.getRequestDispatcher("userList.jsp").forward(request, response);
        } else if (action.equals("create")) {
            // Show the create user form
            request.getRequestDispatcher("createUser.jsp").forward(request, response);
        } else if (action.equals("view")) {
            // Fetch user details by ID and forward to details page
            int id = Integer.parseInt(request.getParameter("id"));
            User user = userService.getUser(id);
            request.setAttribute("user", user);
            request.getRequestDispatcher("userDetails.jsp").forward(request, response);
        } else if (action.equals("edit")) {
            // Fetch user by ID and show the edit form
            int id = Integer.parseInt(request.getParameter("id"));
            User user = userService.getUser(id);
            request.setAttribute("user", user);
            request.getRequestDispatcher("editUser.jsp").forward(request, response);
        } else if (action.equals("delete")) {
            // Handle user deletion, redirect to list page after deletion
            int id = Integer.parseInt(request.getParameter("id"));
            userService.deleteUser(id);
            response.sendRedirect("user");  // Default action, no action needed in URL
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action.equals("create")) {
            // Create a new user
            String username = request.getParameter("username");
            String email = request.getParameter("email");

            User user = new User();
            user.setUsername(username);
            user.setEmail(email);

            if (userService.createUser(user)) {
                response.sendRedirect("user");  // Redirect to the user list page
            } else {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            }
        } else if (action.equals("update")) {
            // Update existing user details
            int id = Integer.parseInt(request.getParameter("id"));
            String username = request.getParameter("username");
            String email = request.getParameter("email");

            User user = new User();
            user.setId(id);
            user.setUsername(username);
            user.setEmail(email);

            if (userService.updateUser(user)) {
                response.sendRedirect("user");  // Redirect to the user list page
            } else {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            }
        } else if (action.equals("delete")) {
            // Delete a user
            int id = Integer.parseInt(request.getParameter("id"));
            if (userService.deleteUser(id)) {
                response.sendRedirect("user");  // Redirect to the user list page
            } else {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            }
        }
    }
}
