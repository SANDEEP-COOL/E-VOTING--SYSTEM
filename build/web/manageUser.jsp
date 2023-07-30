<%-- 
    Document   : manageUser
    Created on : 16 Apr, 2023, 4:02:13 PM
    Author     : sande
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
        <link href="stylesheet/backgroundimage.css" rel="stylesheet">
        <link href="stylesheet/pageheader.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@1,900&display=swap" rel="stylesheet">
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    </body>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage User Page</title>
        <style>
            
            .shadow{
                box-shadow: rgba(50, 50, 93, 0.25) 0px 50px 100px -20px, rgba(0, 0, 0, 0.3) 0px 30px 60px -30px, rgba(10, 37, 64, 0.35) 0px -2px 6px 0px inset;
            }
            
            body{
                height: 1000px;
            }
            
            .box{
                width: 500px;
                height: 300px;
            }
            .mt{
                margin-top: 12%;
            }
            #showuser{
                background-image: url('images/show.png');
                background-repeat: no-repeat;
                background-size: cover;
            }
            #updateuser{
                background-image: url('images/update1.jpg');
                background-repeat: no-repeat;
                background-size: cover;
            }
            #removeuser{
                background-image: url('images/update3.jpg');
                background-repeat: no-repeat;
                background-size: cover;
            }
        </style>
    </head>
    <body>
        <%
        StringBuffer sf = new StringBuffer();
            
            sf.append("<div><div class='candidate'>VoteForChange</div></br>"
                    + "<div class='subcandidate'>Whom do you want to vote for?</div>"
                    + "<div class='logout '><a href = 'logout.html'>logout</a></div>"
                    + "</div><div class='button mt-5'>");
            out.println(sf);
         %>
         
<!--        <div class="container">
            <div class="d-flex flex-row mt">
                <div class="mx-2 box shadow-lg p-3 mb-5 bg-body-tertiary rounded" id="showuser" onclick="showuser()"></div>
                <a id="updateuser" href="UpdateUserControllerServlet" class="mx-2 box shadow-lg p-3 mb-5 bg-body-tertiary rounded"></a>
                <a id="removeuser" href="DeleteUserFromDBControllerServlet" class="mx-2 box shadow-lg p-3 mb-5 bg-body-tertiary rounded"></a>
            </div>
            <div class="d-flex flex-row justify-content-around text-light">
                <div>Show User</div>
                <div>Update User</div>
                <div>Remove User</div>
            </div>
        </div>-->


            <div class="d-flex mx-auto justify-content-center align-items-center flex-column" style="width: 80vw">
                <div id="showuser" class="mx-2 box shadow-lg p-3 mb-5 bg-body-tertiary rounded" onclick="showuser()" style="width: 500px">
                    

                    <h1 style="font-family: 'Montserrat', sans-serif;" class="text-dark shadow">Show Users</h1>
                    
                </div>
                
                <div href="UpdateUserControllerServlet" id="updateuser" class="mx-2 box shadow-lg p-3 mb-5 bg-body-tertiary rounded d-flex justify-content-center align-items-center" style="width: 500px">
                     
                    <a href="#" style="text-decoration: none; color: inherit; display: block; width: 100%; height: 100%;">
                        <h1 style="font-family: 'Montserrat', sans-serif;" class="text-dark shadow">Update User</h1>
                    </a>
                    
                </div>
                
               <div id="removeuser" class="mx-2 box shadow-lg p-3 mb-5 bg-body-tertiary rounded d-flex justify-content-center align-items-center" style="width: 500px">
                    <a href="DeleteUserFromDBControllerServlet" style="text-decoration: none; color: inherit; display: block; width: 100%; height: 100%;">
                        <h1 style="font-family: 'Montserrat', sans-serif;" class="text-dark shadow">Delete User</h1>
                    </a>
                </div>

            </div>

            
            <div id="result"></div>
         
    </body>
    <script>
        function showuser(){
            console.log(".,............,,,,,,,,,,")
            $.post('ShowUserControllerServlet', null, function(response) {
//                $('#result').html(response).fadeIn(1000, function(){
//                    setTimeout(function(){
//                        $('#result').fadeOut(1000);
//                    }, 3000);
//
//                     $('html, body').animate({
//                        scrollTop: $('#result').offset().top
//                    }, 1000);
//                });
                $('#result').html(response);
                document.getElementById("result").scrollIntoView();
            }).fail(function() {
                // Handle failure if needed
            });
        }
        
        
//        function removeuser(){
//            console.log("chala");
//            $.post('RemoveUserControllerServlet', null, function(response) {
//                console.log(response);
//                $("#result").hide();
//                $("#result").html(response);
//                $("#result").fadeIn(3000);
//                $('html, body').animate({
//                    scrollTop: $(window).scrollTop() + 500
//                }, 1000);
//                $("#myselect").on('change', function(){
//                   var cid = $(this).find('option:selected').text();
//                   console.log(cid+" "+typeof(cid));
//                    $.post('GetCandidateDetailsForUser', {"cid" : cid}, function(response) {
//                        $("#result").hide();
//                        $("#result").html(response);
//                        $("#result").fadeIn(3000);
//                        $('html, body').animate({
//                            scrollTop: $(window).scrollTop() + 500
//                        }, 1000);
//
//                    }).fail(function() {
//                         // Handle failure if needed
//                    });
//                });
//            }).fail(function() {
//                // Handle failure if needed
//            });
//        }
    </script>
</html>
