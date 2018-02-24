/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dataBaseFunction.dbMethods;
import static dataBaseFunction.dbMethods.connectToDatabase;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Muhammad Sami
 */
@WebServlet(name = "addProduct", urlPatterns = {"/addProduct"})
public class addProduct extends HttpServlet {

    String pname, cost, amount, cat, desc, update;
    boolean $update=false;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException {
        try {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            connectToDatabase();
            HttpSession session = request.getSession();
            pname = request.getParameter("pname");
            cost = request.getParameter("cost");
            amount = request.getParameter("amount");
            cat = request.getParameter("cat").toLowerCase();
            desc = request.getParameter("desc");
            update = request.getParameter("update");
            if(update!=null){  
                $update=update.equals("yes");
                System.out.println($update);
            }
            if ($update) {
                System.out.println("servlets.addProduct.processRequest()-----> UPDATE");
                pname = (String) session.getAttribute("pname");
                cost = (String) session.getAttribute("cost");
                cat = (String) session.getAttribute("cat");
                amount = (String) session.getAttribute("amount");
                desc = (String) session.getAttribute("desc");

                dbMethods.editProduct(pname, Double.parseDouble(cost), Integer.valueOf(amount), cat);

                session.setAttribute("pnameExist", "no");
                session.setAttribute("pname", " ");
                session.setAttribute("cost", " ");
                session.setAttribute("amount", " ");
                session.setAttribute("cat", "cars");
                session.setAttribute("desc", " ");
                 session.setAttribute("edit", "no");

                response.sendRedirect("/souQ/jsp/adminPage.jsp?s=yes&d=add");
                
            } else if (dbMethods.isProductExist(pname)) {
                
                System.out.println("servlets.addProduct.processRequest()  -----> item exists " + desc);
                session.setAttribute("pnameExist", "yes");
                session.setAttribute("edit", "no");
                session.setAttribute("pname", pname);
                session.setAttribute("cost", cost);
                session.setAttribute("amount", amount);
                session.setAttribute("cat", cat);
                session.setAttribute("desc", desc);

                response.sendRedirect("/souQ/jsp/adminPage.jsp?s=&d=");
            } else {
                
                System.out.println("servlets.addProduct.processRequest() ----> NEW ITEM" + amount + cat);
                dbMethods.addProduct(pname, Double.parseDouble(cost), Integer.parseInt(amount), cat);
                response.sendRedirect("/souQ/jsp/adminPage.jsp?s=yes&d=add");
            }
//            /souQ/jsp/adminPage.jsp
        } 
//        catch ( ) {
//           
//            Logger.getLogger(addProduct.class.getName()).log(Level.SEVERE, null, ex);
//            try {
//                response.sendRedirect("/souQ/jsp/adminPage.jsp?s=no&d=add");
//            } catch (IOException ex1) {
//                Logger.getLogger(addProduct.class.getName()).log(Level.SEVERE, null, ex1);
//            }

        
    catch (IOException|SQLException ex) {
        ex.printStackTrace();
            try {
                response.sendRedirect("/souQ/jsp/adminPage.jsp?s=no&d=add");
            } catch (IOException ex1) {
                Logger.getLogger(addProduct.class.getName()).log(Level.SEVERE, null, ex1);
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
