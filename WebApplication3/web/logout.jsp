<%@page import="bean.UserDetails"%>
<%
    
    UserDetails.user_id = 0;
    UserDetails.admin_id = 0;
    
    String redirectURL = "index.jsp";
    response.sendRedirect(redirectURL);
    




%>