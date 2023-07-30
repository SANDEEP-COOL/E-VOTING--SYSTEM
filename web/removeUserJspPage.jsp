<%-- 
    Document   : removeUserJspPage
    Created on : 16 Apr, 2023, 9:13:12 PM
    Author     : sande
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
    </head>
    <body>
        
        <%
            ArrayList<String> candidateids = (ArrayList)request.getAttribute("candidateids");
            StringBuffer sf = new StringBuffer();
            sf.append("<select style='width: 80%' class='form-select bg-dark text-light' id='myselect' value='Choose Id Here' aria-label='Default Select Example'>"
            + "<option selected>Choose Id Here</option>");
            for(String id : candidateids){
                sf.append("<option class='bg-dark text-light'>"+id+"</option>");
            }
//            out.println(sf);
            
        %>
        <%=sf%>
        
<%
//    ArrayList<String> candidateids = (ArrayList)request.getAttribute("candidateids");
//    System.out.println(candidateids);
//    StringBuffer sf = new StringBuffer();
//    sf.append("<select class='border-0 form-select-sm bg-dark text-light' id='myselect' value='Choose Id Here' aria-label='Default Select Example'>"
//            + "<option class='border-0' selected>Choose Id Here</option>");
//    
//    for(String id : candidateids){
//        sf.append("<option class='border-0 bg-dark text-light' value='" + id + "'>" + id + "</option>");
//    }
//    sf.append("</select>");
//    response.setContentType("text/html");
//    response.getWriter().write(sf.toString());
%>
    </body>
</html>



