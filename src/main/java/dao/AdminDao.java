package dao;

import java.sql.*;
import util.SQLDB;

public class AdminDao {

    // Admin login validation
    public boolean validateLogin(String username, String password) {
        String sql = "SELECT * FROM admin WHERE username = ? AND password = ?";
        try (Connection conn = SQLDB.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();
            return rs.next(); // found admin

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // Delete client (admin privilege)
    public boolean deleteClient(int clientId) {
        String sql = "DELETE FROM client WHERE client_id = ?";
        try (Connection conn = SQLDB.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, clientId);
            int rowsDeleted = ps.executeUpdate();
            
            if (rowsDeleted == 0) {
                System.out.println("No client deleted. ID might not exist: " + clientId);
            }
            return rowsDeleted > 0;

        } catch (SQLException e) {
            System.out.println("SQL Exception while deleting client ID " + clientId);
            e.printStackTrace();
            return false;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
