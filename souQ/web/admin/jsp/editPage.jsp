
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../html/adminheader.html" %>
<%!String pname, cost, cat, amount, desc;%>

<% pname = (String) session.getAttribute("pname");
    cost = (String) session.getAttribute("cost");
    cat = (String) session.getAttribute("cat");
    amount = (String) session.getAttribute("amount");
    desc = (String) session.getAttribute("desc");
    pname = (pname == null) ? "" : pname;
    cost = (cost == null) ? "" : cost;
    cat = (cat == null) ? "" : cat;
    amount = (amount == null) ? "" : amount;
    desc = (desc == null) ? "" : desc;
%>

<div class="mainOption" id="editProduct" >
    <div class="center">
        <form   id="editform" action="/souQ/admin/getproductInfo" method="Get">
            <div class="center">
                Product Name to edit &nbsp;
                <input class="btn" type="text" name="pname"> 
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
                       System.out.println("className.methodName() --> name not found");%>

no such product

<% }%>

<div class="mainOption" id="editProduct">           
    <div class="center">

        <form  action="/souQ/admin/addProduct" method="Get" >
            <div class="center">

                Product Name </br>
                <input  class="addinput" id="pname" type="text" name="pname" value="<%=pname%>" required=""> 
                </br>
                </br>
                cost/item  </br>
                <input id="cost" type="number" name="cost" step="0.1" value="<%=cost%>" required="">
                </br>
                </br>
                Amount Available</br>
                <input id="amount" type="number" name="amount" value="<%=amount%>" required="">
                </br>
                </br>
                Category</br>

                <select  name="cat"  required="">
                    <option >Cars</option>
                    <option <%if (cat.equals("tv")) {%><%="selected"%> <% }%> >TV</option>
                </select>
                Image
                <input  type="file" name="img" >
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





<%@include file="../html/footer.html" %> </br><br>
                Image
                <input  type="file" name="img" >
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