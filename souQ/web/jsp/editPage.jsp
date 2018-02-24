<%-- 
    Document   : editPage
    Created on : Feb 24, 2018, 10:02:24 PM
    Author     : Muhammad Sami
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../html/adminheader.html" %>

<div class="mainOption" id="editProduct" >
    <div class="center">
        <form   id="editform" action="/souQ/getproductInfo" method="Get">
            <div class="center">
                Product Name to edit &nbsp;
                <input calss="btn" type="text" name="pname"> 
                &nbsp;
                <input type="submit" value="view information" > 
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
        <jsp:include page="addform.jsp?update=no&edit=yes"></jsp:include>
<%}  }%> 