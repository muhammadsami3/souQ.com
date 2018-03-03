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
    dbMethods dbobj=new dbMethods();
    dbMethods.connectToDatabase();
    ResultSet rs= dbobj.getProductInfoById(id2);
    rs.next();
   String stock_amount= rs.getString("qyn");
   int qyn=Integer.parseInt(stock_amount);
   
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

<select name="userqyn">
                                        <% for (int i = 1; i <= qyn; i++) {%>
                                        <option><%=i%></option>
                                        <%}%>                        
                                    </select>

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

<select name="userqyn">
                                        <% for (int i = 1; i <= qyn; i++) {%>
                                        <option><%=i%></option>
                                        <%}%>                        
                                    </select>
    
<% } %>
      
    </body>
</html>
