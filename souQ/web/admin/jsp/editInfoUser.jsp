<%-- 
    Document   : editInfoUser
    Author     : Rouen Antar <rouen49@gmail.com>
--%>

<%@page import="dataBaseFunction.dbMethods"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../html/adminheader.html" %>
<%!String fname, lname, uname, password;%>
<%!Float balance;%>
<% 
    
   dbMethods.connectToDatabase();
   int Id=Integer.parseInt(request.getParameter("userid"));
    balance=Float.parseFloat(request.getParameter("balance"));
   dbMethods.editInfoUser(Id, balance);
%>
