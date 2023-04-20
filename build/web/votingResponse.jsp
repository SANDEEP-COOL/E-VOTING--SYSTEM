<%-- 
    Document   : votingResponse
    Created on : 15 Apr, 2023, 9:12:30 AM
    Author     : sande
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="evoting.dto.CandidateVote"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <link href="stylesheet/backgroundimage.css" rel="stylesheet">
        <link href="stylesheet/pageheader.css" rel="stylesheet">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <link href="stylesheet/showcandidate.css" rel="stylesheet">
        <title>Voting Details</title>
    </head>
    <body>
        <%
            String userid = (String)session.getAttribute("userid");
            if(userid == null){
                session.invalidate();
                response.sendRedirect("accessdenied.html");
                return;
            }
            CandidateVote candidate = (CandidateVote)session.getAttribute("candidate");
            StringBuffer sf = new StringBuffer();
            sf.append("<div class='sticky'><div class = 'candidate'>VOTE FOR CHANGE</div>");
            if(candidate == null) {
                sf.append("<div class='subcandidate'>Sorry Your Vote Could Not Be Casted</div><br><br>");
                sf.append("</div><h4 id='logout><a href = 'LoginContollerServlet?logout=logout'>Logout</a></h4></div>");
                out.println(sf);
            }
            else{
                sf.append("<div class='subcandidate'>Thank You For Voting</div><br><br>");
                sf.append("<br><div class='candidateprofile'>Your Vote Added Successfully!</div>");
                sf.append("<div class='candidateprofile'<p>CandidateId : "+candidate.getCandidateId()+"<br>");
                sf.append("<strong>You Voted For</strong></br><img src='data:image/JPG;base64," + candidate.getSymbol() + "' style='width:300px;height:200px;'/>");
                sf.append("<br></duv class='candidateprofile'><p>Candidate Id : "+candidate.getCandidateId()+"<br>");
                sf.append("Candidate Name : "+candidate.getCandidateName()+"<br>");
                sf.append("Party : "+candidate.getParty()+"<br></div>");
                out.println(sf);
            }
        %>
    </body>
</html>
