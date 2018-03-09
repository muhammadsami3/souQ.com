<!DOCTYPE html>
<html>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" href="../../imgs/images.png" />

    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

    <link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-black.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!--      <link rel="stylesheet"   type="text/css" href="../../css/style.css">-->

    <style>
        html,body,h1,h2,h3,h4,h5,h6 {font-family: "Roboto", sans-serif;}
        .w3-sidebar {
            z-index: 3;
            width: 250px;
            top: 43px;
            bottom: 0;
            height: inherit;
        }
    </style>
    <body>
<div class="w3-top">
  <div class="w3-bar w3-theme w3-top w3-left-align w3-large">
    <a class="w3-bar-item w3-button w3-right w3-hide-large w3-hover-white w3-large w3-theme-l1" href="javascript:void(0)" onclick="w3_open()"><i class="fa fa-bars"></i></a>
    <a id="reg" href="../../CheckSessionStatus2" class="w3-bar-item w3-button w3-hide-small w3-hide-medium w3-hover-white">Register</a>
    <a id="login" href="../../CheckSessionStatus" class="w3-bar-item w3-button w3-hide-small w3-hover-white">Login</a>
    <a href="../../user/jsp/home.jsp" class="w3-bar-item w3-button w3-hide-small w3-hide-medium w3-hover-white">Home</a>
    <a href="../../CheckSessionStatus3" class="w3-bar-item w3-button w3-hide-small w3-hide-medium w3-hover-white">
        <%  
        String uname=(String)session.getAttribute("uname");
        if(uname!=null)
        {
         out.flush();
         out.print(uname);
         out.flush();     
        }
        else
        {
         out.print("Profile");
         out.flush();
        }
        %></a>
    <a href="/souQ/user/jsp/checkOutPage.jsp" class="w3-bar-item w3-button w3-hide-small w3-hide-medium w3-hover-white">
    <i style="font-size:24px" class="fa">&#xf07a;</i></a>
    <form method="get" action="search.jsp" style="background-color: black;">
    <input type="text"  placeholder="Search.." name="search"  class="w3-bar-item w3-button w3-hide-small w3-hide-medium w3-hover-white" style="margin-left:500px">
<button  id="submitButton" class="w3-button" style="border-color: transparent">
     <i class="fa fa-search"></i>
     </button>
  
    </form>      
  </div>
 
</div>
