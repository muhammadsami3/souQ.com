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
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author maryam
 */
public class trialServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            response.setContentType("text/html;charset=UTF-8");
//          response.sendRedirect("html/usersHTML/registration.html");
            Connection conn = DBConnector.getConnection();
            String query = " insert into customer (uname,fname,lname,passwd,birthday,email,job,address,interests,balance) values (?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement prepareStatement = null;
            PreparedStatement prepareStatement2 = null;
            prepareStatement = conn.prepareStatement(query);
            String uname = request.getParameter("uname");
            String fname = request.getParameter("fname");
            String lname = request.getParameter("lname");
            String passwd = request.getParameter("passwd");
            String bday = request.getParameter("bday");
            String email = request.getParameter("email");
            String job = request.getParameter("job");
            String address = request.getParameter("address");
            String interests = request.getParameter("interests");

            prepareStatement.setString(1, uname);
            prepareStatement.setString(2, fname);
            prepareStatement.setString(3, lname);
            prepareStatement.setString(4, passwd);
            prepareStatement.setString(5, bday);
            prepareStatement.setString(6, email);
            prepareStatement.setString(7, job);
            prepareStatement.setString(8, address);
            prepareStatement.setString(9, interests);
            prepareStatement.setDouble(10, 100000);


            PrintWriter out = response.getWriter();
            RequestDispatcher r1;

            boolean inserted = prepareStatement.execute();
            System.out.println("inserted " + inserted);

            if (!inserted) {
                response.sendRedirect("jsp/usersJSP/login.jsp");
            } else {
                out.println("Failed To create account !");
                r1 = request.getRequestDispatcher("html/usersHTML/registration.html");
                r1.include(request, response);
            }

        } catch (SQLException ex) {
            Logger.getLogger(trialServlet.class.getName()).log(Level.SEVERE, null, ex);
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
        processRequest(request, response);
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
        processRequest(request, response);
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
