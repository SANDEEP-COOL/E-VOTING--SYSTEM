<%-- 
    Document   : adminShowCandidate
    Created on : 9 Apr, 2023, 5:16:13 AM
    Author     : sande
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "org.json.JSONObject"%>
<%@ page import = "evoting.dto.CandidateDetails"%>
<%@ page import = "evoting.dto.CandidateDetails"%>
<%@ page import = "java.util.ArrayList"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
    HttpSession sess = request.getSession();
    String userid = (String)sess.getAttribute("userid");
    if(userid == null){
        sess.invalidate();
        response.sendRedirect("accessdenied.jsp");
        return;
    }
    String result = (String)request.getAttribute("result");
    StringBuffer displayBlock = new StringBuffer();
    if(result != null && result.equalsIgnoreCase("candidatelist")) {
        ArrayList<String> candidateIdList = (ArrayList<String>) request.getAttribute("candidateid");
        displayBlock.append("<option class='p-2' value=' '>Choose id</option>");
        for(String c:candidateIdList){
            System.out.println("ids = "+c);
            displayBlock.append("<option class='p-2' value='" + c + "'>" + c + "</option>");
        }
        JSONObject json = new JSONObject();
        json.put("cid", displayBlock.toString());
        System.out.println("In adminShowCandidateControllerServlet"+json);
        out.println(json);
    }
    else if(result != null && result.equalsIgnoreCase("details")){
        CandidateDetails candidate = (CandidateDetails)request.getAttribute("candidate");
//        String str = "<img src='data:image/jpeg;base64," + candidate.getSymbol() + "' style='width:300px;height:200px;'/>";
          String str = "<img src='data:image/jpeg;base64," + candidate.getSymbol() + "' style='width: 40px'/>";
        displayBlock.append("<table>");
        displayBlock.append("<tr><th style='padding: 10px 25px'>User Id</th><td>"+candidate.getUserid()+"</td></tr>");
        displayBlock.append("<tr><th style='padding: 10px 25px'>User Name</th><td>"+candidate.getCandidatename()+"</td></tr>");
        displayBlock.append("<tr><th style='padding: 10px 25px'>City</th><td>"+candidate.getCity()+"</td></tr>");
        displayBlock.append("<tr><th style='padding: 10px 25px'>Party</th><td>"+candidate.getParty()+"</td></tr>");
        displayBlock.append("<tr><th style='padding: 10px 25px'>Sybmol</th><td>"+str+"</td></tr>");
        displayBlock.append("</table>");
        

        JSONObject json = new JSONObject();
        json.put("candidateDetails", displayBlock.toString());
        System.out.println("In adminShowCandidateControllerServlet"+json);
        out.println(json);
    }
%>
