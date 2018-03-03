<%-- 
    Document   : editPage
    Created on : Feb 24, 2018, 10:02:24 PM
    Author     : Muhammad Sami
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../html/adminheader.html" %>
<%!String pname, cost, cat, amount, desc,id,img;%>

<% pname = (String) session.getAttribute("pname");
    cost = (String) session.getAttribute("cost");
    cat = (String) session.getAttribute("cat");
    amount = (String) session.getAttribute("amount");
    desc = (String) session.getAttribute("desc");
    img = (String) session.getAttribute("img");
    id = (String) session.getAttribute("id");
    pname = (pname == null) ? "" : pname;
    cost = (cost == null) ? "" : cost;
    cat = (cat == null) ? "" : cat;
    amount = (amount == null) ? "" : amount;
    desc = (desc == null) ? "" : desc;
    id = (id == null) ? "" : id;
    System.out.println("className.methodName() IDDDD _-->" +id);
    img = (img == null) ? "" : img;
%>

<div class="mainOption" id="editProduct"  style="height: 150px;">
    <div class="center">
        <form   id="editform" action="/souQ/admin/getproductInfo" method="Get">
            <div class="center">
                Product Name to edit &nbsp;
                <input calss="btn" type="text" name="pname" required=""> 
                &nbsp;
                <br>
                <input class="center btn " type="submit" value="view information" style="margin-left: 25%;">
                <input tybe="text" value="edit" name="requestFrom" style="display: none">

            </div>
        </form>
    </div>

</div> 
<%
    String found = (String) session.getAttribute("found");
    found = (found == null) ? "" : found;

    if (found.equals("no")) {
        session.setAttribute("found", "");
        System.out.println("className.methodName() --> name not found");%>
<div class="msg center"> 
    <font style="color: red;margin-left: 35%; " class="center">Product Not Found</font>
</div>


<% }else if(found.equals("yes")){

session.setAttribute("found", "");
}else{
pname = "";
    cost = "";
    cat = "";
    amount = "";
    desc = "";
    id = "-1";
}

    String success = request.getParameter("success");
    success = (success == null) ? "" : success;
    if (success.equals("yes")) {%>
<div class="msg center"> 
    <font style="color: green;margin-left: 34%; " class="center">product Information updated </font>
</div>

<%}%>

<div class="mainOption" id="editProduct2" style="height: 600px;">           
    <div class="center">

        <form  action="/souQ/admin/addProduct" method="post" >
            <div class="center">

                Product Name </br>
                <input  class="addinput" id="pname" type="text" name="pname" value="<%=pname%>" required=""> 
                </br>
                </br>
                cost/item  </br>
                <input id="cost" type="number" name="cost" step="0.1" value="<%=cost%>" min="0" required="">
                </br>
                </br>
                Amount Available</br>
                <input id="amount" type="number" name="amount" value="<%=amount%>" min="0" required="">
                </br>
                </br>
                Category</br>

                <select  name="cat"  required="">
                    <option >Cars</option>
                    <option <%if (cat.equals("Motocycles")) {%><%="selected"%> <% }%> >Motocycles</option>
                </select>
                </br><br>
                Image
                <input  type="file" name="img" value="../../imgs/<%=img%>" >
                <br>
                <br>
                Description
                <br>
                <textarea id="desc" cols="48" rows="5" name="desc" required=""><%=desc%></textarea>
                <br> 
                <br>

                <input  type="reset" value="reset" class="btn" >
                &nbsp;
                <input type="text"  name="edit" value="yes" style="display: none" > 
                <input type="submit" value="Edit" class="btn" style="margin-left: 28px;" > 
                <br>
                <ul type="circle" id="errMsg">

                </ul>
            </div>
        </form>
    </div>
    <br>


</div>





<%@include file="../html/footer.html" %>