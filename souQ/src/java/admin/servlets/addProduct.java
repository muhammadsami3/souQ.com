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
import dataBaseFunction.dbMethods;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Muhammad Sami
 */
@WebServlet(name = "addProduct", urlPatterns = {"/admin/addProduct"})
public class addProduct extends HttpServlet {

    String pname, cost, amount, cat, desc, edit, img, tempID;
    Integer id;
    boolean $edit = false;
    dbMethods doQuery=new dbMethods();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException {

        try {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();

            HttpSession session = request.getSession();
            pname = request.getParameter("pname");
            cost = request.getParameter("cost");
            amount = request.getParameter("amount");
            cat = request.getParameter("cat");
            desc = request.getParameter("desc");
            img = request.getParameter("img");

            edit = request.getParameter("edit");
            edit = (edit == null) ? "" : edit;

            if (edit.equals("yes")) {
                System.out.println("servlets.addProduct.processRequest()-----> Edit");
                pname = request.getParameter("pname");
                cost = request.getParameter("cost");
                amount = request.getParameter("amount");
                cat = request.getParameter("cat");
                desc = request.getParameter("desc");
                img = request.getParameter("img");
                tempID = (String) session.getAttribute("id");
                tempID = (tempID == null) ? "-1" : tempID;
                id = Integer.parseInt(tempID);

                doQuery.editProduct(id, pname, Double.parseDouble(cost), Integer.valueOf(amount), cat, desc, img);

                session.setAttribute("pnameExist", "no");
                session.setAttribute("pname", " ");
                session.setAttribute("cost", " ");
                session.setAttribute("amount", " ");
                session.setAttribute("cat", "cars");
                session.setAttribute("desc", " ");
                session.setAttribute("img", " ");
                session.setAttribute("edit", "no");
                session.setAttribute("id", "-1");

                response.sendRedirect("/souQ/admin/jsp/editPage.jsp?success=yes");

            } else if (doQuery.isProductExist(pname)) {

                System.out.println("servlets.addProduct.processRequest()  -----> item exists " + desc);
                session.setAttribute("pnameExist", "yes");
                session.setAttribute("edit", "no");
                session.setAttribute("pname", pname);
                session.setAttribute("cost", cost);
                session.setAttribute("amount", amount);
                session.setAttribute("cat", cat);
                session.setAttribute("desc", desc);
                session.setAttribute("desc", img);
                session.setAttribute("id", tempID);

                response.sendRedirect("/souQ/admin/jsp/addPage.jsp");
            } else {
                session.setAttribute("pnameExist", "no");

                System.out.println("servlets.addProduct.processRequest() ----> NEW ITEM  " + amount + cat);
                doQuery.addProduct(pname, Double.parseDouble(cost), Integer.parseInt(amount), cat, desc, img);
                response.sendRedirect("/souQ/admin/jsp/addPage.jsp?s=yes");
            }
        } catch (IOException | SQLException ex) {
            ex.printStackTrace();
            try {
                response.sendRedirect("/souQ/admin/jsp/addPage.jsp?s=no&d=add");
            } catch (IOException ex1) {
                Logger.getLogger(addProduct.class.getName()).log(Level.SEVERE, null, ex1);
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
