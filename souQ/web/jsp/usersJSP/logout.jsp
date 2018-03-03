<%-- 
    Document   : logout
    Created on : Mar 1, 2018, 3:46:17 AM
    Author     : maryam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
session.invalidate();
response.sendRedirect("home.jsp");
%>
