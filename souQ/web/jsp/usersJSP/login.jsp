<%-- 
    Document   : login
    Created on : Feb 27, 2018, 4:55:46 AM
    Author     : maryam
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Log in</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../../css/style2.css">    

    </head>
    <body>
        <div>
            <form method="post" action="loginValidation.jsp">
                <table align="center">
                    <tr><td>User Name</td></tr>
                    <tr><td>
                            <input type="text" name="uname" required>   
                        </td>
                    </tr>
                    <tr><td>Password</td></tr>
                    <tr><td>
                            <input type="password" name="passwd" required>   
                        </td>
                    </tr>
                    <tr><td>
                            <input type="submit" value="submit"/>
                        </td></tr>
                </table>
            </form>
        </div>
        </body>
</html>
 