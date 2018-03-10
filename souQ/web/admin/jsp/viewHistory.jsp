<%-- 
    Document   : viewHistory.jsp
    Created on : Mar 8, 2018, 12:16:36 PM
    Author     : Rouen Antar <rouen49@gmail.com>
--%>

<%@page import="dataBaseFunction.dbMethods"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../html/adminheader.html" %>
<%!ResultSet rsUser, rsOrders, rsCart, rsProducts;
    int i;%>
<%

    int id = Integer.parseInt(request.getParameter("userid"));

    dbMethods dbqMethods = new dbMethods();
    rsUser = dbqMethods.getUserInfo(id);
    rsUser.next();
    String fname = rsUser.getString("fname");
    String lname = rsUser.getString("lname");
    i = 0;
%>
<h2>
    <%=fname + " " + lname + " history"%>
</h2>
<table border="1" cellspacing="1" cellpadding="1">
    <thead>
        <tr>
            <th>No.</th>
            <th>Date</th>
            <th>Total Price</th>
            <th>Products</th>
        </tr>
    </thead>
    <%

        rsOrders = dbqMethods.getUserorders(id);
        while (rsOrders.next()) {
            int orderid = Integer.parseInt(rsOrders.getString("orderid"));
            rsCart = dbqMethods.getFinalCartInfo(orderid);

    %>

    <tbody>
        <tr>
            <td><%=++i%></td>
            <td><%=rsOrders.getString("orderdate")%></td>
            <td><%=rsOrders.getString("totalamount")%></td>
            <td>
                <%
                    while (rsCart.next()) {
                        String temp = rsCart.getString("productid");
                        int productid = Integer.parseInt(temp);
                        rsProducts = dbqMethods.getProductInfoById(productid);
                        rsProducts.next();
                %>
                <%=rsCart.getString("quantity")%> from 
                <a href="/souQ/admin/getproductInfo?pname=<%=rsProducts.getString("name")%>&requestFrom=ProductInfo"><%=rsProducts.getString("name")%>
                </a>
                <%}%>
            </td>
        </tr>
    </tbody>



    <%  }%>

</table>

<%@include file="../html/footer.html" %>