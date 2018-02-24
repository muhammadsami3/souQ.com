<%!String pname = " ", cost = " ", cat = " ", amount = " ", desc = "", edit, update;%>
<%
    pname = (String) session.getAttribute("pname");
    cost = (String) session.getAttribute("cost");
    cat = (String) session.getAttribute("cat");
    amount = (String) session.getAttribute("amount");
    desc = (String) session.getAttribute("desc");
    edit = request.getParameter("edit");
    update = request.getParameter("update");

    System.out.println("className.methodName()" + pname + cost + cat + amount);
%>
<div class="mainOption" id="addProduct">           
    <div class="center">

        <form  action="/souQ/addProduct" method="Get" >
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
                <textarea id="desc" cols="48" rows="5" name="desc"><%=desc%></textarea>
                <br> 

                <input type="reset" value="Clear" class="btn" >
                &nbsp;
                <%if (update != null && update.equals("yes")) {%>
                <input type="button" value="Add" onclick="validateAdd()" class="btn" style="margin-left: 28px;" > 
                <br>
                <ul type="circle" id="errMsg">
                    <ul>This item already exist </ul>
                    <a href="/souQ/addProduct?update=yes&cat=&pname="> 
                        <input type="button" value="click here to update information" />
                    </a>
                </ul>
                <%}%>

                <%if (edit != null && edit.equals("yes")) {%>
                <a href="/souQ/addProduct?update=yes&cat=&pname="> 
                    <input class="btn" type="button" onclick="validateAdd()" value="Edit" style="margin-left: 28px;"  />
                </a>
                <%}%>
            </div>
        </form>
    </div>
    <br>


</div>
