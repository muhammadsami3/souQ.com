<%-- 
    Document   : checkRegistred
    Created on : Mar 1, 2018, 5:38:43 AM
    Author     : maryam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
if (session==null) {
            out.flush();
            //System.out.println(session.getAttribute("uname"));
            response.sendRedirect("../../html/usersHTML/registration.html");
           
         }

else{
     out.flush();
     response.sendRedirect("home.jsp");
}
%>