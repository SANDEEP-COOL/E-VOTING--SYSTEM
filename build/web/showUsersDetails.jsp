<%@page import="evoting.dto.UserDetails"%>
<%@page import="java.util.ArrayList, evoting.dao.UserDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
  // Create a StringBuffer to store the HTML response
  StringBuffer responseBuffer = new StringBuffer();

  // Build the HTML response as a string
  String responseString = "<!DOCTYPE html>"
    + "<html>"
    + "<head>"
    + "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">"
    + "<title>Show User Details</title>"
    + "</head>"
    + "<body>"
    + "<div class=\"container mt-4 \">"
    + "<table class=\"table text-light table-bordered table-dark shadow-lg p-3 mb-5 bg-white rounded\">"
    + "<thead class=\"table-danger\">"
    + "<tr>"
    + "<th scope=\"col\">#</th>"
    + "<th scope=\"col\">USERNAME</th>"
    + "<th scope=\"col\">USER ID</th>"
    + "<th scope=\"col\">EMAIL ID</th>"
    + "<th scope=\"col\">ADDRESS</th>"
    + "<th scope=\"col\">MOBILE NO</th>"
    + "<th scope=\"col\">CITY</th>"
    + "</tr>"
    + "</thead>"
    + "<tbody>";

  int count = 0;
  ArrayList<UserDetails> userlist = UserDao.getUserDetails();
  for(UserDetails user : userlist){
    String username = user.getUserName();
    String userid = user.getUserId();
    String email = user.getEmailId();
    String address = user.getAddress();
    long mobile = user.getMobile();
    String city = user.getCity();

    responseString += "<tr>"
      + "<th scope=\"row \">" + (count + 1) + "</th>"
      + "<td>" + username + "</td>"
      + "<td>" + userid + "</td>"
      + "<td>" + email + "</td>"
      + "<td>" + address + "</td>"
      + "<td>" + mobile + "</td>"
      + "<td>" + city + "</td>"
      + "</tr>";

    count++;
  }

  responseString += "</tbody>"
    + "</table>"
    + "</div>"
    + "</body>"
    + "</html>";

  // Append the responseString to the responseBuffer
  responseBuffer.append(responseString);

  // Set the response content type and write the response from the StringBuffer
  response.setContentType("text/html");
  response.getWriter().write(responseBuffer.toString());
%>
