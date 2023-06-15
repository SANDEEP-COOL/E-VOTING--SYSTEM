<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--<script src="jsscript/adminOptions.js"></script>-->
        <!--<script src="jsscript/adminOptions1"></script>-->
        <script src="jsscript/jquery.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
         <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
         <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@100&display=swap" rel="stylesheet">
        <link href="stylesheet/pageheader.css" rel="stylesheet">
        <title>Admin Options</title>
        <style>
            .itemsSize{
                width: 500px;
                height: 400px;
            }
            body{
                background-image: url('images/election.jpg');
                background-size: cover;
                background-repeat: no-repeat;
            }
            .hight-100{
                height: 100vh;
            }
            .bg-color{
                background-color: #704698;
            }
            .shadow{
                box-shadow: rgba(0, 0, 0, 0.4) 0px 30px 90px;
            }
            .round{
              border-radius: 10px;   
            }
            @media screen and (max-width: 1200px){
                .resp1{
                    margin-top: 60px;
                }
            }
        </style>
    </head>
    <body>
        <% String userid=(String)session.getAttribute("userid");
            if(userid==null) {
                response.sendRedirect("accessdenied.html");
                return;
            }
        %>

        
        <div class='sticky'><div class='candidate'>VOTE FOR CHANGE</div><br>
            <!--<div class='subcandidate'>Admin Options Page</div><br><br>-->
            <div class='logout'><a href='login.html'>logout</a></div></div>
        
        
        <div class="d-flex justify-content-center align-items-center hight-100"> 
            <div class="container">
                <div class="d-flex justify-content-around align-items-center flex-wrap">
                    <div class="resp1 itemsSize d-flex flex-column align-items-center bg-color shadow round">
                            <img style='opacity: 0.8' src='images/admin1.png' width="150px" class='mt-4 image-fluid'/>
                            <p style="letter-spacing: 2px; font-size: 12px" class="mt-5 text-light">Dear <strong>ADMIN</strong> ! ! Welcome You In the <strong>Admin</strong> Pannel...</p>
                            <button  onclick='redirectadministratorpage()' type="button" class="btn btn-outline-light mt-5 shadow">Click Here</button>
                    </div>
<!--                    <div onclick='redirectvotingpage()' class="resp1 itemsSize d-flex flex-column align-items-center bg-color shadow round">
                         <img style='opacity: 0.8' src='images/user1.png' width="100px" class='image-fluid mt-5 mb-4'/>
                         <p style="letter-spacing: 2px; font-size: 12px" class="mt-5 text-light">Dear <strong>Voter</strong> ! ! Welcome You In the <strong>Voter</strong> Pannel...</p>
                         <button type="button" class="btn btn-outline-light mt-5 shadow">Click Here</button>
                    </div>-->
                </div>
            </div>
        </div>
    </body>
    <script>
        function redirectadministratorpage(){
        //    swal hamesa hume ek promise return karta hai... 
        //    aur logic hum .then() ke andar likh rahe hai so that user ko ye msg tab tak dikhta rahe jab tak user redirect na ho... 
            swal("Admin", "Redirecting To Admin Action page", "success").then((result) => {
                window.location = "adminActions.jsp";
            });
        }
        
        function redirectvotingpage(){
            swal("Voter", "Redirecting To Voting Controller page", "success").then((result) => {
        //        window.location = "VotingControllerServlet";
                  window.location = "VotingControllerServlet1";
            });
        }
    </script>
</html>
