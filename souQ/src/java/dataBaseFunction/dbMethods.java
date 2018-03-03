
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dataBaseFunction;

/**
 *
 * @author Muhammad Sami
 */
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

public class dbMethods {

    public static Connection conn;
    static PreparedStatement stmt;
    static Statement stmt2;
    static PreparedStatement stmt3;
    static PreparedStatement stmt_getpasswd;
    static ResultSet rs;
    static ResultSet rs2;

    public static void connectToDatabase() {
        conn = null;

        try {
            Class.forName("org.postgresql.Driver");
            conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/souq", "postgres", "123@home");

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(dbMethods.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void main(String[] args) throws SQLException {
        connectToDatabase();
        try {
            dbMethods db = new dbMethods();
            rs2 = db.getCartInfo(1);
            while (rs2.next()) {
                System.out.println("dataBaseFunction.dbMethods.main()-->  " + rs2.getString(2) + "  " + rs2.getString(3) + " " + rs2.getString(4));
            }
        } catch (SQLException ex) {
            Logger.getLogger(dbMethods.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ResultSet showUsers() {
        ResultSet rs = null;
        try {
            Statement stmt2 = conn.createStatement();
            String queryString = new String("Select * from customer");
            rs = stmt2.executeQuery(queryString);
        } catch (SQLException ex) {
            Logger.getLogger(dbMethods.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }

    public ResultSet showUserInfo(String uname) throws SQLException {

        Statement stmt2 = conn.createStatement();
        String queryString = new String("Select * from customer where uname='" + uname + "' ");
        ResultSet rs = stmt2.executeQuery(queryString);
        return rs;

    }

    public void removeUser(String uname) throws SQLException {
        String query = "delete from customer where uname=?";

        PreparedStatement stmt = conn.prepareStatement(query);
        stmt.setString(1, uname);
        stmt.execute();

    }

    public ResultSet showProducts() throws SQLException {
        Statement stmt2 = conn.createStatement();
        String queryString = new String("Select name from product");
        ResultSet rs = stmt2.executeQuery(queryString);
        return rs;
    }

    public ResultSet getProductInfo(String pname) throws SQLException {
        Statement stmt2 = conn.createStatement();
        String queryString = new String("Select * from product where name='" + pname + "'");
        ResultSet rs = stmt2.executeQuery(queryString);
        return rs;
    }

    public ResultSet getCartInfo(int orderid) throws SQLException {

        String queryString = "select * from cart where orderid=?";
        PreparedStatement stmt = conn.prepareStatement(queryString);
        stmt.setInt(1, orderid);
        ResultSet rs = stmt.executeQuery();
        return rs;
    }

    public ResultSet getProductInfoById(int id) throws SQLException {
        Statement stmt2 = conn.createStatement();
        String queryString = new String("Select * from product where productid=" + id + "");
        ResultSet rs = stmt2.executeQuery(queryString);
        return rs;
    }

    public void addCart(int orderid, int productid, int quantity) throws SQLException {

        String query = "insert into cart (orderid,productid,quantity) values(?,?,?)";

        PreparedStatement stmt = conn.prepareStatement(query);
        stmt.setInt(1, orderid);
        stmt.setInt(2, productid);
        stmt.setInt(3, quantity);
        stmt.execute();

    }

    
    public void addCartTemp(int productid, int quantity) throws SQLException {

        String query = "insert into cart (productid,quantity) values(?,?)";

        PreparedStatement stmt = conn.prepareStatement(query);
        stmt.setInt(1, productid);
        stmt.setInt(2, quantity);
        stmt.execute();

    }
    
    
    
    
    public void addOrder(int customerID, int totalamount) throws SQLException {

        String query = "insert into orders ( customerid,totalamount) values (?,?)";

        PreparedStatement stmt = conn.prepareStatement(query);
        stmt.setInt(1, customerID);
        stmt.setInt(2, totalamount);
        stmt.execute();

    }

    public void addProduct(String pname, double price, int qyn, String cat, String desc, String img) throws SQLException {

        String query = " insert into product (name,price,qyn,cat,description,img) values (?,?,?,?,?,?)";

        PreparedStatement stmt = conn.prepareStatement(query);
        stmt.setString(1, pname);
        stmt.setDouble(2, price);
        stmt.setInt(3, qyn);
        stmt.setString(4, cat);
        stmt.setString(5, desc);
        stmt.setString(6, img);
        stmt.execute();

    }

    public void editProduct(int id, String pname, double price, int qyn, String cat, String desc, String img) throws SQLException {

        String query = "update product set name=?, price=?,qyn=?,cat=?,description=?,img=? where  productid=?";

        PreparedStatement stmt = conn.prepareStatement(query);
        stmt.setString(1, pname);
        stmt.setDouble(2, price);
        stmt.setInt(3, qyn);
        stmt.setString(4, cat);
        stmt.setString(5, desc);
        stmt.setString(6, img);
        stmt.setInt(7, id);

        stmt.execute();

    }

    public void removeProduct(String pname) throws SQLException {

        String query = "delete from product where name=?";

        PreparedStatement stmt = conn.prepareStatement(query);
        stmt.setString(1, pname);
        stmt.execute();

    }

    public boolean isProductExist(String pname) throws SQLException {

        boolean isProductExist = false;
        ResultSet rs = showProducts();

        while (rs.next()) {

            if (pname.equals(rs.getString("name"))) {
                isProductExist = true;
                break;
            }
        }

        return isProductExist;
    }

}
