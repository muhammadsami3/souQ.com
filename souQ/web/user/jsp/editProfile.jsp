<%-- 
    Document   : editProfile
    Created on : Mar 3, 2018, 7:36:29 AM
    Author     : maryam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<%@include file="../html/sidebar.html" %>
<%
int id = (Integer) session.getAttribute("Id");
        String uname1 = (String) session.getAttribute("uname");
        String fname = (String) session.getAttribute("fname");
        String lname = (String) session.getAttribute("lname");
        String passwd = (String) session.getAttribute("passwd");
        String birthday = (String) session.getAttribute("birthday");
        String email = (String) session.getAttribute("email");
        String job = (String) session.getAttribute("job");
        String address = (String) session.getAttribute("address");
        String interests = (String) session.getAttribute("interests");
        String s =uname + "\n" + fname + "\n" + lname + "\n" + birthday + "\n" + email + "\n";
//        out.println(s);
//        out.flush();
 %> 
 
 <head>
        <title>Edit Profile</title>
    </head>
    <body>
        <div class="container w3-row w3-padding-64 w3-padding-large">
               <form method="post" action="../../editProfile">
                <table align="center">
                    <tr><td>User Name</td></tr>
                    <tr><td>
                            <input type="text" name="uname" value=<%out.println(uname1);
                                                                        out.flush();%> >
                        </td>
                    </tr>
                    <tr><td>First Name</td></tr>
                    <tr><td>
                            <input type="text" name="fname" value=<%out.println(fname);
                                                                        out.flush();%> >
                        </td>
                    </tr>
                    <tr><td>Last Name</td></tr>
                    <tr><td>
                            <input type="text" name="lname" value=<%out.println(lname);
                                                                        out.flush();%> >
                        </td>
                    </tr>
                   
                    <tr><td>Birthday</td></tr>
                    <tr><td>
                            <input type="text" name="bday" pattern="\d{1,2}/\d{1,2}/\d{4}" placeholder="dd/mm/yyyy"  
                             value=<%out.println(birthday);
                                     out.flush();%> >       
                        </td>
                    </tr>
                    <tr><td>E-mail</td></tr>                    
                      <tr><td>
                            <input type="text" name="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" 
                                   placeholder="example@gmail.com" value=<%out.println(email);
                                                                           out.flush();%>> 
                        </td>
                    </tr>
                    <tr><td>Job</td></tr>
                    <tr><td>
                            <input type="text" name="job" value=<%out.println(job);
                                                            out.flush();%> >  
                        </td>
                    </tr>
                    <tr><td>Address</td></tr>
                    <tr><td>
                           <input type="text" name="address" value=<%out.println(address);
                                                               out.flush();%>>
                      </td>
                    </tr>
        <tr><td>Interests</td></tr>
            <tr><td>
        <input type="text" name="interests" value=<%out.println(interests);
                                              out.flush();%>> 
                        </td>
                  </tr>
                   <tr><td>
                           <input type="submit" class="w3-black" value="submit"/>
                       </td></tr>
              </table>
               </form>
                        </div>
    </body>