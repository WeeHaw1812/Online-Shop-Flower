/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import Models.Account;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
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
public class AccountDAO {

    private PreparedStatement ps;
    private Connection conn;
    private ResultSet rs;

    public AccountDAO() {
        conn = DB.DbConnection.GetConnection();
    }

    public boolean login(Account tk) throws SQLException {
        ResultSet rs = null;
        String sql = "SELECT * FROM Account WHERE email=? AND password=?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, tk.getEmail());

            String enteredPassword = encryptToMD5(tk.getPassword()); // Mã hóa mật khẩu nhập vào
            ps.setString(2, enteredPassword);

            rs = ps.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return rs.next();
    }

    public String encryptToMD5(String password) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] messageDigest = md.digest(password.getBytes());

            StringBuilder hexString = new StringBuilder();
            for (byte b : messageDigest) {
                String hex = Integer.toHexString(0xFF & b);
                if (hex.length() == 1) {
                    hexString.append('0');
                }
                hexString.append(hex);
            }
            return hexString.toString();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            return null;
        }
    }

    public Account GetAccount(String email) {
        String sql = "select * from Account where email=?";
        Account sv = null;
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, email); // lay gia tri id va the vao 1 dau cham hoi
            rs = ps.executeQuery(); // dung khi su dung select

            if (rs.next()) {
                sv = new Account(rs.getString("name"), rs.getString("password"), rs.getString("email"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return sv;
    }


    public int AddAccount(Account pr) {
        String sql = "Insert into Account values(?, ?, ?)";
        int kq = 0;
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, pr.getName());
            ps.setString(2, pr.getEmail());
            ps.setString(3, pr.getPassword());

            kq = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return kq;
    }

    public int Update(Account newpr) {
        int ketqua = 0;
        String sql = "update Account set name=? password=?,where email=?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, newpr.getName());
            ps.setString(2, newpr.getPassword());
            ps.setString(3, newpr.getEmail());
            ketqua = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ketqua;
    }
}
