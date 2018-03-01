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
    dbMethods doQuery = new dbMethods();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String pname = request.getParameter("pname");
            String requestFrom = request.getParameter("requestFrom");
            requestFrom = (requestFrom == null) ? " " : requestFrom;

            try {
                HttpSession session = request.getSession(false);

                if (doQuery.isProductExist(pname)) {

                    rs = doQuery.getProductInfo(pname);
                    rs.next();
                    session.setAttribute("pname", rs.getString("name"));
                    session.setAttribute("cost", rs.getString("price"));
                    session.setAttribute("amount", rs.getString("qyn"));
                    session.setAttribute("cat", rs.getString("cat"));
                    session.setAttribute("desc", rs.getString("description"));
                    session.setAttribute("img", rs.getString("img"));
                    session.setAttribute("id", rs.getString("productid"));

                    System.out.println("admin.servlets.getproductInfo.processRequest() --> productid" + rs.getString("productid"));
                    System.out.println("admin.servlets.getproductInfo.processRequest() --> productid" + rs.getString("img"));

                    session.setAttribute("found", "yes");

                    if (requestFrom.equals("remove")) {
                        response.sendRedirect("/souQ/admin/jsp/removePage.jsp");
                    } else if (requestFrom.equals("edit")) {
                        response.sendRedirect("/souQ/admin/jsp/editPage.jsp");
                    }
                } else {

                    session.setAttribute("pname", "");
                    session.setAttribute("cost", "");
                    session.setAttribute("amount", "");
                    session.setAttribute("cat", "car");
                    session.setAttribute("desc", "");
                    session.setAttribute("img", "");
                    session.setAttribute("found", "no");
                    session.setAttribute("id", "-1");

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
