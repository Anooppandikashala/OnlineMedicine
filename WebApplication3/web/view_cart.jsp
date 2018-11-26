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
        
        <script type="text/javascript">
            function refresh() {                         
                 //Refresh page implementation here
                 window.opener.location.reload();
                 //window.close();
             }
        </script>
    </head>
    <body>
        <table align="center" border="0">
            
            <tr>
                <td>
                    <h1>Medicines Cart</h1>
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
                    <form action="view_order.jsp">
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
        PreparedStatement pst = conn.prepareStatement("Select * from cart_details where user_id=?");
        pst.setString(1, String.valueOf(UserDetails.user_id));
        ResultSet rs = pst.executeQuery();
        int totalprice=0;
        %>
        <form name="something" action="checkout_items.jsp" method="post">
        <table border="1" align="center" cellpadding="5" cellspacing="2">
            <tr>
                <th>Sl No</th>
                <th>Medicine Name</th>
                <th>Price</th>
                <th>Count</th>
                
                <th>Total Price</th>
                <th>Check-out Item</th>
            </tr>
        <%
            int count=1;
        while(rs.next())
        {
        %>
        
        
            
            <tr>
                <td><%=count %></td>
                
                <%
                    
                    pst = conn.prepareStatement("Select product_name,price from product_details where product_id=?");
                    pst.setString(1,rs.getString("product_id") );
                    ResultSet rs1 = pst.executeQuery();
                    rs1.next();
                    totalprice=rs1.getInt("price")*rs.getInt("qnty");
                    
                             
                
                %>
                
                <td><%=rs1.getString("product_name") %></td>
                <td><%=rs1.getInt("price") %></td>
                <td><%=rs.getInt("qnty") %></td>
                
                <td><%=totalprice%></td>
                <td><input type="checkbox" name="item" value="<%=rs.getInt("id") %>"></td>
            </tr>
            
        
        
        <%
         count++;          
        }
        %>
        <tr>                
            <td></td><td><input type="submit" name="submit" value="Check-out Items"></td>
                
            </tr>
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

<%
    try{
        /*String username = request.getParameter("username");   
        String password = request.getParameter("password");
        String redirectURL;*/
        
        
        /*PreparedStatement pst = conn.prepareStatement("Select user_name,password from medicine_user where user_name=? and password=?");
        pst.setString(1, username);
        pst.setString(2, password);
        ResultSet rs = pst.executeQuery();                        
        if(rs.next())  {         
           //out.println("Valid login credentials"); 
           redirectURL = "user_show_details.jsp";
           response.sendRedirect(redirectURL);
        }       
        else
           out.println("Invalid login credentials"); */           
   }
   catch(Exception e){ 
       out.println(e);
       out.println("Something went wrong !! Please try again");       
   }      
%>


