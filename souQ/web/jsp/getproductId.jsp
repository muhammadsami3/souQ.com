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
%>

<% if (id.equals("1")) {
    dbMethods.connectToDatabase();
    ResultSet rs= dbMethods.getProductInfoById(id2);
    rs.next();
                    session.setAttribute("pname", rs.getString("name"));
                    session.setAttribute("cost", rs.getString("price"));
                    session.setAttribute("amount", rs.getString("qyn"));
                    session.setAttribute("cat", rs.getString("cat"));
                    session.setAttribute("id3", rs.getString("productid"));
%>
<h1>product name</h1>
<h1><%=rs.getString("name").toUpperCase() %></h1>
<h1>price</h1>
<h1><%=rs.getString("price").toUpperCase() %></h1>
amount remaininng in stock
<h1><%=rs.getString("qyn").toUpperCase() %></h1>
<h1>category</h1>
<h1><%=rs.getString("cat").toUpperCase() %></h1>
 <% }else if (id.equals("2")){ 
 response.sendRedirect("geteachproductInfo");
 %>
 <h1>2</h1>
    
<% } %>
      
    </body>
</html>
