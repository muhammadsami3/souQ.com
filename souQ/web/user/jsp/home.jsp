<%-- 
    Document   : home
    Created on : Feb 27, 2018, 5:33:18 AM
    Author     : maryam
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="servlets.usersServlets.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<%@include file="../html/sidebar.html" %>
<%! ResultSet rs;
    String path; %>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Home Page</title>
</head>
<body>
<!-- Main content: shift it to the right by 250 pixels when the sidebar is visible -->
<div class="w3-main" style="margin-left:250px"> 
    <div class="w3-row w3-padding-64">


<%
    Connection conn = DBConnector.getConnection();
    Statement stmt = conn.createStatement();
    String queryString = new String("select * from home_page where id<4");
    rs = stmt.executeQuery(queryString);
%>
      <div class="w3-twothird w3-container">
             <div class="w3-content w3-display-container w3-display-container">
    <%
                 while(rs.next()){
    path=rs.getString(2);
    %>

    <div class="w3-display-container mySlides">
    <img src=<%out.println(path);
               out.flush();%> style="width:100%">
    </div>
    <%}%>
 <button class="w3-button w3-display-left w3-black" onclick="plusDivs(-1)">&#10094;</button>
 <button class="w3-button w3-display-right w3-black" onclick="plusDivs(1)">&#10095;</button>                
            
        
        
       
             </div>

        <script>
        var slideIndex = 1;
        showDivs(slideIndex);
        function plusDivs(n) {
        showDivs(slideIndex += n);
        }
        function showDivs(n) {
        var i;
        var x = document.getElementsByClassName("mySlides");
        if (n > x.length) {slideIndex = 1}    
        if (n < 1) {slideIndex = x.length}
        for (i = 0; i < x.length; i++) {
        x[i].style.display = "none";  
        }
        x[slideIndex-1].style.display = "block";  
        }
        var myIndex = 0;
        carousel();

    function carousel() {
    var i;
    var x = document.getElementsByClassName("mySlides");
    for (i = 0; i < x.length; i++) {
       x[i].style.display = "none";  
    }
    myIndex++;
    if (myIndex > x.length) {myIndex = 1}    
    x[myIndex-1].style.display = "block";  
    setTimeout(carousel, 5000); // Change image every 2 seconds
    }
        </script> 
        <%
         String queryString2 = new String("select * from home_page where id>3 AND id<10");
        rs = stmt.executeQuery(queryString2);
        while (rs.next()) {
            path = rs.getString(2);
        
        %>
        <p class="w3-padding-large w3-padding-64 w3-center ">
            <img src=<%out.print(path);out.flush();%>>
        </p>
<%}%>
 
        </div>

    <div class="w3-third w3-container">
        <% 
          String queryString3 = new String("select * from home_page where id>9");
        rs = stmt.executeQuery(queryString3);
        while (rs.next()) {
            path = rs.getString(2);
        %>
    <p class="w3-padding-large w3-padding-64 w3-center">  
         <img src=<%out.print(path);out.flush();%>>  
    </p>
<%}%>
    </div>
        
    </div>
</div>
