package dao;

import java.sql.*;
import java.util.*;
import util.DB;
import models.Service;

public class ServiceDao {

    // List all services
    public List<Service> getAllServices() {
        List<Service> list = new ArrayList<>();
        String sql = "SELECT * FROM service ORDER BY service_id ASC";

        try (Connection conn = DB.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Service(
                    rs.getInt("service_id"),
                    rs.getString("service_name"),
                    rs.getString("service_desc"),
                    rs.getDouble("price"),
                    rs.getInt("category_id"),
                    rs.getString("image_path")
                ));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // Get services by category
    public List<Service> getServicesByCategory(int categoryId) {
        List<Service> list = new ArrayList<>();
        String sql = "SELECT * FROM service WHERE category_id = ?";

        try (Connection conn = DB.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, categoryId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new Service(
                    rs.getInt("service_id"),
                    rs.getString("service_name"),
                    rs.getString("service_desc"),
                    rs.getDouble("price"),
                    rs.getInt("category_id"),
                    rs.getString("image_path")
                ));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // Retrieve 1 service
    public Service getServiceById(int serviceId) {
        String sql = "SELECT * FROM service WHERE service_id = ?";

        try (Connection conn = DB.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, serviceId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return new Service(
                    rs.getInt("service_id"),
                    rs.getString("service_name"),
                    rs.getString("service_desc"),
                    rs.getDouble("price"),
                    rs.getInt("category_id"),
                    rs.getString("image_path")
                );
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    // Add new service
    public boolean addService(Service s) {
        String sql = "INSERT INTO service(service_name, service_desc, price, category_id, image_path) VALUES (?, ?, ?, ?, ?)";

        try (Connection conn = DB.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, s.getServiceName());
            ps.setString(2, s.getServiceDesc());
            ps.setDouble(3, s.getPrice());
            ps.setInt(4, s.getCategoryId());
            ps.setString(5, s.getImagePath());
            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // Update service
    public boolean updateService(Service s) {
        String sql = "UPDATE service SET service_name = ?, service_desc = ?, price = ?, category_id = ?, image_path = ? WHERE service_id = ?";

        try (Connection conn = DB.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, s.getServiceName());
            ps.setString(2, s.getServiceDesc());
            ps.setDouble(3, s.getPrice());
            ps.setInt(4, s.getCategoryId());
            ps.setString(5, s.getImagePath());
            ps.setInt(6, s.getServiceId());
            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // Delete
    public boolean deleteService(int id) {
        String sql = "DELETE FROM service WHERE service_id = ?";

        try (Connection conn = DB.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);
            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
