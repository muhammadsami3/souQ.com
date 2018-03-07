
<%@page import="dataBaseFunction.dbMethods"%>
+<%-- 
    Document   : removeUser
    Author     : Rouen Antar <rouen49@gmail.com>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% //int Id=(Integer)session.getAttribute("UID");
    int id=Integer.parseInt(request.getParameter("userid"));
        out.println(id);
        dbMethods.connectToDatabase();
        dbMethods.removeUser(id);
    
%>
