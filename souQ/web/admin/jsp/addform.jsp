<%@page import="java.util.Enumeration"%>
<%!String pname, cost, cat, amount, desc, edit, add;%>
<%
    pname = (String) session.getAttribute("pname");
    cost = (String) session.getAttribute("cost");
    cat = (String) session.getAttribute("cat");
    amount = (String) session.getAttribute("amount");
    desc = (String) session.getAttribute("desc");
    edit = request.getParameter("edit");
    add = request.getParameter("add");

    pname = (pname == null) ? "" : pname;
    cost = (cost == null) ? "" : cost;
    cat = (cat == null) ? "" : cat;
    amount = (amount == null) ? "" : amount;
    desc = (desc == null) ? "" : desc;
    add = (add == null) ? "" : add;
    edit = (edit == null) ? "" : edit;

    System.out.println("className.methodName()" + pname + cost + cat + amount);
%>
<div class="mainOption" id="addProduct">           
    <div class="center">

        <form  action="/souQ/admin/addProduct" method="Get" >
            <div class="center">

                Product Name </br>
                <input  class="addinput" id="pname" type="text" name="pname" value="<%=pname%>"> 
                </br>
                </br>
                cost/item  </br>
                <input id="cost" type="number" name="cost" step="0.1" value="<%=cost%>">
                </br>
                </br>
                Amount Available</br>
                <input id="amount" type="number" name="amount" value="<%=amount%>">
                </br>
                </br>
                Category</br>

                <select  name="cat" >
                    <option >Cars</option>
                    <option <%if (cat.equals("tv")) {%><%="selected"%> <% }%> >TV</option>
                </select>
                </br><br>
                Description
                <br>
                <textarea id="desc" cols="48" rows="5" name="desc"><%=desc%></textarea>
                <br> 

                <input type="reset" value="reset" class="btn" >
                &nbsp;

                <%if (add.equals("yes")) {%>
                <input type="button" value="Add" onclick="validateAdd()" class="btn" style="margin-left: 28px;" > 
                <%}%>

                <%if (update.equals("yes")) {%>

                <input type="button" value="Add" onclick="validateAdd()" class="btn" style="margin-left: 28px;" > 
                <br>
                <ul type="circle" id="errMsg">
                    <ul>This item already exist </ul>
                    <a href="/souQ/admin/jsp/editPage.jsp"> 
                        <input type="button" onclick="validateAdd()" value="click here to update information" />
                    </a>
                </ul>
                <%}%>

                <%if (edit.equals("yes")) {%>
                <input type="text"  name="update" value="yes" style="display: none" > 
                <input type="button" value="Edit" onclick="validateAdd()" class="btn" style="margin-left: 28px;" > 
                <%}%>
                <br>
                <ul type="circle" id="errMsg">

                </ul>
            </div>
        </form>
    </div>
    <br>


</div>
