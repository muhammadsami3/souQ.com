<%@page import="dataBaseFunction.dbMethods"%>
+<%-- 
    Document   : removeUser
    Author     : Rouen Antar <rouen49@gmail.com>
--%>
<%@include file="../html/adminheader.html" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% //int Id=(Integer)session.getAttribute("UID");
    int id=Integer.parseInt(request.getParameter("userid"));
        //out.println(id);
        dbMethods dbQMethods=new dbMethods();
               dbQMethods.removeUser(id);
               response.sendRedirect("/souQ/admin/jsp/editUser.jsp");
               
    
%>
<%@include file="../html/footer.html" %>