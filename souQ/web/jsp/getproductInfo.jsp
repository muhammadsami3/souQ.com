<%-- 
    Document   : getproductInfo
    Created on : Mar 1, 2018, 4:32:37 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    
    <body>

<%!
    String id;
%>

<%
    id = request.getParameter("id");
%>

<% if (id.equals("1")) { %>
<h1>1</h1>
 <% }else if (id.equals("2")){ %>
 <h1>2</h1>
    
<% } %>
      
    </body>
</html>
