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
 * @author Rouen Antar <rouen49@gmail.com>
 */

@WebServlet(name = "editUser", urlPatterns = {"/admin/editUser"})
public class editUser extends HttpServlet {

    ResultSet rs;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String fname = request.getParameter("fname");
            String requestFrom = request.getParameter("requestFrom");
            requestFrom=(requestFrom == null)? " ":requestFrom;
            
            try {
              dbMethods doQMethods=new dbMethods();
                HttpSession session = request.getSession(false);

                if (doQMethods.isProductExist(fname)) {

                    rs = doQMethods.getProductInfo(fname);
                    rs.next();
                    session.setAttribute("fname", rs.getString("fname"));
                    session.setAttribute("lname", rs.getString("lname"));
                    session.setAttribute("uname", rs.getString("uname"));
                    session.setAttribute("password", rs.getString("password"));
                    session.setAttribute("balance", rs.getFloat("balance"));

                    session.setAttribute("found", "yes");
                    
                    if (requestFrom.equals("remove")) {
                        response.sendRedirect("/souQ/admin/jsp/removeUser.jsp");
                    } else if (requestFrom.equals("edit")) {
                        response.sendRedirect("/souQ/admin/jsp/editUser.jsp");
                    }
                } else {
                    
                      session.setAttribute("fname", "");
                    session.setAttribute("lname","");
                    session.setAttribute("uname", "");
                    session.setAttribute("password", "");
                    session.setAttribute("balance","");
                    session.setAttribute("found", "no");

                    if (requestFrom.equals("remove")) {
                        response.sendRedirect("/souQ/admin/jsp/removeUser.jsp");
                    } else if (requestFrom.equals("edit")) {
                        response.sendRedirect("/souQ/admin/jsp/editUser.jsp");
                    }

                }

            } catch (SQLException ex) {
                Logger.getLogger(getproductInfo.class.getName()).log(Level.SEVERE, null, ex);
            }

        }
    }
}

