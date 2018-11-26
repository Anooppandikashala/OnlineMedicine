<%-- 
    Document   : checkout_items
    Created on : 20 Nov, 2018, 8:18:15 AM
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
        <%
        try{
          if (request.getParameter("submit") != null) {
            String item[]= request.getParameterValues("item");
            String qnty[]= request.getParameterValues("qnty");
            
            Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
            Connection conn1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/userdb","root","123456");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/userdb?" + "user=root&password=123456");    
            PreparedStatement pst;
            ResultSet rs;
            int totalprice =0;
            int final_quantity=0;
            int initial_quantity=0;
         
                        
            for(int i=0;i<item.length;i++)
            {
                
                    pst = conn.prepareStatement("Select * from cart_details where id=?");
                    pst.setString(1, item[i]);
                    rs = pst.executeQuery();
                    rs.next();
                    totalprice=0;
                    pst = conn.prepareStatement("Select product_name,price,quantity from product_details where product_id=?");
                    pst.setString(1,rs.getString("product_id") );
                    ResultSet rs1 = pst.executeQuery();
                    rs1.next();
                    initial_quantity = rs1.getInt("quantity");
                    totalprice=rs1.getInt("price")*rs.getInt("qnty");
                    final_quantity = initial_quantity - rs.getInt("qnty");
                    
                    pst = conn.prepareStatement("insert into order_details(product_id,user_id,quantity,price) values(?,?,?,?)");
                    pst.setString(1, rs.getString("product_id") );
                    pst.setString(2, String.valueOf(UserDetails.user_id));
                    pst.setString(3, String.valueOf(rs.getInt("qnty")));
                    pst.setString(4, String.valueOf(totalprice));
                    int status = pst.executeUpdate();
                    
                    pst = conn.prepareStatement("DELETE FROM cart_details WHERE id=?");
                    pst.setString(1, item[i]);
                    
                    status = pst.executeUpdate();
                    
                    if(status > 0)
                    {
                        pst = conn.prepareStatement("UPDATE product_details SET quantity=? WHERE product_id=?");
                        pst.setString(1,String.valueOf(final_quantity) );
                        pst.setString(2, rs.getString("product_id") );
                        int u = pst.executeUpdate();
                        String redirectURL = "view_order.jsp";
                        response.sendRedirect(redirectURL);
                    }
                    
                
                
            }
            
        }
          
          
          
    }   
   catch(Exception e){ 
       out.println(e);
       out.println("Something went wrong !! Please try again");       
   }      
%>
    </body>
</html>
