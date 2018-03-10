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
        <link rel="stylesheet"   type="text/css" href="../css/style3.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>cars Page</title>
    </head>
    <body>
        
        <div id="wrapper">
                <section>
                    <ul id="gallery">
          
          <%  String category = request.getParameter("c");
          session.setAttribute("category", category);
           rs=doQuery.getallProductInfo(category);
           while (rs.next()) {
                    String tempId = rs.getString("productid");
                    int id = Integer.parseInt(tempId);
                    rs2 = doQuery.getProductInfoById(id);
                    while (rs2.next()) {
                        
          %>
          
      <li>
          <form  action="/souQ/cart">
                   <h2><%=rs2.getString("name").toUpperCase()%></h2>  
          <br><br>
  
              <input id="img" type="image" src="../img/<%=rs2.getString("img")%>" width="200" height="150" alt="car" name="car1" value="1">
    
              <br>
              <p><%=rs2.getString("description")%></p>
              
              <input type="hidden" name="id" value=<%=rs2.getString("productid")%> >
         <br><br>
         
         
     
            <input id="btn" type="submit" value="Read more">
          </form>
          
      </li>       
               
     <%
                    }
                }%>
     
  
                </ul>
  </section>
          </div>
    </body>
</html>
