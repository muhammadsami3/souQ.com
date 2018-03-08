<%-- 
    Document   : viewHistory.jsp
    Created on : Mar 8, 2018, 12:16:36 PM
    Author     : Rouen Antar <rouen49@gmail.com>
--%>

<%@page import="dataBaseFunction.dbMethods"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%//int Id=(Integer)session.getAttribute("UID");
    int id = Integer.parseInt(request.getParameter("userid"));

    dbMethods dbqMethods = new dbMethods();
    
    ResultSet rs = dbqMethods.getUserorders(id);
    while (rs.next()) {      
        int orderid=Integer.parseInt(rs.getString(1));
             ResultSet rs2 = dbqMethods.getCarts(orderid);
             
             

%>
             
        }
    


%>
