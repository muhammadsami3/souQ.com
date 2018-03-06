<%-- 
    Document   : Cars
    Created on : Feb 25, 2018, 11:58:03 PM
    Author     : Raghda
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="dataBaseFunction.dbMethods"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%!
    Integer id;
    dbMethods doQuery = new dbMethods();
    ResultSet rs;
    ResultSet rs2;
   
%>

<html>
    <head>
        <link rel="stylesheet"   type="text/css" href="../css/style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>cars Page</title>
    </head>
    <body>
        
        
          
          <% 
           rs=doQuery.getallProductInfo();
           while (rs.next()) {
                    String tempId = rs.getString("productid");
                    int id = Integer.parseInt(tempId);
                    rs2 = doQuery.getProductInfoById(id);
                    

                    while (rs2.next()) {
                        
          %>
          
          
          <div class="container">
                <div class="center" style="border: 1px solid #c9c4ea;width: 600px;margin-bottom: 2%;">
                   
          
          
          <form action="/souQ/cart">
               <table class="center" style="width: 600px;" >
                   <tr>
                            <th></th>
                            <th><h2><%=rs2.getString("name").toUpperCase()%></h2> </th>

                            <th style="width: 210px;"></th>
                        </tr>
                        
                        <tr>
                            <td></td>
                            <td></td>
                            <td rowspan="4">
              <input type="image" src="../img/<%=rs2.getString("img")%>" width="200" height="150" alt="car" name="car1" value="1">
              
               </td>

                        </tr>
                        <tr>

              <p><%=rs2.getString("description")%></p>
              
              <input type="hidden" name="id" value=<%=rs2.getString("productid")%>>
         <br><br>
            <input type="submit" value="more information">
          </table>
          </form>
          
                   
                </div>
          </div>
    
     
     <%
                    }
                }%>
     
  
 
  
    </body>
</html>
