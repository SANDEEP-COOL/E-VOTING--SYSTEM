<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList, evoting.dto.CandidateVote"%>
<html lang="en">
    <head>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <link href="stylesheet/backgroundimage.css" rel="stylesheet">
        <link href="stylesheet/pageheader.css" rel="stylesheet">
        <script src="jsscript/jquery.js"></script>
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <link href="stylesheet/showcandidate.css" rel="stylesheet">
    </head>
    <body>
        <%
            HttpSession sess = request.getSession();
            String userid = (String)sess.getAttribute("userid");
            if(userid == null){
                sess.invalidate();
                response.sendRedirect("accessdenied.html");
            }
            
            StringBuffer sf = new StringBuffer();
            
            sf.append("<div class='sticky'><div class='candidate'>VoteForChange</div></br>"
                    + "<div class='subcandidate'>Whom do you want to vote for?</div>"
                    + "<div class='logout '><a href = 'logout.html'>logout</a></div>"
                    + "</div><div class='button mt-5'>");
            
            ArrayList<CandidateVote> candidatelist = (ArrayList<CandidateVote>)request.getAttribute("candidatelist");
            for(CandidateVote c : candidatelist) {
                sf.append("<input type='radio' name='flat' id='" + c.getCandidateId() + "' value='" + c.getCandidateId() + "' onclick='addvote(\"" + c.getCandidateId() + "\")'>");
                sf.append("<label for='" + c.getCandidateId() + "'><img src='data:image/jpg;base64," + c.getSymbol() + "' style='width:300px;height:200px;margin-top:100px'/></label>");
                sf.append("</br><div class='candidateprofile'<p>CandidateId :" + c.getCandidateId() + "<br>");
                sf.append("Candidate Name : " + c.getCandidateName() + "</br>");
                sf.append("Party : " + c.getParty() + "</br></div>");
            }
            sf.append("</div>");
            out.println(sf);
        %>
    </body>
    <script>
        function addvote(candidateId) {
            console.log("candidateid = " + candidateId);
            $.post('AddVoteControllerServlet', {"candidateid": candidateId}, function(response) {
                console.log("ldcnkjenkjebjhWKJFNK"+response+"type "+typeof(response));
                if(response.trim() === "success"){
                    console.log("response = "+response);
                    swal("Success", "Your Vote is Added Successfully!", "success").then(()=>{
                    window.location.href = 'votingResponse.jsp';
                    });
                }
                else{
                    console.log("kjnkwee");
                }
            }).fail(function() {
                // Handle failure if needed
            });
        }
    </script>
</html>
