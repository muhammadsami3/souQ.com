/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets.usersServlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import servlets.usersServlets.DBConnector;
/**
 *
 * @author maryam
 */
public class LoginValidation extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.sql.SQLException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
    HttpSession session=request.getSession();
    Connection conn = DBConnector.getConnection();
    Statement stmt = conn.createStatement();
//    request.getSession(false);
    String name = request.getParameter("uname");
    String pass = request.getParameter("passwd");
    String queryString = new String("select * from Customer where uname like '%" + name + "%' AND passwd like '%" + pass + "%'");
    ResultSet rs = stmt.executeQuery(queryString);
    boolean found = rs.next();
    System.out.println(found);
    if (!found) {
        PrintWriter out=response.getWriter();
        response.sendRedirect("user/jsp/login.jsp");
//        RequestDispatcher r2 = request.getRequestDispatcher("user/html/loginFailed.html");
//        r2.include(request, response);
    } else {
        int id = rs.getInt(1);
        String uname = rs.getString(2);
        String fname = rs.getString(3);
        String lname = rs.getString(4);
        String passwd = rs.getString(5);
        String birthday = rs.getString(6);
        String email = rs.getString(7);
        String job = rs.getString(8);
        String address = rs.getString(9);
        String interests = rs.getString(10);
        Double credit = rs.getDouble(11);
        session.setAttribute("status", "yes");
        session.setAttribute("Id", id);
        session.setAttribute("uname", uname);
        session.setAttribute("fname", fname);
        session.setAttribute("lname", lname);
        session.setAttribute("passwd", passwd);
        session.setAttribute("birthday", birthday);
        session.setAttribute("email", email);
        session.setAttribute("job", job);
        session.setAttribute("address", address);
        session.setAttribute("interests", interests);
        session.setAttribute("credit", credit);
        
        response.sendRedirect("user/jsp/home.jsp");
    }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(LoginValidation.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(LoginValidation.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
