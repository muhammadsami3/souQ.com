
<%!String pname, cost, cat, amount, desc;%>

<% pname = (String) session.getAttribute("pname");
    cost = (String) session.getAttribute("cost");
    cat = (String) session.getAttribute("cat");
    amount = (String) session.getAttribute("amount");
    desc = (String) session.getAttribute("desc");
%>
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
                <img src="../../imgs/Lam1_trans_NvBQzQNjv4BqnAdySV0BR-4fDN_-_p756cVfcy8zLGPV4EhRkjQy7tg.jpg" width="200" height="150" alt="Lam1_trans_NvBQzQNjv4BqnAdySV0BR-4fDN_-_p756cVfcy8zLGPV4EhRkjQy7tg"/>

            </td>
            
        </tr>
        <tr>
            <td>Cost/Item</td>
            <td><%=cost%></td>
            
        </tr>
        <tr>
            <td>Amount</td>
            <td><%=amount%></td>
            
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