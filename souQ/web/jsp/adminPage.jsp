<%-- 
    Document   : adminPage
    Created on : Feb 23, 2018, 4:33:42 PM
    Author     : Muhammad Sami
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../html/adminheader.html" %>

<%!
    String s;
    String d;
%>
<%

    s = request.getParameter("s");
    d = request.getParameter("d");

%>
</br></br></br>
<% if (d != null) {

        if (d.equals("add")) {
%>

<div class="mainOption" id="addProduct">           
    <div class="center">

        <form  action="/souQ/addProduct" method="Get" >
            <div class="center">

                Product Name </br>
                <input  class="addinput" id="pname" type="text" name="pname"> 
                </br>
                </br>
                cost/item  </br>
                <input id="cost" type="number" name="cost" step="0.1">
                </br>
                </br>
                Amount Available</br>
                <input id="amount" type="number" name="amount">
                </br>
                </br>
                Category</br>
                <select name="cat"  name="cat">
                    <option value="cars">Cars</option>
                    <option value="tv">TV</option>
                </select>
                </br><br>
                  Description
                  <br>
                  <textarea id="desc" cols="48" rows="5"   name="desc"></textarea>
                  
                  <br>
                <input type="reset" value="Clear" class="btn" >
                &nbsp;
                <input type="button" value="Add" onclick="validateAdd()" class="btn" style="margin-left: 28px;" > 
                <br>
                <ul type="circle" id="errMsg">

                </ul>

            </div>
        </form>
    </div>
    <br>


</div>
</br>

</br>
<%    if (s != null) {
        if (s.equals("yes")) {%>      
<font style="color: green" >user added successfully</font> 
<%   } else if (s.equals("no")) {
%>
<font style="color: red" >failed to add users</font> 
<%
        }
    }
%>
<%}                         
 else if (d.equals("remove")) {
%>

<%
        }

    }%>

    
<%
    String pnameExist = (String) session.getAttribute("pnameExist");
    System.out.println("className.methodName() --> pnameExist");
    if (pnameExist != null) {
        if (pnameExist.equals("yes")) { %>

<jsp:include page="addform.jsp?update=yes&edit=no"></jsp:include>
    
<% }
               }%> 
               
                   

               
               
               
               
                        
                        
<%%>
<%%>
<%%>
<%%>
<%%>
<%%>
<%%>
<%%>
<%@include file="../html/footer.html" %>
