<%-- 
    Document   : login
    Created on : Feb 27, 2018, 4:55:46 AM
    Author     : maryam
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<%@include file="../html/sidebar.html" %>

<head>
    
<title>Log in</title>     
</head>
<body>
        <div class="container w3-row w3-padding-64 w3-padding-large">
            <form method="post" action="../../LoginValidation">
                <table align="center" class="w3-table" style="margin-left: 500px">
                    <tr><td>User Name</td></tr>
                    <tr><td>
                            <input type="text"  name="uname" required>   
                        </td>
                    </tr>
                    <tr><td>Password</td></tr>
                    <tr><td>
                            <input type="password" name="passwd" required>   
                        </td>
                    </tr>
                    <tr><td>
                   
                    <input type="submit" class="w3-button w3-black" value="submit"/>  
                    </form>
            <form method="post" style="margin-top: 20px" action="registration.jsp">
                     <input type="submit" class="w3-button w3-black"  value="Sign Up"/>
                     </form>
                     </td>
                   </tr>  
                   </table>
            
                 
             </div>
</body>