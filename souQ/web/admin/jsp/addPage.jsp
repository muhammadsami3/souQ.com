<%-- 
    Document   : addPage
    Created on : Feb 23, 2018, 4:33:42 PM
    Author     : Muhammad Sami
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../html/adminheader.html" %>


<div class="mainOption" id="addProduct" style="height: 600px;" >           
    <div class="center">

        <% String success = request.getParameter("s");
            success = (success == null) ? "" : success;
            if (success.equals("yes")) {%>
        <div class="msg center"> 
            <font style="color: green;margin-left: 15%; " class="center">product successfully added to Database </font>
        </div>

        <%} else if (success.equals("no")) {%>
        <div class="msg center"> 
            <font style="color: red;margin-left: 15%; " class="center">FATAL ERROR !! Must call Support</font>
        </div>
        <%}%>

        <%
            String pnameExist = (String) session.getAttribute("pnameExist");
            pnameExist = (pnameExist == null) ? "" : pnameExist;

            if (pnameExist.equals("yes")) { %>
        <div class="msg center"> 
            <font style="color: red;margin-left: 15%; " class="center">This Product Already Exist !</font>
        </div>

        <div class="center">
            <form   id="editform" action="/souQ/admin/getproductInfo" method="Get">
                <div class="center">
                    <input calss="btn" type="text"  value="" name="pname" style="display: none"> 
                    &nbsp;
                    <br>
                    <input class="center btn " type="submit" value=">> click here to update information <<" style="margin-left: 25%;">
                    <input tybe="text" value="edit" name="requestFrom" style="display: none">

                </div>
            </form>
        </div>

        <br>
        <br>
        <% }%>

        <form  action="/souQ/admin/addProduct" method="post" >
            <div class="center">

                Product Name </br>
                <input  class="addinput" id="pname" type="text" name="pname" required=""></br></br>

                cost/item  </br>
                <input id="cost" type="number" name="cost" step="0.1" min="0" required="" ></br></br>
                Amount Available</br>
                <input id="amount" type="number" name="amount" value="" min="0"  required=""></br></br>

                Category</br>
                <select  name="cat" >
                    <option >Cars</option>
                    <option >Motocycles</option>
                </select></br><br>
                Image
                <input  type="file" name="img" >
                <br>
                <br>
                Description
                <br><textarea id="desc" cols="48" rows="5" name="desc"></textarea> <br> 
                <br>

                <input type="reset" value="reset" class="btn" >                &nbsp;
                <input type="button" value="Add" onclick="validateAdd()" class="btn" style="margin-left: 28px;" > 
                <br>
                <ul type="circle" id="errMsg">

                </ul>
            </div>
        </form>
    </div>
    <br>


</div>


<%@include file="../html/footer.html" %>