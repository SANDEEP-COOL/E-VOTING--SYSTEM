<%-- 
    Document   : showException
    Created on : 23 Mar, 2023, 6:47:38 PM
    Author     : sande
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    
//    jsp page me servlet se ek data pass kiya gaya tha use get karne hai... 
    Exception ex = (Exception)request.getAttribute("exception");
    
    System.out.println("Exception is : "+ex);
    out.println("some exception occured! in database");
%>
