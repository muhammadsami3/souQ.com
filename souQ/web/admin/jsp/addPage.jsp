<%-- 
    Document   : addPage
    Created on : Feb 23, 2018, 4:33:42 PM
    Author     : Muhammad Sami
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../html/adminheader.html" %>
<%!String update;%>
<%    update = request.getParameter("update");
    update = (update == null) ? "" : update;

%>

<div class="mainOption" id="addProduct">           
    <div class="center">

        <form  action="/souQ/admin/addProduct" method="Get" >
            <div class="center">

                Product Name </br>
                <input  class="addinput" id="pname" type="text" name="pname"></br></br>
                
                cost/item  </br>
                <input id="cost" type="number" name="cost" step="0.1" ></br></br>
                Amount Available</br>
                <input id="amount" type="number" name="amount" value=""></br></br>

                Category</br>
                <select  name="cat" >
                    <option >Cars</option>
                    <option >TV</option>
                </select></br><br>
                
                Description
                <br><textarea id="desc" cols="48" rows="5" name="desc"></textarea> <br> 
                Image
                <input  type="file" name="img" >
                <br>
                <br>
                <input type="reset" value="reset" class="btn" >                &nbsp;
                <input type="button" value="Add" onclick="validateAdd()" class="btn" style="margin-left: 28px;" > 
                <br>
                <ul type="circle" id="errMsg">
                    <%                        String pnameExist = (String) session.getAttribute("pnameExist");
                        pnameExist = (pnameExist == null) ? "" : pnameExist;

                        if (pnameExist.equals("yes")) { %>
                    <li>This item already exist </li>
                     </ul>
                    <br>

                    <a href="/souQ/admin/jsp/editPage.jsp"> 
                        <input type="button" class="btn" value=">> click here to update information <<" />
                    </a>

                    <% }%>

            </div>
        </form>
    </div>
    <br>


</div>


<%@include file="../html/footer.html" %>