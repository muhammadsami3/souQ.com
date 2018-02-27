/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package admin.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import dataBaseFunction.dbMethods;
import java.sql.SQLException;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author Muhammad Sami
 */
@WebServlet(name = "removeProduct", urlPatterns = {"/admin/removeProduct"})
public class removeProduct extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession session=request.getSession(false);
            String pname = (String) session.getAttribute("pname");
            System.out.println(new Date() +"admin.servlets.removeProduct.processRequest() --> remove servlet pname="+pname);
            dbMethods.connectToDatabase();
             dbMethods.removeProduct(pname);

            
                session.setAttribute("pnameExist", "no");
                session.setAttribute("pname", " ");
                session.setAttribute("cost", " ");
                session.setAttribute("amount", " ");
                session.setAttribute("cat", "cars");
                session.setAttribute("desc", " ");
                session.setAttribute("edit", "no");
                session.setAttribute("found", " ");
                session.setAttribute("success", "yes");
                
                response.sendRedirect("/souQ/admin/jsp/removePage.jsp");
          
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

  
}
