package com.crud.service;

import com.crud.model.Admin;
import com.crud.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AdminService {

    // Create Admin
    public boolean createAdmin(Admin admin) {
        String query = "INSERT INTO admins (username, password, picture, email, first_name, last_name) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, admin.getUsername());
            stmt.setString(2, admin.getPassword());
            stmt.setString(3, admin.getPicture());
            stmt.setString(4, admin.getEmail());
            stmt.setString(5, admin.getFirstName());
            stmt.setString(6, admin.getLastName());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Get Admin by ID
    public Admin getAdmin(int id) {
        String query = "SELECT * FROM admins WHERE id = ?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                Admin admin = new Admin();
                admin.setId(rs.getInt("id"));
                admin.setUsername(rs.getString("username"));
                admin.setPassword(rs.getString("password"));
                admin.setPicture(rs.getString("picture") != null ? rs.getString("picture") : "default.jpg");
                admin.setEmail(rs.getString("email"));
                admin.setFirstName(rs.getString("first_name"));
                admin.setLastName(rs.getString("last_name"));
                return admin;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Get All Admins
    public List<Admin> getAllAdmins() {
        List<Admin> admins = new ArrayList<>();
        String query = "SELECT * FROM admins";
        try (Connection connection = DBConnection.getConnection();
             Statement stmt = connection.createStatement()) {
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
                Admin admin = new Admin();
                admin.setId(rs.getInt("id"));
                admin.setUsername(rs.getString("username"));
                admin.setPassword(rs.getString("password"));
                admin.setPicture(rs.getString("picture") != null ? rs.getString("picture") : "default.jpg");
                admin.setEmail(rs.getString("email"));
                admin.setFirstName(rs.getString("first_name"));
                admin.setLastName(rs.getString("last_name"));
                admins.add(admin);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return admins;
    }

    // Update Admin
    public boolean updateAdmin(Admin admin) {
        String query = "UPDATE admins SET username = ?, password = ?, picture = ?, email = ?, first_name = ?, last_name = ? WHERE id = ?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, admin.getUsername());
            stmt.setString(2, admin.getPassword());
            stmt.setString(3, admin.getPicture());
            stmt.setString(4, admin.getEmail());
            stmt.setString(5, admin.getFirstName());
            stmt.setString(6, admin.getLastName());
            stmt.setInt(7, admin.getId());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Delete Admin
    public boolean deleteAdmin(int id) {
        String query = "DELETE FROM admins WHERE id = ?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, id);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}

