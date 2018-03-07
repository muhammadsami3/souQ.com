<%-- 

    Author     : Rouen Antar <rouen49@gmail.com>
--%>


<%@page import="java.sql.ResultSet"%>
<%@page import="dataBaseFunction.dbMethods"%>
<%!String fname, lname, uname, password ;%>
<%!Float balance;%>
<%!int id;%>


   
<div class="center">
<table class="center" >
    
       
    <tbody>
        <input type="text" name="balance" />
        <tr>
          <td>id</td>  
          <td>First Name </td>
         <td>Last Name </td>
         <td>User Name</td>
           <td>Password</td>
        </tr>
        <% 
    dbMethods.connectToDatabase();
    ResultSet rs=dbMethods.editUsers();
    while(rs.next()){
     uname=rs.getString("uname");
     fname=rs.getString("fname");
     lname=rs.getString("lname");
     password=rs.getString("passwd");
     int id=rs.getInt("id");
     out.print(id+"uid");
     String s="/souQ/admin/jsp/removeUser.jsp?userid="+id;
     String s2="/souQ/admin/jsp/editInfoUser.jsp?userid="+id+",balance="+balance;
   %> 
      <tr>  
          <td><%=id%></td>
          <td><%=fname%></td>
          
          
           
            <td><%=lname%></td>
            
       
            
            <td><%=uname%></td>
            
       
          
            <td><%=password%></td>
            <td> <a href=<%=s%>><img src="../../imgs/delete.png"> </a></td>
          <td><a href=<%=s2%>> <img src="../../imgs/edit.png"> </a></td> 
          
        </tr>
<!--        <tr>
            <td>Balance</td>
            <td><!%=balance%></td>
          
        </tr>
        -->

    
       
<%                
}
%>
        

    </tbody>
</table>
 </div>
