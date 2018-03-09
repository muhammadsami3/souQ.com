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
    
    ResultSet rs= dbobj.getProductInfoById(id2);
    rs.next();
   String stock_amount= rs.getString("qyn");
   int qyn=Integer.parseInt(stock_amount);
   
 int c_id = (int)session.getAttribute("Id");
 String name=rs.getString("name");
   
%>

<form action="/souQ/addtoCart">
<h1>product name</h1>
<h2><%=name.toUpperCase() %></h2>
<h1>price</h1>
<h2><%=rs.getString("price").toUpperCase() %></h2>
<h1>amount remaining in stock</h1>
<h2><%=rs.getString("qyn").toUpperCase() %></h2>
<h1>category</h1>
<h2><%=rs.getString("cat").toUpperCase() %></h2>


<% if(!dbobj.isProductExist1(id2,c_id)){ %>
<h1>select quantity</h1>
<select name="userqyn">
                                        <% for (int i = 1; i <= qyn; i++) {%>
                                        <option><%=i%></option>
                                        <%}%>                        
   </select> 
   
   <input type="hidden" name="product_id" value=<%= request.getParameter("id")%>>
   
   <input type="submit" value="Add to cart">
   
  <% }  else{%>
  
  <h1>You added this product to cart</h1>
  
   <%}%> 
   
</from>
    </body>
</html>
