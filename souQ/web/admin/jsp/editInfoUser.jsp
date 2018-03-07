<%-- 
    Document   : editInfoUser
    Author     : Rouen Antar <rouen49@gmail.com>
--%>

<%@page import="dataBaseFunction.dbMethods"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../html/adminheader.html" %>
<%!String fname, lname, uname, password;%>
<%!Float balance;%>
<<<<<<< HEAD
<% 
    
   dbMethods.connectToDatabase();
   int Id=Integer.parseInt(request.getParameter("userid"));
    balance=Float.parseFloat(request.getParameter("balance"));
   dbMethods.editInfoUser(Id, balance);
%>
=======
<%

    dbMethods doqMethods = new dbMethods();
    int Id = Integer.parseInt(request.getParameter("userid"));

%>



<%    balance = Float.parseFloat(request.getParameter("balance"));
     doqMethods.editInfoUser(Id, balance);
     response.sendRedirect("editUser.jsp");
    String found = (String) session.getAttribute("found");
    found = (found == null) ? "" : found;

    if (found.equals("no")) {
        System.out.println("className.methodName() --> name not found");%>

no such user

<% }%>

<%@include file="../html/footer.html" %> 
>>>>>>> f81b793bf475f0d6969c11d2c781bf66a52d725c
