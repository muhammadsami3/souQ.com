<%-- 
    Document   : logout
    Created on : Mar 1, 2018, 3:46:17 AM
    Author     : maryam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<% 
if(session.getAttribute("status")!=null){
session.invalidate();
}
response.sendRedirect("home.jsp");
%>
