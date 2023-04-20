
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    
//    ye data LoginControllerServlet se aa raha hai... 
    String result = (String) request.getAttribute("result");
    String userid = (String) request.getAttribute("userid");
    String url = "";
    
//    ab hum controll ko VotingControllerServlet ya phir RegistrationControllerServlet me to tabhi bhejenge na jab ye condition true ho... 
    if(userid != null && result != null){
//        means user ne login kar liya hai... 
        HttpSession sess = request.getSession();
        sess.setAttribute("userid", userid);
        
        if(result.equalsIgnoreCase("admin")){
//            ab hume url banana hai...
            url = "AdminControllerServlet;jsessionid="+sess.getId();
        }
        else{
            url = "VotingControllerServlet;jsessionid="+sess.getId();
        }
        
        out.println(url);
    }
    else{
        out.println("error");
    }
%>