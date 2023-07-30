<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="jsscript/adminOptions.js"></script>
        <script src="jsscript/jquery.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <link href="stylesheet/backgroundimage.css" rel="stylesheet">
        <link href="stylesheet/pageheader.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@1,900&display=swap" rel="stylesheet">
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
        <title>Admin Options</title>
        <style>
            .box1{
                width: 26vw;
                height: 35vh;
            }
            .padding{
                padding: 30px;
            }
            #firstImg{
                background-image: url('images/muser.png');
                background-size: cover;
                /*background-position: center;*/
            }
            #secondImg{
                background-image: url('images/ManageCandLists.jpg');
                background-size: cover;
            }
            #thirdImg{
                background-image: url('images/resultgraph.jpg');
                background-size: cover;
            }
            @media screen and (max-width: 1240px){
                .resp1{
                    display: flex;
                    flex-direction: column;
                }
            }
            .shadow{
                box-shadow: rgba(50, 50, 93, 0.25) 0px 50px 100px -20px, rgba(0, 0, 0, 0.3) 0px 30px 60px -30px;
            }
            .customeFont{
                font-family: 'Montserrat', sans-serif;
                font-weight: 900;
                font-size: 30px;
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
        <div ><div class='candidate'>VOTE FOR CHANGE</div><br>
            <div class='subcandidate'>Admin Actions Page</div><br><br>
            <div class='logout'><a href='login.html'>logout</a></div></div>
<!--            
        <div class='d-flex flex-row mb-3 justify-content-between'>
            <div id='dv1' class="shadow-lg p-3 mb-5 bg-body-tertiary rounded" onclick='manageuser()'><img class="img-fluid" src='images/muser.png' height='300px' width='300px'><br><h3>Manage Users</h3></div>
            <div id='dv2' class="shadow-lg p-3 mb-5 bg-body-tertiary rounded" onclick='managecandidate()'><img class="img-fluid" src='images/ManageCandLists.jpg' height='300px' width='300px'><br><h3>Manage Candidates</h3></div>
            <div id='dv2' class="shadow-lg p-3 mb-5 bg-body-tertiary rounded" onclick='electionresult()'><img class="img-fluid" src='images/resultgraph.jpg' height='300px' width='300px'><br><h3>Election Result</h3></div>
        </div>-->

<!--        <div class="d-flex justify-content-between align-items-center flex-wrap padding box">
            <div class="d-flex flex-column justify-content-center align-items-center text-light resp1" onclick='manageuser()'>
                <img src="images/manageUser.png" width="350px" height="250px"/>
                <h3 class='mt-3'>Manage Users</h3>
            </div>
             <div class="d-flex flex-column justify-content-center align-items-center text-light resp1" onclick='managecandidate()'>
                 <img src="images/candidate1.jpg" width="370px" height="250px"/>
                <h3 class='mt-3'>Manage Candidate</h3>
                 
            </div>
             <div class="d-flex flex-column justify-content-center align-items-center text-light resp1" onclick='electionresult()'>
                <img src="images/result.png" width="370px"/>
                <h3 class='mt-3'>View Result</h3>
                 
            </div>
        </div>-->

        <div class="resp1 d-flex justify-content-center align-items-center">
            <div class="mx-3 shadow" onclick='manageuser()'>
                <img src="images/manageUser.png" width="350px" height="250px"/>
                <h3 class='mt-3 text-center text-light customeFont'>Manage Users</h3>
            </div>
            <div class="mx-3 shadow" onclick='managecandidate()'>
                <img src="images/candidate1.jpg" width="370px" height="250px"/>
                <h3 class='mt-3 text-center text-light customeFont'>Manage Candidate</h3>
            </div>
            <div class="mx-3 shadow" onclick='electionresult()'>
                <img src="images/result.png" width="370px"/>
                <h3 class='mt-3 text-center text-light customeFont'>View Result</h3>
            </div>
        </div>


        <br><br><div align='center' id='result'></div>
    </body>
    <script>
        function electionresult() {
            window.location.href="ElectionResultControllerServlet";
        }
        function manageuser(){
            swal("Admin", "Redirecting To User Page", "success").then(()=>{
            window.location.href="ManageUserControllerServlet";
            })
        }
    </script>
</html>
