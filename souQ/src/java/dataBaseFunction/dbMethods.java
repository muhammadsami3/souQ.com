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
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;

public class dbMethods {
    
    static Connection conn;
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
            conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/souq", "postgres", "1022591400");

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(dbMethods.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
      
      public static void main(String[] args) {
        connectToDatabase();
          try {
            
            ResultSet resultSet=showUsers();
            
//        ResultSet resultSet=showUserInfo("admin");
//        addProduct("car1",1000,3,"cars");
//              if (isProductExist("car")) {
//                  System.out.println("dataBaseFunction.dbMethods.main()");
//              }

//              removeProduct("car3");
//              removeUser("dd");

while (resultSet.next()) {
    System.out.println("dataBaseFunction.dbMethods.main()-->  "+resultSet.getString(2));    
}
        } catch (SQLException ex) {
            Logger.getLogger(dbMethods.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
      
    public static ResultSet showUsers() {
        try {
            stmt2 = conn.createStatement();
            String queryString = new String("Select * from customer");
            rs = stmt2.executeQuery(queryString);
        } catch (SQLException ex) {
            Logger.getLogger(dbMethods.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }
    
    public static ResultSet showUserInfo(String uname) throws SQLException {
        
          stmt2 = conn.createStatement();
            String queryString = new String("Select * from customer where uname='"+uname+"' ");
            rs = stmt2.executeQuery(queryString);
       return  rs;
        
    }
     public static void removeUser(String uname) throws SQLException {
          String query = "delete from customer where uname=?";
        
            stmt = conn.prepareStatement(query);
            stmt.setString(1, uname);
            stmt.execute();
          
        
    }
      public static ResultSet showProducts() throws SQLException {
          stmt2 = conn.createStatement();
            String queryString = new String("Select name from product");
            rs = stmt2.executeQuery(queryString);
       return  rs;
    }
      
      
      
      
    public static void addProduct(String pname,double price,int qyn,String cat) throws SQLException {
        
           String query = " insert into product (name,price,qyn,cat) values (?,?,?,?)";
        
            stmt = conn.prepareStatement(query);
            stmt.setString(1, pname);
            stmt.setDouble(2, price);
            stmt.setInt(3, qyn);
            stmt.setString(4, cat);
            stmt.execute();

    }
    
    
   
       public static void editProduct(int id,String pname,double price,int qyn,String cat) throws SQLException {
        
           String query = "update product set name=?, price=?,qyn=?,cat=? where productid=?;";
        
            stmt = conn.prepareStatement(query);
            stmt.setString(1, pname);
            stmt.setDouble(2, price);
            stmt.setInt(3, qyn);
            stmt.setString(4, cat);
            stmt.execute();

    }
        public static void removeProduct(String pname) throws SQLException {
         
             String query = "delete from product where name=?";
        
            stmt = conn.prepareStatement(query);
            stmt.setString(1, pname);
            stmt.execute();

        
    }
     
      public  static boolean isProductExist(String pname) throws SQLException{
      
      boolean isProductExist= false;
      ResultSet rs=showProducts();
      
          while (rs.next()) {      
              
             if (pname.equals(rs.getString("name"))) {
                isProductExist = true;
                break;
            } 
          }
        
      return isProductExist;
      }
    
}
