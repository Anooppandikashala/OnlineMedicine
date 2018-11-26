<%-- 
    Document   : register
    Created on : 18 Nov, 2018, 11:24:56 PM
    Author     : anoop
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%@page import="bean.UserDetails"%>  
<jsp:useBean id="obj" class="bean.UserDetails"/>  
      
<jsp:setProperty property="*" name="obj"/> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <table align="center" border="0">
            
            <tr>
                <td>
                    <h1>Add Products Here</h1>
                </td>
                
            </tr>
            
        </table>
        <table align="center" border="0">
            <tr>
                
                <td>
                    <form action="view_product_admin.jsp">
                        <input type="submit" value="View Product">
                    </form> 
                </td>
                <td>
                    <form action="view_order_admin.jsp">
                        <input type="submit" value="View Order">
                    </form>
                </td>
                <td>
                    <form action="view_user_admin.jsp">
                        <input type="submit" value="View Users Details">
                    </form>
                </td>
                <td>
                    <form action="logout.jsp">
                        <input type="submit" value="Logout">
                    </form>
                </td>
            </tr>    
                    
        </table>
        <form action="add_product_admin.jsp" method="post">
            <center>
            <table border="1" cellpadding="5" cellspacing="2">
                <thead>
                    <tr>
                        <th colspan="2">Enter Product Details Here</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Medicine Name</td>
                        <td><input type="text" name="mname" placeholder="Medicine Name..." required/></td>
                    </tr>
                    <tr>
                        <td>Price</td>
                        <td><input type="text" name="price"  placeholder="Price..." required /></td>
                    </tr>
                    <tr>
                        <td>Quantity</td>
                        <td><input type="text" name="qnty"  placeholder="Quantity..." required/></td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center"><input name="submit" type="submit" value="Add item" />
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
                String mname = request.getParameter("mname");   
                String price = request.getParameter("price");
                String qnty = request.getParameter("qnty");

                Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
                Connection conn1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/userdb","root","123456");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/userdb?" + "user=root&password=123456");    
                PreparedStatement pst = conn.prepareStatement("insert into product_details (product_name,price,quantity) values(?,?,?)");
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


