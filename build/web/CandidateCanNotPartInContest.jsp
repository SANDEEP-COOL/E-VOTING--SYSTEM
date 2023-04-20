<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String city = (String)request.getAttribute("city");
    String party = (String)request.getAttribute("party");
    String responseContent = "One Candidate Has Already Been Registered For Contest FROM " + city + " CITY and " + party + " PARTY";
    out.print(responseContent);
%>


