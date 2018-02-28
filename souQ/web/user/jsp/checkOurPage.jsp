<%-- 
    Document   : checkOurPage
    Created on : Feb 28, 2018, 9:17:56 PM
    Author     : Muhammad Sami
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%!String pname, cost, cat, amount, desc, img;
    Integer id;
%>

<% pname = (String) session.getAttribute("pname");
    cost = (String) session.getAttribute("cost");
    cat = (String) session.getAttribute("cat");
    amount = (String) session.getAttribute("amount");
    desc = (String) session.getAttribute("desc");
    img = (String) session.getAttribute("img");
//    id = (Integer) session.getAttribute("id");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SouQ.com</title>
    </head>
    <body>
        <div>
            <form action="/souQ/CheckOut">
                <div class="center">
                    <table class="center" >

                        <tr>
                            <th>Product</th>
                            <th></th>
                            <th>Image</th>
                        </tr>

                        <tbody>
                            <tr>
                                <td>Name</td>
                                <td><%=pname%></td>
                                <td rowspan="4">
                                    <img src="../../imgs/<%=img%>" width="200" height="150" alt="Lam1_trans_NvBQzQNjv4BqnAdySV0BR-4fDN_-_p756cVfcy8zLGPV4EhRkjQy7tg"/>

                                </td>

                            </tr>
                            <tr>
                                <td>Cost/Item</td>
                                <td><%=cost%></td>

                            </tr>
                            <tr>
                                <td>Amount</td>
                                <td>
                                    <select name="qyn">
                                        <% for (int i = 1; i <= Integer.parseInt(amount); i++) {%>
                                        <option><%=i%></option>
                                        <%}%>                        
                                    </select>

                                </td>

                            </tr>
                            <tr>
                                <td>Cat</td>
                                <td><%=cat%></td>

                            </tr>
                        </tbody>
                    </table>
                    <div class="center">
                        <%=desc%>

                    </div>       
                </div>
                        <div>
                <input type="submit"/>

            </div>
            </form>


            
        </div>
    </body>
</html>
