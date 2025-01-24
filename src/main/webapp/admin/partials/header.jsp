<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Admin Panel</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
		::-webkit-scrollbar {
    		width: 8px;
		}
		::-webkit-scrollbar-track {
    		background-color: #1a1a1a;
		}
		::-webkit-scrollbar-thumb {
    		background-color: #3a3a3a;
    		border-radius: 9999px;
		}
		::-webkit-scrollbar-thumb:hover {
    		background-color: #4a4a4a;
		}
    	
        .modal-backdrop {
            backdrop-filter: blur(4px);
            background-color: rgba(0, 0, 0, 0.5);
            transition: opacity 0.2s ease-in-out;
        }
        .modal-content {
            transform: translateY(-20px);
            transition: transform 0.3s ease-in-out;
        }
        .modal-backdrop.show .modal-content {
            transform: translateY(0);
        }
        select {
            background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' fill='none' viewBox='0 0 20 20'%3e%3cpath stroke='%239333ea' stroke-linecap='round' stroke-linejoin='round' stroke-width='1.5' d='M6 8l4 4 4-4'/%3e%3c/svg%3e");
            background-position: right 0.5rem center;
            background-repeat: no-repeat;
            background-size: 1.5em 1.5em;
            -webkit-appearance: none;
            -moz-appearance: none;
            appearance: none;
        }
        select option {
            background-color: #0f0f0f;
            color: #e5e7eb;
            padding: 8px;
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
<body class="bg-gradient-to-br from-black to-gray-900">
    <div class="min-h-screen flex">
        <!-- Sidebar -->
        <aside class="bg-black/50 backdrop-blur-lg w-64 flex flex-col border-r border-purple-500/20">
            <div class="p-4 bg-gradient-to-r from-purple-900/50 to-black">
                <h1 class="text-white text-2xl font-bold">Admin Panel</h1>
            </div>
            <nav class="flex-1 px-2 py-4">
                <button
                        class="block w-full text-left px-4 py-2 text-gray-300 hover:bg-purple-500/10 rounded-lg mb-2 transition-all duration-300"
                        onclick="window.location.href='index.html';"
                        >
                    Dashboard
                </button>
                <button
                        class="block w-full text-left px-4 py-2 text-gray-300 hover:bg-purple-500/10 rounded-lg mb-2 transition-all duration-300"
                        onclick="window.location.href='index.html';"
                        >
                    Users
                </button>
                <button
                        class="block w-full text-left px-4 py-2 text-gray-300 hover:bg-purple-500/10 rounded-lg mb-2 transition-all duration-300"
                        onclick="window.location.href='index.html';"
                        >
                    Products
                </button>
                <button
                        class="block w-full text-left px-4 py-2 text-gray-300 hover:bg-purple-500/10 rounded-lg mb-2 transition-all duration-300"
                        onclick="window.location.href='index.html';"
                        >
                    Orders
                </button>
                <button
                        class="block w-full text-left px-4 py-2 text-gray-300 hover:bg-purple-500/10 rounded-lg mb-2 transition-all duration-300"
                        onclick="window.location.href='index.html';"
                        >
                    Settings
                </button>
            </nav>
        </aside>

        <!-- Main Content Area -->
        <div class="flex-1 flex flex-col">
            <!-- Top Status Bar -->
            <header class="bg-black/50 backdrop-blur-lg border-b border-purple-500/20">
                <div class="flex justify-between items-center px-6 py-4">
