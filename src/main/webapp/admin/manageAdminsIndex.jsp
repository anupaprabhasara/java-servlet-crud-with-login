<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="./partials/header.jsp"%>

			<!-- Main Content with Table -->
            <main class="flex-1 p-6">
                <!-- Create New Button -->
                <div class="mb-4">
                    <button 
                            class="bg-gradient-to-r from-purple-600 to-purple-800 hover:from-purple-700 hover:to-purple-900 text-white px-4 py-2 rounded-lg transition-all duration-300 shadow-lg"
                            onclick="window.location.href='create.html';"
                            >
                        Create New Record
                    </button>
                </div>

                <div class="bg-black/50 backdrop-blur-lg rounded-lg shadow-xl border border-purple-500/20">
                    <div class="overflow-x-auto">
                        <table class="min-w-full divide-y divide-purple-500/20">
                            <thead>
                                <tr class="bg-black/50">
                                    <th class="px-6 py-3 text-left text-xs font-medium text-purple-300 uppercase tracking-wider">ID</th>
                                    <th class="px-6 py-3 text-left text-xs font-medium text-purple-300 uppercase tracking-wider">First Name</th>
                                    <th class="px-6 py-3 text-left text-xs font-medium text-purple-300 uppercase tracking-wider">Last Name</th>
                                    <th class="px-6 py-3 text-left text-xs font-medium text-purple-300 uppercase tracking-wider">Username</th>
                                    <th class="px-6 py-3 text-left text-xs font-medium text-purple-300 uppercase tracking-wider">Email</th>
                                    <th class="px-6 py-3 text-left text-xs font-medium text-purple-300 uppercase tracking-wider">Edit</th>
                                    <th class="px-6 py-3 text-left text-xs font-medium text-purple-300 uppercase tracking-wider">Delete</th>
                                </tr>
                            </thead>
                            <tbody class="divide-y divide-purple-500/20">
                            	<c:forEach var="admin" items="${admin}">
	                                <tr class="hover:bg-purple-500/5 transition-colors">
	                                    <td class="px-6 py-4 whitespace-nowrap text-gray-300">${admin.id}</td>
	                                    <td class="px-6 py-4 whitespace-nowrap text-gray-300">${admin.firstname}</td>
	                                    <td class="px-6 py-4 whitespace-nowrap text-gray-300">${admin.lastname}</td>
	                                    <td class="px-6 py-4 whitespace-nowrap text-gray-300">${admin.username}</td>
	                                    <td class="px-6 py-4 whitespace-nowrap text-gray-300">${admin.email}</td>
	                                    <td class="px-6 py-4 whitespace-nowrap space-x-2">
	                                        <button class="text-purple-400 hover:text-purple-300">Edit</button>
	                                    </td>
	                                    <td class="px-6 py-4 whitespace-nowrap space-x-2">
	                                        <button onclick="showDeleteModal('1')" class="text-red-400 hover:text-red-300">Delete</button>
	                                    </td>
	                                </tr>
	                        	</c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </main>
            
<%@ include file="./partials/footer.jsp"%>