///*
// * To change this license header, choose License Headers in Project Properties.
// * To change this template file, choose Tools | Templates
// * and open the template in the editor.
// */
//package admin.servlets;
///**
// *
// * @author Rouen Antar <rouen49@gmail.com>
// */
//
//import java.io.IOException;
//import java.io.PrintWriter;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//import dataBaseFunction.dbMethods;
//import java.sql.SQLException;
//import java.util.Date;
//import java.util.logging.Level;
//import java.util.logging.Logger;
//
//
//    
//    @WebServlet(name = "removeUser", urlPatterns = {"/admin/removeUser"})
//public class removeUser extends HttpServlet {
//
//
//   
//    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        
//        response.setContentType("text/html;charset=UTF-8");
//        try (PrintWriter out = response.getWriter()) {
//            HttpSession session=request.getSession(false);
//            Float Id = (Float) session.getAttribute("id");
//            System.out.println(new Date() +"admin.servlets.removeUser.processRequest() --> remove servlet id="+id);
//            dbMethods.connectToDatabase();
//             dbMethods.removeUser(id);
//
//            
//                session.setAttribute("unameExist", "no");
//                session.setAttribute("fname", " ");
//                session.setAttribute("lname", " ");
//                session.setAttribute("uname", " ");
//                session.setAttribute("password", "");
//                session.setAttribute("balance", " ");
//                session.setAttribute("edit", "no");
//                session.setAttribute("found", " ");
//                session.setAttribute("success", "yes");
//                
//                response.sendRedirect("/souQ/admin/jsp/removeUser.jsp");
//          
//        } catch (SQLException ex) {
//        }
//    }
//    
//    
//    
//}
