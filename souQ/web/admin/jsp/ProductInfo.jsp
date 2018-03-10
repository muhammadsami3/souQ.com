<%-- 
    Document   : ProductInfo
    Created on : Mar 10, 2018, 1:32:16 PM
    Author     : Rouen Antar <rouen49@gmail.com>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../html/adminheader.html" %>

<%!String pname, cost, cat, amount, desc,img;%>

<% pname = (String) session.getAttribute("pname");
    cost = (String) session.getAttribute("cost");
    cat = (String) session.getAttribute("cat");
    amount = (String) session.getAttribute("amount");
    desc = (String) session.getAttribute("desc");
    img = (String) session.getAttribute("img");
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
                <td><%=pname%></td>
                <td rowspan="4">
                    <img src="../../imgs/<%=img%>" width="200" height="150" alt="Lam1_trans_NvBQzQNjv4BqnAdySV0BR-4fDN_-_p756cVfcy8zLGPV4EhRkjQy7tg"/>

                </td>

            </tr>
            <tr>
                <td>Cost/Item</td>
                <td><%=cost%></td>

            </tr>
            <tr>
                <td>Amount</td>
                <td><%=amount%></td>

            </tr>
            <tr>
                <td>Cat</td>
                <td><%=cat%></td>

            </tr>
        </tbody>
    </table>
    <div class="center">
        <%=desc%>

    </div>       
</div>
<br>
<br>
<div class="center">
    <form class="center" action="/souQ/admin/jsp/editUser.jsp" style="height: 90px;" method="post">
        <div class="center">
            <input type="submit" value="Go Back"  class="btn center" style="margin-left: 25%;" >
        </div>
    </form> 
</div>

<%@include file="../html/footer.html" %>
