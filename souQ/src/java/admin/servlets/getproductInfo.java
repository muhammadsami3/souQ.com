/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package admin.servlets;

import dataBaseFunction.dbMethods;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Muhammad Sami
 */
@WebServlet(name = "getproductInfo", urlPatterns = {"/admin/getproductInfo"})
public class getproductInfo extends HttpServlet {

    ResultSet rs;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String pname = request.getParameter("pname");
            String requestFrom = request.getParameter("requestFrom");
            requestFrom=(requestFrom == null)? " ":requestFrom;
            
            try {
                dbMethods.connectToDatabase();
                HttpSession session = request.getSession(false);

                if (dbMethods.isProductExist(pname)) {

                    rs = dbMethods.getProductInfo(pname);
                    rs.next();
                    session.setAttribute("pname", rs.getString("name"));
                    session.setAttribute("cost", rs.getString("price"));
                    session.setAttribute("amount", rs.getString("qyn"));
                    session.setAttribute("cat", rs.getString("cat"));
                    session.setAttribute("desc", rs.getString("description"));

                    session.setAttribute("found", "yes");
                    
                    if (requestFrom.equals("remove")) {
                        response.sendRedirect("/souQ/admin/jsp/removePage.jsp");
                    } else if (requestFrom.equals("edit")) {
                        response.sendRedirect("/souQ/admin/jsp/editPage.jsp");
                    }
                } else {
                    
                      session.setAttribute("pname", "");
                    session.setAttribute("cost","");
                    session.setAttribute("amount", "");
                    session.setAttribute("cat", "car");
                    session.setAttribute("desc","");
                    session.setAttribute("found", "no");

                    if (requestFrom.equals("remove")) {
                        response.sendRedirect("/souQ/admin/jsp/removePage.jsp");
                    } else if (requestFrom.equals("edit")) {
                        response.sendRedirect("/souQ/admin/jsp/editPage.jsp");
                    }

                }

            } catch (SQLException ex) {
                Logger.getLogger(getproductInfo.class.getName()).log(Level.SEVERE, null, ex);
            }

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
