<%-- 

    Author     : Rouen Antar <rouen49@gmail.com>
--%>


<%@page import="java.sql.ResultSet"%>
<%@page import="dataBaseFunction.dbMethods"%>
<%@include file="../html/adminheader.html" %>
<%!String fname, lname, uname, password,birthday,email,job,address,interests,s , s2 ,s3;%>
<%!Float balance;%>
<%!int id;%>



<div class="center">
    <table class="center" >
  

        <tbody>
            <tr>
                <td>ID</td>  
                <td>First Name </td>
                <td>Last Name </td>
                <td>User Name</td>
                <td>Password</td>
                <td>Birthday</td>
                <td>Email</td>
                <td>Job</td>
                <td>Address</td>
                <td>Interests</td>
            </tr>
            <%
                dbMethods dbqMethods = new dbMethods();
                ResultSet rs = dbqMethods.editUsers();
                while (rs.next()) {
                    uname = rs.getString("uname");
                    fname = rs.getString("fname");
                    lname = rs.getString("lname");
                    password = rs.getString("passwd");
                     birthday = rs.getString("birthday");
                      email = rs.getString("email");
                       job = rs.getString("job");
                        address = rs.getString("address");
                         interests = rs.getString("interests");
                        
                    int id = rs.getInt("id");
                    //out.print(id + "uid");
                    s = "/souQ/admin/jsp/removeUser.jsp?userid=" + id;
                    s2 = "/souQ/admin/jsp/editInfoUser.jsp?userid=" + id;
                    s3 = "/souQ/admin/jsp/viewHistory.jsp?userid=" + id;
            %> 
            <tr>  
  <td><%=id%></td>
   <td><%=fname%></td>
   <td><%=lname%></td>
   <td><%=uname%></td>
   <td><%=password%></td>
   <td><%=birthday%></td>
   <td><%=email%></td>
   <td><%=job%></td>
   <td><%=address%></td>
     
   <td><%=interests%></td>

   <td> <a href=<%=s%>><img src="../../imgs/delete.png"> </a></td>
   <td> <a href=<%=s3%>>History </a></td>
       <form  action=<%=s2%> method="post" > 
           <tr>
             <td><input type="text" name="balance" /></td>
             <td> <input type="submit" name="submit" value="Update balance"/></td>
            </tr> 
        </form>
            </tr>
            <%
                }
            %>

      
           

        </tbody>
    </table>

</div>
<%@include file="../html/footer.html" %>