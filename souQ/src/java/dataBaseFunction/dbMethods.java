
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
import java.io.InputStream;
import java.io.Reader;
import java.math.BigDecimal;
import java.net.URL;
import java.sql.Array;
import java.sql.Blob;
import java.sql.Clob;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.NClob;
import java.sql.ParameterMetaData;
import java.sql.PreparedStatement;
import java.sql.Ref;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.RowId;
import java.sql.SQLException;
import java.sql.SQLWarning;
import java.sql.SQLXML;
import java.sql.Statement;
import java.sql.Time;
import java.sql.Timestamp;
import java.util.Calendar;
import java.util.logging.Level;
import java.util.logging.Logger;

public class dbMethods {

    public static Connection conn;
    PreparedStatement stmt;
    Statement stmt2;
    ResultSet rs;

    public dbMethods() {

    }

    public static void connectToDatabase() {
        conn = null;

        try {
            Class.forName("org.postgresql.Driver");
            conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/souq", "postgres", "1022591400");

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(dbMethods.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void main(String[] args) throws SQLException {
        connectToDatabase();
//        try {
//            dbMethods db = new dbMethods();
//            rs2 = db.getCartInfo(1);
//            while (rs2.next()) {
//                System.out.println("dataBaseFunction.dbMethods.main()-->  " + rs2.getString(2) + "  " + rs2.getString(3) + " " + rs2.getString(4));
//            }
//        } catch (SQLException ex) {
//            Logger.getLogger(dbMethods.class.getName()).log(Level.SEVERE, null, ex);
//        }
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

    public ResultSet getCartInfo(int customerid) throws SQLException {

        String queryString = "select * from cart where customerid=? order by cartid ";
        PreparedStatement stmt = conn.prepareStatement(queryString);
        stmt.setInt(1, customerid);
        ResultSet rs = stmt.executeQuery();
        return rs;
    }

    public ResultSet getProductInfoById(int id) throws SQLException {
        Statement stmt2 = conn.createStatement();
        String queryString = new String("Select * from product where productid=" + id + "");
        ResultSet rs = stmt2.executeQuery(queryString);
        return rs;
    }

    public int getProductQyn(int id) throws SQLException {
        int qyn;
        Statement stmt2 = conn.createStatement();
        String queryString = new String("Select * from product where productid=" + id + "");
        ResultSet rs = stmt2.executeQuery(queryString);
        rs.next();
        String qynString = rs.getString("qyn");
        qyn = Integer.parseInt(qynString);
        return qyn;

    }

    public void addCart(int customerid, int productid, int quantity) throws SQLException {

        String query = "insert into cart (productid,quantity,customerid) values(?,?,?)";

        PreparedStatement stmt = conn.prepareStatement(query);
        stmt.setInt(1, productid);
        stmt.setInt(2, quantity);
        stmt.setInt(3, customerid);

        stmt.execute();

    }

    public void removeCart(int customerid) throws SQLException {
        String query = "delete from cart where customerid=? ";
        PreparedStatement stmt = conn.prepareStatement(query);
        stmt.setInt(1, customerid);

        stmt.execute();

    }

    public void ChangeCartQyn(int productid, int quantity) throws SQLException {

        String query = "update cart set quantity=? where productid=? ";

        PreparedStatement stmt = conn.prepareStatement(query);
        stmt.setInt(1, quantity);
        stmt.setInt(2, productid);
        stmt.execute();

    }

    public void ChangeStoreQyn(int productid, int quantity) throws SQLException {

        String query = "update product set qyn=? where productid=? ";

        PreparedStatement stmt = conn.prepareStatement(query);
        stmt.setInt(1, getProductQyn(productid)-quantity);
        stmt.setInt(2, productid);
        stmt.execute();

    }

    public void reduceCredit(int customerid, Double credit) throws SQLException {
        String query = "update customer set balance=? where id=? ";

        PreparedStatement stmt = conn.prepareStatement(query);
        stmt.setDouble(1, credit);
        stmt.setInt(2, customerid);
        stmt.execute();

    }

    public double getCredit(int customerid) throws SQLException {

        Statement stmt2 = conn.createStatement();
        String queryString = new String("Select balance from customer where id='" + customerid + "' ");
        ResultSet rs = stmt2.executeQuery(queryString);
        rs.next();
        String creString = rs.getString("balance");
        return Double.parseDouble(creString);
    }

    public void addFinalCart(Integer orderid, Integer productid, Integer quantity) throws SQLException {

        String query = "insert into finalcart (orderid,productid,quantity) values(?,?,?)";

        PreparedStatement stmt = conn.prepareStatement(query);
        stmt.setInt(1, orderid);
        stmt.setInt(2, productid);
        stmt.setInt(3, quantity);
        stmt.execute();

    }

    public int getHisOrderID(int customerid) throws SQLException {

        String query = "select orderid from orders where customerid=? order by orderid desc limit 1";
        PreparedStatement stmt = conn.prepareStatement(query);
        stmt.setInt(1, customerid);
        rs = stmt.executeQuery();
        rs.next();
        String idString = rs.getString("orderid");
        int id = Integer.parseInt(idString);
        return id;
    }

    public void addOrder(int customerID, Double totalamount) throws SQLException {

        String query = "insert into orders ( customerid,totalamount) values (?,?)";
        PreparedStatement stmt = conn.prepareStatement(query);
        stmt.setInt(1, customerID);
        stmt.setDouble(2, totalamount);
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

    public void removeProductFromCart(int id) throws SQLException {

        String query = "delete from cart where productid=?";

        PreparedStatement stmt = conn.prepareStatement(query);
        stmt.setInt(1, id);
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
