<%-- 
    Document   : search
    Created on : Mar 9, 2018, 10:11:09 AM
    Author     : maryam
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="servlets.usersServlets.DBConnector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<%!String   name,description, img, product ;
   int  price, quantity ;
%>
        <%
    RequestDispatcher r3 = request.getRequestDispatcher("../html/sidebar.html");
    r3.include(request, response);
    String search=request.getParameter("search");
//        out.flush();
//        out.print(search);
//        out.flush();
    Connection conn = DBConnector.getConnection();
    Statement stmt = conn.createStatement();
   

    String queryString = new String("select * from product where name like '%" + search + "%'");
    ResultSet rs = stmt.executeQuery(queryString);       
    while(rs.next())
    {
     %>   
<div class="w3-main w3-padding-64" style="margin-left:250px"> 
<%
    out.flush();
    name=rs.getString("name");
    price=(int)rs.getDouble("price"); 
    quantity=rs.getInt("qyn");
    description=rs.getString("description");
    img="../../imgs/"+rs.getString("img");
    %>
<!--    product="Product Name : "+name+"\n"+"Price : "+price+"\n"+"Available in stock : "+quantity+"\n"+
             "Description : "+description;
    out.println(product);
    out.flush();-->
<table>
    <tr>
        
            <img src=<%=img%>>
        
    </tr>
    <tr>
        
        <td>
            Product Name :
        </td>
        <td>
            <%
            out.print(name);
            out.flush();
            %>
        </td>
        
    </tr>
    <tr>
        <td>
            Price :
        </td>
        <td>
            <%
            out.print(price);
            out.flush();
            %>
        </td>
    </tr>
    <tr>
        <td>
           Available in stock : 
        </td>
        <td>
            <%
            out.print(quantity);
            out.flush();
            %>
        </td>
    </tr>
    <tr>
        <td>
            Description :
        </td>
        <td>
            <%
            out.print(description);
            out.flush();
            %>
        </td>
    </tr>
</table>
</div>

<%}%>
 
