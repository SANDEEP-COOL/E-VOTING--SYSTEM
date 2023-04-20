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
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    </body>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage User Page</title>
        <style>
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
         
        <div class="container">
            <div class="d-flex flex-row mt">
                <div class="mx-2 box shadow-lg p-3 mb-5 bg-body-tertiary rounded" id="showuser" onclick="showuser()"></div>
                <div class="mx-2 box shadow-lg p-3 mb-5 bg-body-tertiary rounded" id="updateuser" onclick="updateuser" ></div>
                <div class="mx-2 box shadow-lg p-3 mb-5 bg-body-tertiary rounded" id="removeuser" onclick="removeuser()"></div>
            </div>
            <div class="d-flex flex-row justify-content-around text-light">
                <div>Show User</div>
                <div>Update User</div>
                <div>Remove User</div>
            </div>
            <div id="result"></div>
        </div>
         
    </body>
    <script>
        function showuser(){
            console.log(".,............,,,,,,,,,,")
            $.post('ShowUserControllerServlet', null, function(response) {
                $('#result').html(response).fadeIn(1000, function(){
                    setTimeout(function(){
                        $('#result').fadeOut(1000);
                    }, 3000);

                     $('html, body').animate({
                        scrollTop: $('#result').offset().top
                    }, 1000);
                });
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
