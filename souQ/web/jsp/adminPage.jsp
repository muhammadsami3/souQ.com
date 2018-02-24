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

</br>
</br>

</br>





<% if (d != null) {

        if (d.equals("add")) {
%>
<div class="mainOption" id="addProduct">
    <form action="/souQ/addProduct" method="Get">
        Product Name </br>
        <input type="text" name="pname"> 
        </br>
        </br>
        cost/item  </br>
        <input type="number" name="cost" step="0.1">
        </br>
        </br>
        Amount Available</br>
        <input type="number" name="amount">
        </br>
        </br>
        Category</br>
        <select name="cat" style="width:12%" name="cat">
            <option>Cars</option>
            <option>TV</option>
        </select>

        </br>
        </br>
        <input type="reset" value="Clear">
        <input type="submit" value="Add">    
    </form>
</div>
</br>
   </br>
<%    if (s != null) {
        if (s.equals("yes")) {%>
        
 <font style="color: green" >user added successfully</font> 


<%   }else if(s.equals("no")){
%>

<font style="color: red" >failed to add users</font> 
<%
}
    }
%>

<%} else if (d.equals("edit")) {
%>

<div class="mainOption" id="editProduct">
    <form action="editProduct" method="Get">
        Product Name to edit &nbsp;
        <input type="text" name="pname"> 
        &nbsp;
        <input type="submit" value="view information">    
    </form>
</div>

<%
} else if (d.equals("remove")) {
%>
<div class="mainOption" id="removeProduct" >
    <form action="removeProduct" method="Get">
        Product Name to remove &nbsp;
        <input type="text" name="pname"> &nbsp;
        <input type="submit" value="view information">    
    </form>
</div>



<%
        }

    }%>
<%%>
<%%>

<%@include file="../html/footer.html" %>
