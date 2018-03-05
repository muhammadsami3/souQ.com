<%-- 
    Document   : logout
    Created on : Mar 1, 2018, 3:46:17 AM
    Author     : maryam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<% 
if(session.getAttribute("isLoggedin")!=null){
session.invalidate();
session.setAttribute("isLoggedIn", "no");
}
response.sendRedirect("home.jsp");
%>
