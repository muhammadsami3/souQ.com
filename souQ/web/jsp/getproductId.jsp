<%-- 
    Document   : getproductInfo
    Created on : Mar 1, 2018, 4:32:37 PM
    Author     : raghda
--%>


<%@include file="../../user/jsp/header.jsp" %>

<%@page import="java.sql.ResultSet"%>
<%@page import="dataBaseFunction.dbMethods"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet"   type="text/css" href="../css/style.css">
<%!
    String id;
%>

<%
    id = request.getParameter("id");
    int id2 = Integer.parseInt(id);
    dbMethods dbobj = new dbMethods();

    ResultSet rs = dbobj.getProductInfoById(id2);
    rs.next();
    String stock_amount = rs.getString("qyn");
    int qyn = Integer.parseInt(stock_amount);
    if (session.getAttribute("Id") == null) {
        response.sendRedirect("/souQ/user/jsp/login.jsp");

    }

    int c_id = (int) session.getAttribute("Id");

    String name = rs.getString("name");

%>


<br>
<br>
<form action="/souQ/addtoCart">
    <h1>product name</h1>
    <h3 style="color:purple;"><%=name.toUpperCase()%></h3>
    <input id="img" type="image" src="../imgs/<%=rs.getString("img")%>" Style="width: 200px" height="150" width="200" alt="car" name="car1" value="1">

    <h1>price</h1>
    <h3 style="color:purple;"><%=rs.getString("price").toUpperCase()%></h3>
    <%if (qyn == 0) {%>

    <h1 style="color:red;">out of stock</h1>

    <% }%>
    <h1>Remaining pieces in Stock</h1>  
    <h3 style="color:purple;"><%=rs.getString("qyn").toUpperCase()%></h3>
    <h1>category</h1>
    <h3 style="color:purple;"><%=rs.getString("cat").toUpperCase()%></h3>


    <% if (!dbobj.isProductExist1(id2, c_id)) { %>
    <h1>select quantity</h1>
    <select name="userqyn">
        <% for (int i = 1; i <= qyn; i++) {%>
        <option><%=i%></option>
        <%}%>                        
    </select> 

    <input type="hidden" name="product_id" value=<%= request.getParameter("id")%>>

    <input type="submit" value="Add to cart">

    <% } else {%>

    <h2 style="color:red;">You added this product to cart</h2>

    <%}%> 

</from>

<%@include file="../user/html/footer.html" %>
