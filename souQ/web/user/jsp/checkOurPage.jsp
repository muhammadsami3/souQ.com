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
    Integer id, amount;
    dbMethods doQuery = new dbMethods();
    ResultSet rs;
    ResultSet rs2;
%>

<%
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SouQ.com</title>
    </head>
    <body>
        <div>

            <form action="/souQ/CheckOut">
                <%                       
                    rs = doQuery.getCartInfo(1);
                    System.out.println("className.methodName()");
                    while (rs.next()) {
                        String tempId = rs.getString("productid");
                        String tempQyn = rs.getString("quantity");
                        int id = Integer.parseInt(tempId);
                        amount = Integer.parseInt(tempQyn);
                        rs2 = doQuery.getProductInfoById(id);
                        while (rs2.next()) {
                            
                        
                %>
                <div class="center">
                    <table class="center" >

                        <tr>
                            <th>Product</th>
                            <th></th>
                            <th>Image</th>
                        </tr>

                        <tbody>
                            <tr>
                                <td>Name</td>
                                <td><%=rs2.getString("name")%></td>
                                <td rowspan="4">
                                    <img src="../../imgs/<%=rs2.getString("img")%>" width="200" height="150" alt="Lam1_trans_NvBQzQNjv4BqnAdySV0BR-4fDN_-_p756cVfcy8zLGPV4EhRkjQy7tg"/>

                                </td>

                            </tr>
                            <tr>
                                <td>Cost/Item</td>
                                <td><%=rs2.getString("price")%></td>

                            </tr>
                            <tr>
                                <td>Amount</td>
                                <td>
                                    <select name="qyn">
                                        <% for (int i = 1; i <= amount; i++) {%>
                                        <option><%=i%></option>
                                        <%}%>                        
                                    </select>

                                </td>

                            </tr>
                            <tr>
                                <td>Cat</td>
                                <td><%=rs2.getString("cat")%></td>

                            </tr>
                        </tbody>
                    </table>
                </div>
                <%}
                            }%>
                <div>
                    <input type="submit"/>

                </div>
            </form>



        </div>

    </body>
</html>
