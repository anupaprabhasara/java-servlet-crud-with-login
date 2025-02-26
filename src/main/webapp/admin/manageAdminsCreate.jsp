<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="./partials/header.jsp"%>

                    <h2 class="text-xl font-semibold text-white">Dashboard</h2>
                    
<%@ include file="./partials/middle.jsp"%>

<!-- Main Content with Form -->
<main class="flex-1 p-6">
    <div class="bg-black/50 backdrop-blur-lg rounded-lg shadow-xl border border-purple-500/20 p-6 max-w-2xl mx-auto">
        <form class="space-y-6" action="admin" method="post" enctype="multipart/form-data">
            <!-- Hidden Input for Action -->
            <input type="hidden" name="action" value="create">

            <!-- Text Input -->
            <div>
                <label class="block text-sm font-medium text-gray-300 mb-2">Username</label>
                <input type="text" 
                    class="w-full px-4 py-2 rounded-lg bg-[#0f0f0f] border border-purple-500/20 text-white focus:outline-none focus:border-purple-500 focus:ring-1 focus:ring-purple-500 transition-colors placeholder-gray-500"
                    placeholder="Enter username"
                    name="username" required>
            </div>

            <div>
                <label class="block text-sm font-medium text-gray-300 mb-2">Password</label>
                <input type="password" 
                    class="w-full px-4 py-2 rounded-lg bg-[#0f0f0f] border border-purple-500/20 text-white focus:outline-none focus:border-purple-500 focus:ring-1 focus:ring-purple-500 transition-colors placeholder-gray-500"
                    placeholder="Enter password"
                    name="password" required>
            </div>

            <div>
                <label class="block text-sm font-medium text-gray-300 mb-2">Email</label>
                <input type="email" 
                    class="w-full px-4 py-2 rounded-lg bg-[#0f0f0f] border border-purple-500/20 text-white focus:outline-none focus:border-purple-500 focus:ring-1 focus:ring-purple-500 transition-colors placeholder-gray-500"
                    placeholder="Enter email"
                    name="email" required>
            </div>

            <div>
                <label class="block text-sm font-medium text-gray-300 mb-2">First Name</label>
                <input type="text" 
                    class="w-full px-4 py-2 rounded-lg bg-[#0f0f0f] border border-purple-500/20 text-white focus:outline-none focus:border-purple-500 focus:ring-1 focus:ring-purple-500 transition-colors placeholder-gray-500"
                    placeholder="Enter first name"
                    name="first_name" required>
            </div>

            <div>
                <label class="block text-sm font-medium text-gray-300 mb-2">Last Name</label>
                <input type="text" 
                    class="w-full px-4 py-2 rounded-lg bg-[#0f0f0f] border border-purple-500/20 text-white focus:outline-none focus:border-purple-500 focus:ring-1 focus:ring-purple-500 transition-colors placeholder-gray-500"
                    placeholder="Enter last name"
                    name="last_name" required>
            </div>

            <!-- File Input for Picture -->
            <div>
                <label class="block text-sm font-medium text-gray-300 mb-2">Profile Picture</label>
                <div class="relative w-full">
                    <input type="file" 
                        class="w-full px-2 py-2 rounded-lg bg-[#0f0f0f] border border-purple-500/20 text-gray-300 focus:outline-none focus:border-purple-500 focus:ring-1 focus:ring-purple-500 transition-colors file:bg-purple-500 file:text-white file:border-none file:px-3 file:py-2 file:rounded-md file:cursor-pointer file:hover:bg-purple-700 file:mr-2"
                        name="picture" accept="image/*">
                </div>
            </div>

            <div class="flex justify-end space-x-4 pt-4">
                <span onclick="window.location.href='admin';" class="cursor-pointer px-4 py-2 rounded-lg border border-purple-500/20 text-gray-300 hover:bg-purple-500/10 transition-all duration-300">
                    Cancel
                </span>
                <button type="submit" class="bg-gradient-to-r from-purple-600 to-purple-800 hover:from-purple-700 hover:to-purple-900 text-white px-6 py-2 rounded-lg transition-all duration-300 shadow-lg">
                    Create Admin
                </button>
            </div>
        </form>
    </div>
</main>

<%@ include file="./partials/footer.jsp"%>