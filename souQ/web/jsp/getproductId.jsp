<%-- 
    Document   : getproductInfo
    Created on : Mar 1, 2018, 4:32:37 PM
    Author     : raghda
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="dataBaseFunction.dbMethods"%>
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
    int id2=Integer.parseInt(id);
    dbMethods.connectToDatabase();
    ResultSet rs= dbMethods.getProductInfoById(id2);
    rs.next();
%>

<% if (id.equals("1")) {
    
    
    
                    
%>
<h1>product name</h1>
<h2><%=rs.getString("name").toUpperCase() %></h2>
<h1>price</h1>
<h2><%=rs.getString("price").toUpperCase() %></h2>
<h1>amount remaininng in stock</h1>
<h2><%=rs.getString("qyn").toUpperCase() %></h2>
<h1>category</h1>
<h2><%=rs.getString("cat").toUpperCase() %></h2>
 <% }else if (id.equals("2")){ 
 

 %>
 <h1>product name</h1>
<h2><%=rs.getString("name").toUpperCase() %></h2>
<h1>price</h1>
<h2><%=rs.getString("price").toUpperCase() %></h2>
<h1>amount remaininng in stock</h1>
<h2><%=rs.getString("qyn").toUpperCase() %></h2>
<h1>category</h1>
<h2><%=rs.getString("cat").toUpperCase() %></h2>
    
<% } %>
      
    </body>
</html>
