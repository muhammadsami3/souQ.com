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
    RequestDispatcher r1 = request.getRequestDispatcher("../../html/usersHTML/header.html");
    r1.include(request, response);
    out.flush();
%>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Home Page</title>
</head>
<body>

    <!-- Sidebar -->
    <nav class="w3-sidebar w3-bar-block w3-collapse w3-large w3-theme-l5 w3-animate-left" id="mySidebar">
        <a href="javascript:void(0)" onclick="w3_close()" class="w3-right w3-xlarge w3-padding-large w3-hover-black w3-hide-large" title="Close Menu">
            <i class="fa fa-remove"></i>
        </a>
        <h4 class="w3-bar-item"><b>Categories</b></h4>
        <a class="w3-bar-item w3-button w3-hover-black" href="#">Watches</a>
        <a class="w3-bar-item w3-button w3-hover-black" href="#">Perfumes</a>
        <h4><a class="w3-bar- w3-button w3-hover-black" href="#"><b>Contact Us</b></a></h4>
        <h4><a class="w3-bar-item w3-button w3-hover-black" href="logout.jsp"><b>Logout</b><a></h4>
    </nav>

    <!-- Overlay effect when opening sidebar on small screens -->
    <div class="w3-overlay w3-hide-large" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

    <!-- Main content: shift it to the right by 250 pixels when the sidebar is visible -->
<div class="w3-main" style="margin-left:250px"> 
    <div class="w3-row w3-padding-64">
        <div class="search-container" style="margin-left:750px">
            <form action="#">
            <input type="text" placeholder="Search.." name="search">
            <button type="submit"><i class="fa fa-search w3-bar-item"></i></button>
            </form>    
        </div>  
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
