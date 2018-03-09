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
<%
    Connection conn = DBConnector.getConnection();
    Statement stmt = conn.createStatement();
    String queryString = new String("select * from home_page");
    ResultSet rs = stmt.executeQuery(queryString);
    rs.next();
    String path=rs.getString(2);
    out.flush();
    RequestDispatcher r1 = request.getRequestDispatcher("header.jsp");
    r1.include(request, response);
    out.flush();
    RequestDispatcher r3 = request.getRequestDispatcher("../html/sidebar.html");
    r3.include(request, response);
%>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Home Page</title>
</head>
<body>
<!-- Main content: shift it to the right by 250 pixels when the sidebar is visible -->
<div class="w3-main" style="margin-left:250px"> 
    <div class="w3-row w3-padding-64">
        <img src=<%out.println(path);out.flush();%> style="width:100%">          
        <div class="w3-twothird w3-container">
             <div class="w3-content w3-display-container w3-display-container">
                <div class="w3-display-container mySlides">
                   <img src=<%rs.next();
                              path=rs.getString(2);
                              out.println(path);
                              out.flush();%> style="width:100%">
                </div>
                <div class="w3-display-container mySlides">
                    <img src=<%rs.next();
                              path=rs.getString(2);
                              out.println(path);
                              out.flush();%> style="width:100%">
                </div>
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
        </script> 
        <p class="w3-padding-large w3-padding-64 w3-center">
            <img src=<%rs.next();
                              path=rs.getString(2);
                              out.println(path);
                              out.flush();%>style="width:100%">
         </p> 
        <p class="w3-padding-large w3-padding-64 w3-center">
            <img src=<%rs.next();
                              path=rs.getString(2);
                              out.println(path);
                              out.flush();%> style="width:100%">
         </p>
        </div>
     <div class="w3-third w3-container">
         <p class="w3-padding-large w3-padding-32 w3-center">
             <img src=<%rs.next();
                              path=rs.getString(2);
                              out.println(path);
                              out.flush();%>" style="width:100%">   
         </p>
         <p class="w3-padding-large w3-padding-32 w3-center">
             <img src=<%rs.next();
                              path=rs.getString(2);
                              out.println(path);
                              out.flush();%> style="width:100%">
         </p>
         <p class="w3-padding-large w3-padding-32 w3-center">
             <img src=<%rs.next();
                              path=rs.getString(2);
                              out.println(path);
                              out.flush();%> style="width:100%">   
         </p>
        
         <p class="w3-padding-large w3-padding-32 w3-center">
             <img src=<%rs.next();
                              path=rs.getString(2);
                              out.println(path);
                              out.flush();%> style="width:100%">   
             
         </p>
         <p class="w3-padding-large w3-padding-32 w3-center">
             <img src=<%rs.next();
                              path=rs.getString(2);
                              out.println(path);
                              out.flush();%> style="width:100%">   
             
         </p>         

    </div>
        
    </div>
</div>
</body>
</html>
