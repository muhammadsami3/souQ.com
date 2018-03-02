<%-- 
    Document   : checkOurPage
    Created on : Feb 28, 2018, 9:17:56 PM
    Author     : Muhammad Sami
--%>

<%@page import="dataBaseFunction.dbMethods"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%!
    Integer id, qyn, totalPrice, NumOfProducts;
    dbMethods doQuery = new dbMethods();
    ResultSet rs;
    ResultSet rs2;
    Integer userqyn;
%>

<%totalPrice = 0;
%>
<html>
    <head>
        <link rel="stylesheet"   type="text/css" href="../../css/style.css">

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SouQ.com</title>
    </head>
    <body>
        <div class="container">
            <div>
                <h1>Shopping Cart </h1>
            </div>
            <form action="/souQ/CheckOut" style="width: 75%;">
                <div class="cartContainer">
                    <%
                        rs = doQuery.getCartInfo(1);
                        System.out.println("className.methodName()");
                        while (rs.next()) {
                            String tempId = rs.getString("productid");
                            int id = Integer.parseInt(tempId);
                            rs2 = doQuery.getProductInfoById(id);
                            userqyn = Integer.parseInt(rs.getString("quantity"));

                            while (rs2.next()) {
                                String tempQyn = rs2.getString("qyn");
                                qyn = Integer.parseInt(tempQyn);
                                Integer price = Integer.parseInt(rs2.getString("price"));
                                totalPrice += price*userqyn;


                    %>
                    <div class="center">
                        <table class="center" >

                            <tr>
                                <th><h2><%=rs2.getString("name").toUpperCase()%></h2> </th>
                                <th></th>
                                <th></th>
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
                                <td>
                                    <select name="qyn<%=rs2.getString("productid")%>">
                                        <% for (int i = 1; i <= qyn; i++) {%>
                                        <option <% if (i == userqyn) {%>
                                            <%="selected"%>

                                            <%}%>
                                            ><%=i%></option>
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
                    <%
                            }
                        }%>
                    <div class="top_right" >
                        <font style="font-size: 18px">Total:</font>
                        <font style="font-size: 17px"><b><%=totalPrice%></b> </font>  



                        <font style="font-size: 17px">EGP</font>  
                        <br>
                        <br>
                        <input type="submit" class="btn" id="checkoutbtn" value="PROCEED TO CHECKOUT"/>
                    </div>


            </form>



        </div>

    </body>
</html>
