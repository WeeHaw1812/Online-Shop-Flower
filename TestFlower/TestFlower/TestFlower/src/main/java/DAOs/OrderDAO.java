/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import Models.Order;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author HP
 */
public class OrderDAO {

    private Connection conn;

    public OrderDAO() {
        conn = DB.DbConnection.GetConnection();
    }

    public ResultSet GetAllOrder() {
        ResultSet rs = null;
        String sql = "Select * From [order]";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }

    public int AddNew(Order od) {
        String sql = "Insert into [Order] values(?,?,?,?,?,?,?)";
        int kq = 0;
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, od.getCustomerName());
            ps.setString(2, od.getAddress());
            ps.setString(3, od.getPhone());
            ps.setString(4, od.getProductBuy());
            ps.setInt(5, od.getQuantity());
            ps.setInt(6, od.getPrice());
            ps.setInt(7, od.getTotal());

            kq = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return kq;
    }

    public int Delete(int id) {
        String sql = "delete from [order] where order_id=?";
        int ketqua = 0;

        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ketqua = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ketqua;
    }

}