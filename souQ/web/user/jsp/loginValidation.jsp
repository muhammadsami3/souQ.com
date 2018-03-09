<%-- 
    Document   : homePage
    Created on : Feb 27, 2018, 4:59:48 AM
    Author     : maryam
--%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="servlets.usersServlets.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Connection conn = DBConnector.getConnection();
    Statement stmt = conn.createStatement();
    request.getSession(false);
    String name = request.getParameter("uname");
    String pass = request.getParameter("passwd");

    String queryString = new String("select * from customer where uname like '%" + name + "%' AND passwd like '%" + pass + "%'");
    ResultSet rs = stmt.executeQuery(queryString);
    boolean found = rs.next();
    System.out.println(found);
    if (!found) {
        out.println("<p>Please Enter a valid user name and password</p>");
        out.flush();
        RequestDispatcher r1 = request.getRequestDispatcher("login.jsp");
        r1.include(request, response);
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
        session.setAttribute("check","2");
        
        response.sendRedirect("home.jsp");
        
        
        
        response.sendRedirect("/souQ/user.servlets/addtoCart");
    }
%>
