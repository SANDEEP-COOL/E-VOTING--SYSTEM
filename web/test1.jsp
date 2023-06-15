
<%@page import="evoting.dto.CandidateDetails"%>
<%@page import="evoting.dto.CandidateVote"%>
<%@page import="java.util.*"%>

<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<html>
    <head>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <link href="stylesheet/backgroundimage.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://kit.fontawesome.com/05d425af79.js" crossorigin="anonymous"></script>
        <link href="stylesheet/pageheader.css" rel="stylesheet">
        <style>
            body{
                height: 150%;
            }
        </style>
    </head>
    <body>
        <%
       HttpSession sess = request.getSession();
            String userid = (String)sess.getAttribute("userid");
            if(userid == null){
                sess.invalidate();
                response.sendRedirect("accessdenied.html");
            }
            
            System.out.println("jjgg");
            
            ArrayList<CandidateVote>  candidate = (ArrayList<CandidateVote>)request.getAttribute("candidatelist");
            StringBuffer sf = new StringBuffer();
            
            sf.append("<div class='mt-4'><div class='candidate'>VoteForChange</div></br>"
                    + "<div class='subcandidate'>Whom do you want to vote for?</div>"
                    + "<div class='logout '><a href = 'logout.html'>logout</a></div>"
                    + "</div><div class='button mt-5'></div>");
            
            
            System.out.println("yahoo");
            out.println(sf);
       %>
        <div class="d-flex justify-content-center align-items-center hight-100">    
            <div onclick='redirectvotingpage()' class="p-4 resp1 itemsSize d-flex flex-column align-items-center bg-color shadow round">
                 <img style='opacity: 0.8' src='images/user1.png' width="180px" class='image-fluid mt-5 mb-4'/>
                 <p style="letter-spacing: 2px; font-size: 12px" class="mt-5 text-light">Dear <strong>Voter</strong> ! ! Welcome You In the <strong>Voter</strong> Pannel...</p>
                 <button type="button" class="btn btn-outline-light mt-5 shadow">Click Here</button>
            </div>
        </div>
                 
         <%
            request.setAttribute("candidatelist", candidate);
            response.sendRedirect("showCandidate2.jsp");
        %>
    </body>
    
    <script>
//        function addvote(candidateId) {
//            console.log("candidateid = " + candidateId);
//            $.post('AddVoteControllerServlet', {"candidateid": candidateId}, function(response) {
//                console.log("ldcnkjenkjebjhWKJFNK"+response+"type "+typeof(response));
//                if(response.trim() === "success"){
//                    console.log("response = "+response);
//                    swal("Success", "Your Vote is Added Successfully!", "success").then(()=>{
////                    window.location.href = 'votingResponse.jsp';
//                    });
//                }
//                else{
//                    console.log("kjnkwee");
//                }
//            }).fail(function() {
//                // Handle failure if needed
//            });
//        }
//        function home(){
//            window.location.href = "index.jsp";
//        }
        
        function redirectvotingpage(){
            swal("Voter", "Redirecting To Voting Controller page", "success").then((result) => {
            });
        }
    </script>
</html>

