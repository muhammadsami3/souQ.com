<%-- 
    Document   : search
    Created on : Mar 9, 2018, 10:11:09 AM
    Author     : maryam - Raghda
--%>


<%@page import="dataBaseFunction.dbMethods"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="servlets.usersServlets.DBConnector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>

<html>
    <head>
        <link rel="stylesheet"   type="text/css" href="../css/style3.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>search Page</title>
    </head>

<body>
    
    <br>
    <br>
        
        <div id="wrapper">
                <section>
                    <ul id="gallery">
<%!String   name,description, img, product ;
   int  price, quantity ;
   dbMethods doQuery = new dbMethods();
    ResultSet rs;
    ResultSet rs2;
    String s;
     int p;
%>
        <%--
    RequestDispatcher r3 = request.getRequestDispatcher("../html/sidebar.html");
    r3.include(request, response)--%>
    

    
    <%
       doQuery.connectToDatabase(); 
       try {
    s=request.getParameter("search");
    p = Integer.parseInt(s);
   
           rs=doQuery.search(s,p);
       }
       
       catch (NumberFormatException nfe)
    {   p=0;
      System.out.println("NumberFormatException: " + nfe.getMessage());
    }
        rs=doQuery.search(s,p);
       while (rs.next()) {
                    String tempId = rs.getString("productid");
                    int id = Integer.parseInt(tempId);
                    rs2 = doQuery.getProductInfoById(id);
                    while (rs2.next()) {

           
    %>
 
 <li>
          <form>
                   <h2><%=rs2.getString("name").toUpperCase()%></h2>  
          <br><br>
  
              <input id="img" type="image" src="../img/<%=rs2.getString("img")%>" width="200" height="150" alt="car" name="car1" value="1">
    
              <br>
              <p><%=rs2.getString("description")%></p>
              
              <input type="hidden" name="id" value=<%=rs2.getString("productid")%> >
         <br><br>
         
        
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
