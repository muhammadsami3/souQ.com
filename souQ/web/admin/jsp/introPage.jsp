<%-- 
    Document   : addPage
    Created on : Feb 25, 2018, 8:53:47 AM
    Author     : Muhammad Sami
--%>

<%@page import="dataBaseFunction.dbMethods"%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page  %>
<%@include file="../html/adminheader.html" %>
welcome to admin page 
<%dbMethods.connectToDatabase();%>
<%@include file="../html/footer.html" %>

