<%-- 
    Document   : productsEdit
    Created on : Mar 8, 2018, 7:26:41 PM
    Author     : Muhammad Sami
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="dataBaseFunction.dbMethods"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../html/adminheader.html" %>


<%!
    Integer id, qyn, NumOfProducts;
    double totalPrice, credit;
    dbMethods doQuery = new dbMethods();
    ResultSet rs;
    ResultSet rs2;
%>

<div class="container" style="top: 33px;">
    <div class="cartContainer">
        
        <%
            rs = doQuery.showProducts();
            System.out.println("className.methodName()");
            while (rs.next()) {
                String tempId = rs.getString("productid");
                int id = Integer.parseInt(tempId);
        %>
        <div class="container" >
            <div class="center" style="border: 1px solid #c9c4ea;width: 390px;padding: 0px;">
                <table class="center" style="width: 100px;" >

                    <tr>
                        <th><%=rs.getString("name").toUpperCase()%></th>
                        <th </th>

                        <th style="width: 210px;"></th>
                    </tr>

                    <tr>
                        <td></td>
                        <td></td>
                        <td rowspan="4">
                            <img src="../../imgs/<%=rs.getString("img")%>" width="100" height="100" />

                        </td>

                    </tr>
                    <tr>
                        <td>Cost/Item</td>
                        <td  style="width: 100px;display: block;">

                            <%=rs.getString("price")%></td>

                    </tr>
                    <tr>
                        <td>Amount</td>
                        <td>
  <%=rs.getString("qyn")%></td>
                        </td>

                    </tr>
                    <tr>
                        <td>Category</td>
                        <td><%=rs.getString("cat")%></td>

                    </tr>
                </table>
            </div>
            <div style="position: absolute;top: 7%;  right: 37%;">
                <a href="/souQ/admin/getproductInfo?pname=<%=rs.getString("name")%>&requestFrom=remove">
                    <input type="button" value="Remove" name="removeFromCart" />
                </a>
            </div>
            <div style="position: absolute;top: 7%;  right: 43%;">
                <a href="/souQ/admin/getproductInfo?pname=<%=rs.getString("name")%>&requestFrom=edit">
                    <input type="button" value="Edit" name="removeFromCart" />
                </a>
            </div>
        </div>
        <%
            }
        %>

    </div>
    <footer><font>Copyright &copy; SouQ.com</font></footer>

    <script src="../javascript/admin.jsx"></script>        
</body>
</html>