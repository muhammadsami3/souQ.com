<%-- 
    Document   : userProfile
    Created on : Feb 27, 2018, 4:47:47 AM
    Author     : maryam
--%>

<%@page import="java.lang.String"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    out.flush();
//    RequestDispatcher r1 = request.getRequestDispatcher("../../html/usersHTML/header.html");
    RequestDispatcher r1 = request.getRequestDispatcher("header.jsp");    
    r1.include(request, response);
    out.flush();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/
                                     css/font-awesome.min.css">
       
        <!--        <link rel="stylesheet" href="../../css/style2.css">    -->
        <title><%out.println((String) session.getAttribute("uname"));%></title>
    </head>
    <body>
        <%  int id = (Integer) session.getAttribute("Id");
            String uname = (String) session.getAttribute("uname");
            String fname = (String) session.getAttribute("fname");
            String lname = (String) session.getAttribute("lname");
            String passwd = (String) session.getAttribute("passwd");
            String birthday = (String) session.getAttribute("birthday");
            String email = (String) session.getAttribute("email");
            String job = (String) session.getAttribute("job");
            String address = (String) session.getAttribute("address");
            String interests = (String) session.getAttribute("interests");
            Double credit = (Double) session.getAttribute("credit");
            out.flush();
            String s = uname + "\n" + fname + "\n" + lname + "\n" + birthday + "\n" + email + "\n";
        %> 
        <!-- Sidebar -->
        <nav class="w3-sidebar w3-bar-block w3-collapse w3-large w3-theme-l5 w3-animate-left" id="mySidebar">
            <a href="javascript:void(0)" onclick="w3_close()" class="w3-right w3-xlarge w3-padding-large w3-hover-black w3-hide-large" title="Close Menu">
                <i class="fa fa-remove"></i>
            </a>
            <h4 class="w3-bar-item"><b>Categories</b></h4>
            <a class="w3-bar-item w3-button w3-hover-black" href="#">Watches</a>
            <a class="w3-bar-item w3-button w3-hover-black" href="#">Perfumes</a>
            <h4><a class="w3-bar-item w3-button w3-hover-black" href="logout.jsp"><b>Logout</b><a></h4>

        </nav>
        <div class="w3-main" style="margin-left:250px">
            <div class="w3-row">
                <br><br>
              <div class="w3-twothird w3-container">
              <h6 class="w3-text-teal">
                  <a href="editProfile.jsp"><i style="font-size:24px" class="fa">&#xf044;</i></a>
               Edit Profile</h6>
               <i class="fa fa-user" style="font-size:48px;"></i> 
              </div>
        </div>

              <div class="w3-row">
                                <div class="w3-twothird w3-container">
                                    <h4 class="w3-text-teal">User Name</h4>
                                    <p><% out.println(uname);
                                        out.flush();
                                        %>                    
                                    </p>
                                </div>
                            </div>
             <div class="w3-row">
                                <div class="w3-twothird w3-container">
                                    <h4 class="w3-text-teal">First Name</h4>
                                    <p><% out.println(fname);
                                        out.flush();
                                        %>                    
                                    </p>
                                </div>
                            </div>                        
              
             <div class="w3-row">
                                <div class="w3-twothird w3-container">
                                    <h4 class="w3-text-teal">Last Name</h4>
                                    <p><% out.println(lname);
                                        out.flush();
                                        %>                    
                                    </p>
                                </div>
                            </div>                        
              <div class="w3-row">
                                <div class="w3-twothird w3-container">
                                    <h4 class="w3-text-teal">E-mail</h4>
                                    <p><% out.println(email);
                                        out.flush();
                                        %>                    
                                    </p>
                                </div>
                            </div>

                            <div class="w3-row">
                                <div class="w3-twothird w3-container">
                                    <h4 class="w3-text-teal">Birthday</h4>
                                    <p><% out.println(birthday);
                                        out.flush();
                                        %>     
                                    </p>
                                </div>
                                <!--                <div class="w3-third w3-container">
                                                    <p class="w3-border w3-padding-large w3-padding-32 w3-center">AD</p>
                                                    <p class="w3-border w3-padding-large w3-padding-64 w3-center">AD</p>
                                                </div>-->
                            </div>
                            <div class="w3-row">
                                <div class="w3-twothird w3-container">
                                    <h4 class="w3-text-teal">Job</h4>
                                    <p><% out.println(job);
                                        out.flush();
                                        %>                    
                                    </p>
                                </div>
                                <div class="w3-row">
                                    <div class="w3-twothird w3-container">
                                        <h4 class="w3-text-teal">Interests</h4>
                                        <p><% out.println(interests);
                                            out.flush();
                                            %>                    
                                        </p>
                                    </div>
                                 <div class="w3-row">
                                    <div class="w3-twothird w3-container">
                                        <h4 class="w3-text-teal">Credit Points</h4>
                                        <p><% out.println(credit);
                                            out.flush();
                                            %>                    
                                        </p>
                                    </div>
                                 
                                    </body>
                                    </html>
