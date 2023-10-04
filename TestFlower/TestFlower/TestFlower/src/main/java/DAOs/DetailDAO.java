/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import Models.Detail;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author MSI GTX
 */
public class DetailDAO {

    private Connection conn;

    public DetailDAO() {
        conn = DB.DbConnection.GetConnection();
    }

    public ResultSet GetAll() {
        ResultSet rs = null;
        String sql = "Select * From Product";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(DetailDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }

    public Detail GetProduct(int id) {
        String sql = "select * from Product where ID =?";
        Detail sv = null;
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id); // lay gia tri id va the vao 1 dau cham hoi
            ResultSet rs = ps.executeQuery(); // dung khi su dung select

            if (rs.next()) {
                sv = new Detail(rs.getInt("ID"), rs.getString("FlowerName"), rs.getInt("Price"), rs.getInt("Quantity"), rs.getString("Linkimage"), rs.getString("Description"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DetailDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return sv;
    }
    public ResultSet SearchByKeyword(String keyword) {
        // Kết nối đến cơ sở dữ liệu, tạo câu truy vấn tìm kiếm và thực thi nó
        String sql = "SELECT * FROM Product WHERE FlowerName LIKE ?";

        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + keyword + "%");
             ResultSet rs = ps.executeQuery();

            return rs;
        }  catch (SQLException ex) {
            Logger.getLogger(DetailDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
        }
        
        return null;
    }


}
