<%-- 
    Document   : view_products
    Created on : 19 Nov, 2018, 9:20:32 PM
    Author     : anoop
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                    <h1>Ordered Medicines</h1>
                </td>
                
            </tr>
            
        </table>
        <table align="center" border="0">
            <tr>
                <td>
                    <form action="user_show_details.jsp">
                        <input type="submit" value="Home">
                    </form>
                </td>
                <td>
                    <form action="view_products.jsp">
                        <input type="submit" value="View Product">
                    </form> 
                </td>
                <td>
                    <form action="view_cart.jsp">
                        <input type="submit" value="View Cart">
                    </form>
                </td>
                <td>
                    <form action="logout.jsp">
                        <input type="submit" value="Logout">
                    </form>
                </td>
                
            </tr>    
                    
        </table>
        
<%@ page import ="java.sql.*" %>
<%
    
    
    
    
    
    try{
        String username = request.getParameter("username");   
        String password = request.getParameter("password");
        String redirectURL;
        Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
        Connection conn1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/userdb","root","123456");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/userdb?" + "user=root&password=123456");    
        PreparedStatement pst = conn.prepareStatement("Select * from order_details where user_id=?");
        pst.setString(1, String.valueOf(UserDetails.user_id));
        ResultSet rs = pst.executeQuery();
        %>
        <form name="something" action="view_products.jsp" method="post">
        <table border="1" align="center" cellpadding="5" cellspacing="2">
            <tr>
                <th>Sl No</th>
                <th>Medicine Name</th>
                
                                
                <th>Count</th>
                <th>Price</th>
                
            </tr>
        <%
        int count=1;
        while(rs.next())
        {
        
        %>
        
        
            
            <tr>
                <td><%=count %></td>
                <%
                pst = conn.prepareStatement("Select product_name from product_details where product_id=?");
                pst.setString(1,rs.getString("product_id") );
                ResultSet rs1 = pst.executeQuery();
                rs1.next();
                %>
                
                <td><%=rs1.getString("product_name") %></td>
                <td><%=rs.getInt("quantity") %></td>
                <td><%=rs.getInt("price") %></td>
              
            </tr>
            
        
        
        <%
         count++;          
        }
        %>
        
        </table>
        </form>
      <%
    }   
   catch(Exception e){ 
       out.println(e);
       out.println("Something went wrong !! Please try again");       
   }      
%>   
    </body>
</html>



