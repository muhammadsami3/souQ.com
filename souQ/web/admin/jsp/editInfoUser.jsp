<%-- 
    Document   : editInfoUser
    Author     : Rouen Antar <rouen49@gmail.com>
--%>

<%@page import="dataBaseFunction.dbMethods"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../html/adminheader.html" %>
<%!String fname, lname, uname, password;%>
<%!Float balance;%>
<% 
    
   dbMethods.connectToDatabase();
   int Id=Integer.parseInt(request.getParameter("userid"));
  
    /*fname = (String) session.getAttribute("fname");
    lname = (String) session.getAttribute("lname");
    uname = (String) session.getAttribute("uname");
    password = (String) session.getAttribute("password");
    balance = (Float) session.getAttribute("balance");
    fname = (fname == null) ? "" : fname;
    lname = (lname == null) ? "" : lname;
    uname = (uname == null) ? "" : uname;
    password = (password == null) ? "" : password;
   // balance = (balance == 0) ? "" : balance;*/
%>

<!--<div class="mainOption" id="editInfoUser" >
    <div class="center">
        <form   id="editform" action="/souQ/admin/editUser" method="Get">
            <div class="center">
               User Name to edit &nbsp;
                <input class="btn" type="text" name="uname"> 
                &nbsp;
                <br>
                <input class="center btn " type="submit" value="view information" style="margin-left: 25%;">
                <input tybe="text" value="edit" name="requestFrom" style="display: none">

            </div>
        </form>
    </div>

</div> 

<%
    balance=Float.parseFloat(request.getParameter("balance"));
   dbMethods.editInfoUser(Id, balance);
    String found = (String) session.getAttribute("found");
    found = (found == null) ? "" : found;

    if (found.equals("no")) {
                       System.out.println("className.methodName() --> name not found");%>

no such user

<% }%>

<div class="mainOption" id="editInfoUser">           
    <div class="center">

        <form  action="/souQ/admin/editUser" method="Get" >
            <div class="center">

                First Name </br>
                <input  class="fname" id="fname" type="text" name="fname" value="<%=fname%>" required=""> 
                </br>
                </br>
                Last Name  </br>
                <input id="lname" type="text" name="lname" value="<%=lname%>" required="">
                </br>
                </br>
               User Name </br>
                <input id="uname" type="text" name="uname" value="<%=uname%>" required="">
                </br>
                </br>
                
                  </br>
                </br>
               Password </br>
                <input id="password" type="text" name="password" value="<%=password%>" required="">
                </br>
                </br>
                
                  </br>
                </br>
               Balance </br>
                <input id="balance" type="number" name="balance" value="<%=balance%>" required="">
                </br>
                </br>
               

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
                <textarea id="desc" cols="48" rows="5" name="desc" required=""><!--%=desc%></textarea>
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


</div>-->





<%@include file="../html/footer.html" %>
