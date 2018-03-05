<%-- 
    Document   : IsLoggedIn
    Created on : Mar 4, 2018, 4:49:50 AM
    Author     : maryam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
request.getSession(false);
String login=(String)session.getAttribute("isLoggedIn");
if(login.equals("yes"))
{
response.sendRedirect("home.jsp");
}
else
{
%>
<!--<script>
var registration=document.getElementById("reg");
var login=document.getElementById("login");
registration.setAttribute("href","../../html/usersHTML/registration.html");
login.setAttribute("href","../../jsp/usersJSP/login.jsp");
</script>-->
<%
}
%>
