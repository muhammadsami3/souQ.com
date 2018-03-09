<%-- 
    Document   : checkOurPage
    Created on : Feb 28, 2018, 9:17:56 PM
    Author     : Muhammad Sami
--%>
<%@include file="../../user/jsp/header.jsp" %>
<%@page import="dataBaseFunction.dbMethods"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link rel="stylesheet"   type="text/css" href="../../css/style.css">
<%!
    Integer id, qyn, NumOfProducts;
    double totalPrice, credit;
    dbMethods doQuery = new dbMethods();
    ResultSet rs;
    ResultSet rs2;
    Integer userqyn;
    int customerid;
%>

<%totalPrice = 0;
//customerid =(int)session.getAttribute("ID");
    customerid = 1;//just for tring
    credit = doQuery.getCredit(customerid);
%>

<div class="container" style="top: 33px;">
    <div>
        <h1>Shopping Cart </h1>
    </div>
    <form action="/souQ/addFinalCart" style="width: 75%;">
        <div class="cartContainer">
            <%
                rs = doQuery.getCartInfo(customerid);
                System.out.println("className.methodName()");
                while (rs.next()) {
                    String tempId = rs.getString("productid");
                    int id = Integer.parseInt(tempId);
                    rs2 = doQuery.getProductInfoById(id);
                    userqyn = Integer.parseInt(rs.getString("quantity"));

                    while (rs2.next()) {
                        String tempQyn = rs2.getString("qyn");
                        qyn = Integer.parseInt(tempQyn);
                        Double price = Double.parseDouble(rs2.getString("price"));
                        totalPrice += price * userqyn;
                        session.setAttribute("totalPrice", totalPrice);
            %>
            <div class="container">
                <div class="center" style="border: 1px solid #c9c4ea;width: 600px;margin-bottom: 2%;">
                    <table class="center" style="width: 600px;" >

                        <tr>
                            <th></th>
                            <th><h2><%=rs2.getString("name").toUpperCase()%></h2> </th>

                            <th style="width: 210px;"></th>
                        </tr>


                        <tr>
                            <td></td>
                            <td></td>
                            <td rowspan="4">
                                <img src="../../imgs/<%=rs2.getString("img")%>" width="200" height="150" alt="Lam1_trans_NvBQzQNjv4BqnAdySV0BR-4fDN_-_p756cVfcy8zLGPV4EhRkjQy7tg"/>

                            </td>

                        </tr>
                        <tr>
                            <td>Cost/Item</td>
                            <td  style="width: 100px;display: block;">

                                <%=rs2.getString("price")%></td>

                        </tr>
                        <tr>
                            <td>Amount</td>
                            <td >

                                <select name="qyn<%=rs2.getString("productid")%>" onchange="location = this.value;">
                                    <% for (int i = 1; i <= qyn; i++) {%>

                                    <a href="/souQ/user/jsp/checkOutPage.jsp">
                                        <option value="/souQ/ChangeQyn?userqyn=<%=i%>&id=<%=id%>"<% if (i == userqyn) {%>
                                                <%="selected"%>

                                                <%}%>
                                                ><%=i%></option>
                                    </a>
                                    <%}%>   


                                </select>


                            </td>

                        </tr>
                        <tr>
                            <td>Category</td>
                            <td><%=rs2.getString("cat")%></td>

                        </tr>
                    </table>
                </div>
                <div id="removeFromCart">
                    <a href="/souQ/removeFromCart?id=<%=id%>">
                        <input type="button" value="X" name="removeFromCart" style="height: 30px;"/>
                    </a>
                </div>
            </div>
            <%
                    }
                }%>
           
            <div class="top_right" >

                <%if (totalPrice != 0) {%>
                <font style="font-size: 18px">Total:</font>
                <font style="font-size: 17px"><b><%=totalPrice%></b> </font>  
                <font style="font-size: 17px">EGP</font>  
                <br>
                <br>
                 <%if (credit > totalPrice) {%>
                <input type="submit" class="btn" id="checkoutbtn" value="PROCEED TO CHECKOUT"/>
                <%}%>
                <%} %>

            <%if (credit < totalPrice) {%>
                <br>
                <font style="font-size: 17px;color: red"><b>ops! Credit Limit exceeded</b> </font> 
                <%}
                %>
            </div>




    </form>

    <%if (totalPrice == 0) {%>
    <div style="height: 495px;">
        <font style="font-size: 17px"><b>Add some Product and come back :D</b> </font> 
    </div>

    <%}%>

</div>

<%@include  file="../../user/html/footer.html" %>