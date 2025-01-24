<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true" %>

					<%
					    String firstName = (String) session.getAttribute("firstName");
					    String lastName = (String) session.getAttribute("lastName");
					    String picture = (String) session.getAttribute("picture");
					    if (picture == null || picture.isEmpty()) {
					        // Default picture if none is set
					        picture = "default.png";
					    }
					%>

                    <div class="flex items-center space-x-4">
                        <div class="flex items-center">
                            <img class="h-10 w-10 rounded-full" 
                                 src="admin/picture/<%= picture %>" 
                                 alt="Profile picture">
                            <span class="ml-3 mr-2 text-white"><%= firstName %> <%= lastName %></span>
                        </div>
                        <button class="bg-gradient-to-r from-red-600 to-red-800 hover:from-red-700 hover:to-red-900 text-white px-4 py-2 rounded-lg transition-all duration-300 shadow-lg" onclick="window.location.href='admin?action=logout';">
                            Logout
                        </button>
                    </div>
                </div>
            </header>