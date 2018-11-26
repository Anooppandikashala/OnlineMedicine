<%-- 
    Document   : registration_process
    Created on : 18 Nov, 2018, 11:31:50 PM
    Author     : anoop
--%>

    <%@page import="bean.RegisterDao"%>  
    <jsp:useBean id="obj" class="bean.User"/>
    <%@ page import ="java.sql.*" %>
      
    <jsp:setProperty property="*" name="obj"/>  
      
    <%  
    int status=RegisterDao.register(obj); 
    String redirectURL="";
    if(status>0)  
        redirectURL = "index.jsp";
        response.sendRedirect(redirectURL); 
      
    %>  
