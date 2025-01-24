<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Admin Login</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        /* Custom styles */
        select {
            background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' fill='none' viewBox='0 0 20 20'%3e%3cpath stroke='%239333ea' stroke-linecap='round' stroke-linejoin='round' stroke-width='1.5' d='M6 8l4 4 4-4'/%3e%3c/svg%3e");
            background-position: right 0.5rem center;
            background-repeat: no-repeat;
            background-size: 1.5em 1.5em;
            -webkit-appearance: none;
            -moz-appearance: none;
            appearance: none;
        }
        input[type="radio"], input[type="checkbox"] {
            appearance: none;
            background-color: #0f0f0f;
            border: 1px solid rgba(147, 51, 234, 0.3);
            padding: 8px;
            display: inline-block;
            position: relative;
            cursor: pointer;
        }
        input[type="radio"] {
            border-radius: 50%;
        }
        input[type="checkbox"] {
            border-radius: 4px;
        }
        input[type="radio"]:checked::after {
            content: "";
            width: 10px;
            height: 10px;
            border-radius: 50%;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: #9333ea;
        }
        input[type="checkbox"]:checked::after {
            content: "";
            width: 10px;
            height: 10px;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: #9333ea;
            clip-path: polygon(14% 44%, 0 65%, 50% 100%, 100% 16%, 80% 0%, 43% 62%);
        }
    </style>
</head>
<body class="bg-gradient-to-br from-black to-gray-900 min-h-screen flex items-center justify-center">
    <div class="bg-black/50 backdrop-blur-lg rounded-lg shadow-xl border border-purple-500/20 p-8 w-full max-w-md mx-4">
        <div class="text-center mb-8">
            <h1 class="text-3xl font-bold text-white mb-2">Admin Login</h1>
            <p class="text-gray-400">Enter your credentials to access the dashboard</p>
        </div>

        <!-- Display error message if login fails -->
        <c:if test="${not empty error}">
            <div class="bg-red-500/20 text-red-400 border border-red-500 rounded-lg p-4 mb-6">
                <p>${error}</p>
            </div>
        </c:if>

        <form class="space-y-6" method="post" action="${pageContext.request.contextPath}/admin/login">
            <!-- Email/Username Input -->
            <div>
                <label class="block text-sm font-medium text-gray-300 mb-2">Username</label>
                <input 
                    type="text" 
                    name="email"
                    class="w-full px-4 py-2 rounded-lg bg-[#0f0f0f] border border-purple-500/20 text-white focus:outline-none focus:border-purple-500 focus:ring-1 focus:ring-purple-500 transition-colors placeholder-gray-500"
                    placeholder="Enter email or username"
                    required
                >
            </div>

            <!-- Password Input -->
            <div>
                <label class="block text-sm font-medium text-gray-300 mb-2">Password</label>
                <input 
                    type="password" 
                    name="password"
                    class="w-full px-4 py-2 rounded-lg bg-[#0f0f0f] border border-purple-500/20 text-white focus:outline-none focus:border-purple-500 focus:ring-1 focus:ring-purple-500 transition-colors placeholder-gray-500"
                    placeholder="••••••••"
                    required
                >
            </div>

            <!-- Remember Me & Forgot Password -->
            <div class="flex items-center justify-between">
                <label class="flex items-center space-x-2 cursor-pointer">
                    <input type="checkbox" class="w-4 h-4 rounded bg-[#0f0f0f] border border-purple-500/20 text-purple-600 focus:ring-purple-500">
                    <span class="text-sm text-gray-300">Remember me</span>
                </label>
                <span class="text-sm cursor-pointer text-purple-400 hover:text-purple-300 transition-colors" onclick="window.location.href='mailto:info@anupa.lk';">Forgot password?</span>
            </div>

            <!-- Login Button -->
            <button 
                type="submit" 
                class="w-full bg-gradient-to-r from-purple-600 to-purple-800 hover:from-purple-700 hover:to-purple-900 text-white py-2 rounded-lg transition-all duration-300 shadow-lg"
            >
                Sign In
            </button>
        </form>

        <!-- Additional Links -->
        <div class="mt-6 text-center text-sm text-gray-400">
            Need help? <span class="text-purple-400 cursor-pointer hover:text-purple-300" onclick="window.location.href='https://anupa.lk';">Contact support</span>
        </div>
    </div>
</body>
</html>
