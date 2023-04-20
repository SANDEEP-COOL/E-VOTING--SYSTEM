
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    System.out.println("jsp me aaya");
//    servlet se data get karne ke liye hum request.getAttribute("key") ka use karte hai... 
    boolean result = (boolean) request.getAttribute("result");
    System.out.println("result jsp = "+result);
    boolean userFound = (boolean) request.getAttribute("userFound");
    System.out.println("userFound jsp = "+userFound);
//    kya userFound ki value true hai...
    if(userFound == true) {
//        agar user hume pehle se exist ni karta hai to... 
        out.println("uap");
        System.out.println("uap");
    }
    else if(result == true) {
//        agar user pehle se exist nahi karta hai aur uska registration bhi ho gaya hai... 
        out.println("success");
        System.out.println("succes");
    }
    else{
//        registration falied any reason can be there in backend... 
        out.println("failed");
        System.out.println("failed");
    }
%>
