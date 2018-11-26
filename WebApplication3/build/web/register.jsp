<%-- 
    Document   : register
    Created on : 18 Nov, 2018, 11:24:56 PM
    Author     : anoop
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import ="java.sql.*" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <table align="center" border="0">
            
            <tr>
                <td>
                    <h1>Register Here</h1>
                </td>
                
            </tr>
            
        </table>
        <form action="register.jsp" method="post">
            <center>
            <table border="1" cellpadding="5" cellspacing="2">
                <thead>
                    <tr>
                        <th colspan="2">User Register Here</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Username</td>
                        <td><input type="text" name="uname" placeholder="Name..." required/></td>
                    </tr>
                    <tr>
                        <td>Email</td>
                        <td><input type="text" name="uemail"  placeholder="Email ID..." required /></td>
                    </tr>
                    <tr>
                        <td>Password</td>
                        <td><input type="password" name="upass"  placeholder="Password..." required/></td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center"><input type="submit" name="submit"  value="Register" />
                            &nbsp;&nbsp;
                            <input type="reset" value="Reset" />
                        </td>                        
                    </tr>                    
                </tbody>
            </table>
            </center>
        </form>
        
        <%
        if (request.getParameter("submit") != null) {
           try{ 
                String mname = request.getParameter("uname");   
                String price = request.getParameter("uemail");
                String qnty = request.getParameter("upass");

                Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
                Connection conn1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/userdb","root","123456");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/userdb?" + "user=root&password=123456");    
                PreparedStatement pst = conn.prepareStatement("insert into medicine_user (user_name,email,password) values(?,?,?)");
                pst.setString(1, mname);
                pst.setString(2, price);
                pst.setString(3, qnty);
                int rs = pst.executeUpdate();
                if(rs >0){
                    out.println("<h4 align=center>Successfully Added</h4>");
                }
                else{                    
                    out.println("<h4 align=center>Error Occured</h4>");
                }
            
           }
           catch(Exception e)
           {
                out.println(e);
                out.println("Something went wrong !! Please try again"); 
           }
            
            
            
            
        }   
    %>
             
            
          
             
              
  
        
    </body>
</html>

