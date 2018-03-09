<%@include file="header.jsp" %>
<%@include file="../html/sidebar.html" %>
    <head>
        <title>Register & Begin your shopping</title>
    </head>

    <body>
        <div>
            <form method="post" class="w3-padding-64 w3-padding-large"  action="../../Registeration">
                <table align="center">
                    <tr><td>User Name</td></tr
                    <tr><td>
                            <input type="text" name="uname" required>   
                        </td>
                    </tr>
                    <tr><td>First Name</td></tr>
                    <tr><td>
                            <input type="text" name="fname"required>   
                        </td>
                    </tr>
                    <tr><td>Last Name</td></tr>
                    <tr><td>
                            <input type="text" name="lname" required>   
                        </td>
                    </tr>
                    <tr><td>Password</td></tr>
                    <tr><td>
                            <input type="password" name="passwd" required>   
                        </td>
                    </tr>
                    <tr><td>Birthday</td></tr>
                    <tr><td>
                            <input type="text" name="bday" pattern="\d{1,2}/\d{1,2}/\d{4}" placeholder="dd/mm/yyyy" required>   
                        </td>
                    </tr>
                    <tr><td>E-mail</td></tr>
                    <tr><td>
                            <input type="text" name="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" placeholder="example@gmail.com" required>  
                        </td>
                    </tr>
                    <tr><td>Job</td></tr>
                    <tr><td>
                            <input type="text" name="job" required>   
                        </td>
                    </tr>
                    <tr><td>Address</td></tr>
                    <tr><td>
                            <input type="text" name="address" required>   
                        </td>
                    </tr>
                    <tr><td>Interests</td></tr>
                    <tr><td>
                            <input type="text" name="interests" required>   
                        </td>
                    </tr>
                    <tr><td>
                            <input type="submit" class="w3-button w3-black" value="submit"/>
                        </td></tr>
                </table>
            </form>    
        </div>
    </body>
