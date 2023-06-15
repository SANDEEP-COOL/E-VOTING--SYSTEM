<%@page import="evoting.dto.CandidateVote"%>
<%@page import="java.util.*"%>

<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<html>
    <head>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <!--<link href="stylesheet/backgroundimage.css" rel="stylesheet">-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://kit.fontawesome.com/05d425af79.js" crossorigin="anonymous"></script>
        <link href="stylesheet/pageheader.css" rel="stylesheet">
        <!--<script src="https://kit.fontawesome.com/05d425af79.js" crossorigin="anonymous"></script>-->
        <style>
            body{
                height: 150%;
                background-image: url('images/election1.jpg');
                background-repeat: no-repeat;
                background-size: cover;
            }
            .wh{
                width: 60%;
                height: 40%;
            }
            .shadow{
                box-shadow: rgba(50, 50, 93, 0.25) 0px 50px 100px -20px, rgba(0, 0, 0, 0.3) 0px 30px 60px -30px;
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
        
        <div id='top' class="rounded d-flex mx-auto justify-content-center flex-column align-items-center wh bg-dark shadow" style="background-image: url('images/election.jpg')">
            <img src='images/votelogo1.png' style='width: 50px' class='mb-5'/>
            <h3 class="text-light mt-5">Dear Customer Here You Can Cast Your Vote !</h3>
            <button class='btn btn-outline-light mt-5' onclick="showCan()">Click For Cast Your Vote</button>
        </div>
        
        <div>
            <h5 id="done" style="width: 60%" class="d-none mx-auto border border-danger rounded text-light p-1 text-center"><span><i class="mx-5 text-info fa-solid fa-circle-check"></i></span>Dear Voter You Have Already Casted Your Vote Once, Click On Next Button</h5>
        </div>
        
        <div id='showCandidate' class="container mt-5 bg-transparent d-none">
            <div class="d-flex flex-row mb-3 justify-content-around flex-wrap">
                <c:forEach items="${candidatelist}" var="candidate">
                  <div class=" bg-transparent border-danger card mb-3" style="max-width: 650px;">
                      <div class="row g-0">
                          <div class="col-md-4 d-flex justify-content-center align-items-center">
                              <img src="data:image/jpg;base64,${candidate.getSymbol()}" style="width: 80px; height: 80px" class="card-img-top" alt="Not Found">
                              <!--<img src="data:image/jpg;base64,${candidate.getSymbol()}" style="width: 40px" class="card-img-top" alt="Not Found">-->
                          </div>
                          <div class="col-md-8">
                            <div class="card-body text-capitalize">
                                <div class="card-header text-light">Candidate Details...</div>
                                    <h2 class="card-title text-light mb-4">Name : ${candidate.getCandidateName()}</h2>
                                    <h5 class="card-text text-light mb-2">Candidate Id : ${candidate.getCandidateId()}</h5>
                                    <h5 class="card-text text-light mb-2">Party : ${candidate.getParty()}</h5>
                                   
                                    <button  type="button" onclick="addvote('${candidate.getCandidateId()}', '${candidate.getCity()}')" class="voteBtn btn text-light  btn-outline-danger mt-2">Click For Vote</button>
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
        function addvote(candidateId, city) {
            
            $('.voteBtn').prop('disabled', true);
            console.log("candidateid = " + candidateId);
            $.post('AddVoteControllerServlet', {"candidateid": candidateId, "city" : city}, function(response) {
                console.log("ldcnkjenkjebjhWKJFNK"+response+"type "+typeof(response));
                if(response.trim() === "success"){
                    console.log("response = "+response);
                    swal("Success", "Your Vote is Added Successfully!", "success").then(()=>{
//                    window.location.href = 'votingResponse.jsp';
                    });
                    $("#done").fadeIn(3000);
                    $("#done").removeClass("d-none");
                    
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
        
        function showCan(){
            
            $("#top").remove();
            $("#showCandidate").hide();
            document.querySelector("#showCandidate").classList.remove('d-none');
            $("#showCandidate").fadeIn(5000);
        }
    </script>
</html>