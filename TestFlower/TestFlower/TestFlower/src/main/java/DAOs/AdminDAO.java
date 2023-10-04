/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import Models.Account;
import Models.GreenHouse;
import Models.Product;
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
public class AdminDAO {

    private PreparedStatement ps;
    private Connection conn;
    private ResultSet rs;

    public AdminDAO() {
        conn = DB.DbConnection.GetConnection();
    }

    public ResultSet GetAllBuy() {
        ResultSet rs = null;
        String sql = "Select * From Buy";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(AdminDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }

    public ResultSet GetAllGreenHouse() {
        ResultSet rs = null;
        String sql = "Select * From GreenHouse";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(AdminDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }

    public ResultSet GetAllSalesPreson() {
        ResultSet rs = null;
        String sql = "Select * From SalesPreson";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(AdminDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }

    public int AddGreenHouse(GreenHouse pr) {
        String sql = "INSERT INTO GreenHouse VALUES (?, ?, ?, ?, ?)";
        int kq = 0;
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, pr.getName());
            ps.setString(2, pr.getManager());
            ps.setString(3, pr.getOwner());
            ps.setString(4, pr.getAddress());
            ps.setString(5, pr.getManagerPhone());
            kq = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return kq;
    }

    public int Delete(int id) {
        String sql = "delete from GreenHouse where ID=?";
        int ketqua = 0;

        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ketqua = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ketqua;
    }

    public int Update(GreenHouse newpr) {
        int ketqua = 0;
        String sql = "update GreenHouse set  Manager=?, Owner=?, Address=?, ManagerPhone=? where Name=?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, newpr.getManager());
            ps.setString(2, newpr.getOwner());
            ps.setString(3, newpr.getAddress());
            ps.setString(4, newpr.getManagerPhone());
            ps.setString(5, newpr.getName());
            ketqua = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ketqua;
    }

    public GreenHouse GetGreenHouse(String ID) {
        String sql = "select * from GreenHouse where ID =?";
        GreenHouse pr = null;
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, ID); // lay gia tri id va the vao 1 dau cham hoi
            rs = ps.executeQuery(); // dung khi su dung select

            if (rs.next()) {
                pr = new GreenHouse(rs.getString("Name"), rs.getString("Manager"), rs.getString("Owner"), rs.getString("Address"), rs.getString("ManagerPhone"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return pr;
    }

    public ResultSet GetAllProduct() {
        ResultSet rs = null;
        String sql = "Select * From Product";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(AdminDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }

    public Product GetProduct(String ID) {
        String sql = "select * from Product where ID =?";
        Product pr = null;
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, ID); // lay gia tri id va the vao 1 dau cham hoi
            rs = ps.executeQuery(); // dung khi su dung select

            if (rs.next()) {
                pr = new Product(rs.getInt("ID"), rs.getString("FlowerName"), rs.getString("Linkimage"), rs.getString("Quantity"), rs.getString("Price"), rs.getString("Description"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return pr;
    }

    public int AddProduct(Product apr) {
        String sql = "INSERT INTO Product VALUES (?, ?, ?, ?, ?, ?)";
        int kq = 0;
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, apr.getID());
            ps.setString(2, apr.getFlowerName());
            ps.setString(3, apr.getLinkimage());
            ps.setString(4, apr.getQuantity());
            ps.setString(5, apr.getPrice());
            ps.setString(6, apr.getDescription());
            kq = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return kq;
    }

    public int DeleteProduct(int id) {
        String sql = "delete from Product where ID=?";
        int ketqua = 0;

        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ketqua = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ketqua;
    }

    public int UpdateProduct(Product newpr) {
        int ketqua = 0;
        String sql = "update Product set  FlowerName=?, Linkimage=?, Quantity=?, Price=?, Description=? where ID=?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, newpr.getFlowerName());
            ps.setString(2, newpr.getLinkimage());
            ps.setString(3, newpr.getQuantity());
            ps.setString(4, newpr.getPrice());
            ps.setString(5, newpr.getDescription());
            ps.setInt(6, newpr.getID());
            ketqua = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ketqua;
    }
        public ResultSet GetAllOrder() {
        ResultSet rs = null;
        String sql = "Select * From [Order]";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(AdminDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }
//        public int Reset(Account newpr) {
//        int ketqua = 0;
//        String sql = "SELECT COUNT(*) FROM Account WHERE email = ?";
//        try {
//            PreparedStatement ps = conn.prepareStatement(sql);
//            rs = ps.executeQuery();
//            if (rs.next()) {
//                int count = rs.getInt(1);
//                return count > 0; // Trả về true nếu count > 0, tức là địa chỉ email tồn tại trong cơ sở dữ liệu
//            }
//           
//        } catch (SQLException ex) {
//            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return ketqua;
//    }

}

