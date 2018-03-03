<%-- 
    Document   : cartPagenew
    Created on : Feb 28, 2018, 6:36:42 PM
    Author     : Raghda
--%>

<%@page import="dataBaseFunction.dbMethods"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <%  dbMethods.connectToDatabase();
        
        
        dbMethods.getProductInfoById(id);
        
        
        
        
        
    } %>
        
        
        <h1>Hello World!</h1>
    </body>
</html>
