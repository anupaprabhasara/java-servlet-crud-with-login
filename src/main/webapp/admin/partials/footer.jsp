<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

        </div>
    </div>
    <div id="deleteModal" class="modal-backdrop fixed inset-0 flex items-center justify-center z-50 opacity-0 pointer-events-none">
        <div class="modal-content bg-black/80 backdrop-blur-lg border border-purple-500/20 rounded-lg shadow-xl p-6 max-w-md w-full mx-4">
            <h3 class="text-xl font-semibold text-white mb-4">Confirm Delete</h3>
            <p class="text-gray-300 mb-6">Are you sure you want to delete this record? This action cannot be undone.</p>
            <div class="flex justify-end space-x-3">
                <button onclick="closeDeleteModal()" class="px-4 py-2 rounded-lg border border-purple-500/20 text-gray-300 hover:bg-purple-500/10 transition-all duration-300">
                    Cancel
                </button>
                <button onclick="confirmDelete()" class="bg-gradient-to-r from-red-600 to-red-800 hover:from-red-700 hover:to-red-900 text-white px-6 py-2 rounded-lg transition-all duration-300 shadow-lg">
                    Delete
                </button>
            </div>
        </div>
    </div>
</body>
</html>