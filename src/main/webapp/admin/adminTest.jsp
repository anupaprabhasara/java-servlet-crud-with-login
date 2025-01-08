<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin List</title>
</head>
<body>
    <h1>Admin List</h1>
    <a href="admin?action=create">Create New Admin</a>
    <br><br>
    <table border="1">
        <thead>
            <tr>
                <th>ID</th>
                <th>Username</th>
                <th>Email</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="admin" items="${admins}">
                <tr>
                    <td>${admin.id}</td>
                    <td>${admin.username}</td>
                    <td>${admin.email}</td>
                    <td>${admin.firstName}</td>
                    <td>${admin.lastName}</td>
                    <td>
                        <a href="admin?action=view&id=${admin.id}">View</a> |
                        <a href="admin?action=edit&id=${admin.id}">Edit</a> |
                        <a href="admin?action=delete&id=${admin.id}" onclick="return confirm('Are you sure you want to delete this admin?')">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
