<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="./partials/header.jsp"%>

                    <h2 class="text-xl font-semibold text-white">Dashboard</h2>
                    
<%@ include file="./partials/middle.jsp"%>

			<!-- Main Content with Table -->
            <main class="flex-1 p-6">
                <!-- Create New Button -->
                <div class="mb-4">
                    <button 
                            class="bg-gradient-to-r from-purple-600 to-purple-800 hover:from-purple-700 hover:to-purple-900 text-white px-4 py-2 rounded-lg transition-all duration-300 shadow-lg"
                            onclick="window.location.href='admin?action=create';"
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
                                    <th class="px-6 py-3 text-left text-xs font-medium text-purple-300 uppercase tracking-wider">Username</th>
                                    <th class="px-6 py-3 text-left text-xs font-medium text-purple-300 uppercase tracking-wider">Picture</th>
                                    <th class="px-6 py-3 text-left text-xs font-medium text-purple-300 uppercase tracking-wider">Email</th>
                                    <th class="px-6 py-3 text-left text-xs font-medium text-purple-300 uppercase tracking-wider">First Name</th>
                                    <th class="px-6 py-3 text-left text-xs font-medium text-purple-300 uppercase tracking-wider">Last Name</th>
                                    <th class="px-6 py-3 text-left text-xs font-medium text-purple-300 uppercase tracking-wider">Edit</th>
                                    <th class="px-6 py-3 text-left text-xs font-medium text-purple-300 uppercase tracking-wider">Delete</th>
                                </tr>
                            </thead>
                            <tbody class="divide-y divide-purple-500/20">
                            	<c:forEach var="admin" items="${admins}">
	                                <tr class="hover:bg-purple-500/5 transition-colors">
	                                    <td class="px-6 py-4 whitespace-nowrap text-gray-300">${admin.id}</td>
	                                    <td class="px-6 py-4 whitespace-nowrap text-gray-300">${admin.username}</td>
	                                    <td class="px-6 py-4 whitespace-nowrap text-gray-300">
	                                    	<img class="w-10 h-10 rounded-full" src="admin/picture/${admin.picture}" alt="Description of the image" width="500">
	                                    </td>
	                                    <td class="px-6 py-4 whitespace-nowrap text-gray-300">${admin.email}</td>
	                                    <td class="px-6 py-4 whitespace-nowrap text-gray-300">${admin.firstName}</td>
	                                    <td class="px-6 py-4 whitespace-nowrap text-gray-300">${admin.lastName}</td>
	                                    <td class="px-6 py-4 whitespace-nowrap space-x-2">
	                                        <button class="text-purple-400 hover:text-purple-300" onclick="window.location.href='admin?action=edit&id=${admin.id}';">Edit</button>
	                                    </td>
	                                    <td class="px-6 py-4 whitespace-nowrap space-x-2">
	                                        <button onclick="showDeleteModal('${admin.id}')" class="text-red-400 hover:text-red-300">Delete</button>
	                                    </td>
	                                </tr>
	                        	</c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </main>
			<script>
		        let currentDeleteId = null;
		        
		        function showDeleteModal(id) {
		            currentDeleteId = id;
		            const modal = document.getElementById('deleteModal');
		            modal.classList.remove('opacity-0', 'pointer-events-none');
		            modal.classList.add('show');
		        }
		
		        function closeDeleteModal() {
		            const modal = document.getElementById('deleteModal');
		            modal.classList.remove('show');
		            modal.classList.add('opacity-0', 'pointer-events-none');
		            currentDeleteId = null;
		        }
		
		        function confirmDelete() {
		            if (currentDeleteId) {
		                console.log(`Deleting record ${currentDeleteId}`);
		                window.location.href='admin?action=delete&id='+currentDeleteId;
		            }
		            closeDeleteModal();
		        }
		
		        // Close modal when clicking outside
		        document.getElementById('deleteModal').addEventListener('click', (e) => {
		            if (e.target.id === 'deleteModal') {
		                closeDeleteModal();
		            }
		        });
		    </script>
            
<%@ include file="./partials/footer.jsp"%>
