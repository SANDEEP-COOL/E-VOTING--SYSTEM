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
            
            StringBuffer sf = new StringBuffer();
            
            sf.append("<div class='mt-4'><div class='candidate'>VoteForChange</div></br>"
                    + "<div class='subcandidate'>Whom do you want to vote for?</div>"
                    + "<div class='logout '><a href = 'logout.html'>logout</a></div>"
                    + "</div><div class='button mt-5'>");
            out.println(sf);
        %>
       
<!--        <img src="data:image/jpg;base64,${candidate.getSymbol()}" style="width: 80px; height: 80px" class="card-img-top" alt="Not Found">-->
        
        <div class="container mt-5 bg-transparent">
            <div class="d-flex flex-row mb-3 justify-content-around flex-wrap">
                <c:forEach items="${candidatelist}" var="candidate">
                    
                  <div class=" bg-transparent border-danger card mb-3" style="max-width: 650px;">
                      <div class="row g-0">
                          <div class="col-md-4 d-flex justify-content-center align-items-center">
                              <img src="data:image/jpg;base64,${candidate.getSymbol()}" style="width: 80px; height: 80px" class="card-img-top" alt="Not Found">
                          </div>
                          <div class="col-md-8">
                            <div class="card-body text-capitalize">
                                <div class="card-header text-light">Candidate Details...</div>
                                    <h2 class="card-title text-light mb-4">Name : ${candidate.getCandidateName()}</h2>
                                    <h5 class="card-text text-light mb-2">Candidate Id : ${candidate.getCandidateId()}</h5>
                                    <h5 class="card-text text-light mb-2">Party : ${candidate.getParty()}</h5>
                                    <button type="button" onclick="addvote('${candidate.getCandidateId()}')" class="btn text-light  btn-outline-danger mt-2">Click For Vote</button>
                            </div>
                            </div>  
                        </div>
                    </div>    
                </c:forEach>
            </div>
            <div style="text-align: center">
                <button onclick="home()" type="button" class="btn btn-lg mt-4 btn-outline-light">Next</button>
            </div>
          </div>
    </body>
    
    <script>
        function addvote(candidateId) {
            console.log("candidateid = " + candidateId);
            $.post('AddVoteControllerServlet', {"candidateid": candidateId}, function(response) {
                console.log("ldcnkjenkjebjhWKJFNK"+response+"type "+typeof(response));
                if(response.trim() === "success"){
                    console.log("response = "+response);
                    swal("Success", "Your Vote is Added Successfully!", "success").then(()=>{
//                    window.location.href = 'votingResponse.jsp';
                    });
                }
                else{
                    console.log("kjnkwee");
                }
            }).fail(function() {
                // Handle failure if needed
            });
        }
        function home(){
            window.location.href = "index.jsp";
        }
    </script>
</html>