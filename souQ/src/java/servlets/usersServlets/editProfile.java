/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets.usersServlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author maryam
 */
public class editProfile extends HttpServlet {

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
        HttpSession session = request.getSession(false);
        int id = (Integer) session.getAttribute("Id");
        String passwd = (String) session.getAttribute("passwd");
        
        session.invalidate();
        
          Connection conn = DBConnector.getConnection();
            String query = " update Customer set uname=?,fname=?,lname=?,birthday=?,email=?,job=?,address=?,interests=? where id="+id+"";
            PreparedStatement prepareStatement = null;
            prepareStatement = conn.prepareStatement(query);
            String uname = request.getParameter("uname");
            String fname = request.getParameter("fname");
            String lname = request.getParameter("lname");
            String bday = request.getParameter("bday");
            String email = request.getParameter("email");
            String job = request.getParameter("job");
            String address = request.getParameter("address");
            String interests = request.getParameter("interests");

            prepareStatement.setString(1, uname);
            prepareStatement.setString(2, fname);
            prepareStatement.setString(3, lname);
            prepareStatement.setString(4, bday);
            prepareStatement.setString(5, email);
            prepareStatement.setString(6, job);
            prepareStatement.setString(7, address);
            prepareStatement.setString(8, interests);

            int updated = prepareStatement.executeUpdate();
            System.out.println("updated");
            response.sendRedirect("jsp/usersJSP/login.jsp");
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
            Logger.getLogger(editProfile.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(editProfile.class.getName()).log(Level.SEVERE, null, ex);
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
