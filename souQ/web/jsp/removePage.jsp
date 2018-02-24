<%-- 
    Document   : removePage
    Created on : Feb 24, 2018, 10:02:43 PM
    Author     : Muhammad Sami
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../html/adminheader.html" %>


<div class="mainOption" id="removeProduct" >
    <div class="center">

        <form action="/souQ/getproductInfo" method="Get">
            <div class="center">

                Product Name to remove &nbsp;
                <input type="text" name="pname"> &nbsp;
                <input type="submit" value="view information">
                <input tybe="text" value="remove" name="requestFrom" style="display: none">
            </div>
        </form>
    </div>
</div>

    <%
    String found = (String)session.getAttribute("found");
    if(found != null){
        if (found.equals("no")) {
            System.out.println("className.methodName() --> name not found");%>

         no such product
    
<% }else {%>
        <jsp:include page="prouductInfo.jsp"></jsp:include>
<%}  }%> 
