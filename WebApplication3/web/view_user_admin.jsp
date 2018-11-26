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
                    <h1>Medicines Details</h1>
                </td>
                
            </tr>
            
        </table>
        <table align="center" border="0">
            <tr>
                <td>
                    <form action="add_product_admin.jsp">
                        <input type="submit" value="Add Product Details">
                    </form> 
                </td>
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
        PreparedStatement pst = conn.prepareStatement("select * from medicine_user");
        ResultSet rs = pst.executeQuery();
        %>
        <form name="something" action="view_products.jsp" method="post">
        <table border="1" align="center" cellpadding="5" cellspacing="2">
            <tr>
                <th>Sl No</th>
                
                <th>User Name</th>                
                <th>Email</th>
                
                
            </tr>
        <%
        int count=1;
        while(rs.next())
        {
        
        %>
        
        
            
            <tr>
                <td><%=count %></td>
                <td><%=rs.getString("user_name") %></td>                
                <td><%=rs.getString("email") %></td>
                
              
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



