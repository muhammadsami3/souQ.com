<%-- 
    Document   : removePage
    Created on : Feb 24, 2018, 10:02:43 PM
    Author     : Muhammad Sami
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../html/adminheader.html" %>


<div class="mainOption" id="removeProduct" >
    <div class="center">

        <form action="/souQ/admin/getproductInfo" method="Get">
            <div class="center"  >

                Product Name to remove &nbsp;
                <input type="text" name="pname"> &nbsp;
                <br>
                
                <input class="center btn " type="submit" value="view information" style="margin-left: 25%;">
                <input tybe="text" value="remove" name="requestFrom" style="display: none">
            </div>
        </form>
        <% String success = (String) session.getAttribute("success");
            success = (success == null) ? "" : success;
            if (success.equals("yes")) {%>
        <div class="msg center" style="height: 320px;"> 
            <font style="color: green;margin-left: 23%;height: 320px; " class="center" >product removed successfully </font>
        </div>

        <%System.out.println("className.methodName() --> item deleted successfuly");
                session.setAttribute("success", " ");
            }
        %>


    </div>
</div>

<%
    String found = (String) session.getAttribute("found");
    found = (found == null) ? "" : found;

    if (found.equals("no")) {
        session.setAttribute("found", " ");
        System.out.println("className.methodName() --> name not found");%>
<div class="msg center" style="height: 320px;"> 
    <font style="color: red;margin-left: 40%;" class="center" >product not found </font>
</div>


<% } else if (found.equals("yes")) {%>
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
    <form class="center" action="/souQ/admin/removeProduct">
        <div class="center">
            <input type="submit" value="Remove"  class="btn center" style="margin-left: 25%;" >
        </div>
    </form> 
</div>
<% }else{
%> 
<div style="height: 320px;">
    
</div>

<%}%>
<%@include file="../html/footer.html" %>