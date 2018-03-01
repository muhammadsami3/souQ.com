<%-- 
    Document   : Cars
    Created on : Feb 25, 2018, 11:58:03 PM
    Author     : Raghda
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet"   type="text/css" href="../css/style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>cars Page</title>
    </head>
    <body>
         <div id="wrapper">
    <section>

    <ul id="gallery">
      <li>
        
          <form action="/souQ/cart">
              <input type="image" src="../img/car1.jpg" alt="car1" width="100" height="100" name="car1" value="1">
              <input type="hidden" name="id" value="1">
         <br><br>
            <input type="submit" value="Add to cart">
          </form>
          
     </li>
     
     <li>  
         <form action="/souQ/cart">
             
             <input type="image" src="../img/car2.jpg" alt="car1" width="100" height="100" name="car2" value="2">
             <input type="hidden" name="id" value="2">
         <br><br>
            <input type="submit" value="Add to cart">
        </form>
     </li>
     
   </ul>
  </div>
     </section>
    </body>
</html>
