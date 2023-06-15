<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <!--<link href="stylesheet/backgroundimage.css" rel="stylesheet">-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://kit.fontawesome.com/05d425af79.js" crossorigin="anonymous"></script>
        <link href="stylesheet/pageheader.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@100&display=swap" rel="stylesheet">
        <script src="https://kit.fontawesome.com/05d425af79.js" crossorigin="anonymous"></script>
        <style>
            body{
                background-image: url('images/election1.jpg');
                /*width: 100%;*/
                background-size: cover;
                background-repeat: no-repeat;
                font-family: 'Montserrat', sans-serif;
            }
            .shadow{
                box-shadow: rgba(50, 50, 93, 0.25) 0px 50px 100px -20px, rgba(0, 0, 0, 0.3) 0px 30px 60px -30px;
            }
            #main-h{
                padding: 10px 0 0 12px;
                letter-spacing: 8px;
            }
            @media screen and (max-width: 1415px) {
                .resp1 {
                    display: flex;
                    justify-content: center;
                }
                .resp1 div {
                    text-align: center;
                }
                .resp2{
                    display: flex;
                    justify-content: center;
                    align-items: center;
                }
            }
            @media screen and (max-width: 960px){
                
            }
        </style>
    </head>
    <body>
       
        
        <div class="d-flex justify-content-center align-items-center" style="height: 100vh">
            <div class="container">
                <div class="resp2 mx-auto shadow text-light" style="width: 70vw; height: 60vh; background-image: url('images/election.jpg'); background-repeat: no-repeat; background-size: cover">
                    
                    <div class="d-flex flex-wrap resp1">
                        <div height="50%">
                            <h1 id="main-h">Vote For Change</h1>
                            <p style="font-size: 10px; letter-spacing: 5px; padding: 3px 0 0 13px;">"Making your voice heard, one vote at a time"</p>
                            <div style="height: 250px" class="p-5 d-flex flex-column justify-content-center align-items-center">
                                <div class="mb-5">
                                    
                                    <button type="button" class=" btn  text-dark shadow mx-3" style="background-color: #6F4695; letter-spacing: 4px; font-size: 10px"><strong><i class="fa-brands fa-facebook-f"></i>FACEBOOK</strong></button>    
                                    <button type="button" class="btn  text-dark shadow mx-3" style="background-color: #6F4695; letter-spacing: 4px; font-size: 10px"><strong><i class="fa-brands fa-instagram"></i>INSTAGRAM</strong></button>    
                                    <button type="button" class="btn  text-dark shadow mx-3" style="background-color: #6F4695; letter-spacing: 4px; font-size: 10px"><strong><i class="fa-brands fa-tiktok"></i>TIKTOK</strong></button>    
                                </div>
                                <div>
                                    <button type="button" class="btn  text-dark shadow mx-3" style="background-color: #6F4695; letter-spacing: 4px; font-size: 10px"><strong><i class="fa-brands fa-whatsapp"></i>WATSAPP</strong></button>    
                                    <button type="button" class="btn  text-dark shadow mx-3" style="background-color: #6F4695; letter-spacing: 4px; font-size: 10px"><strong><i class="fa-solid fa-mug-tea"></i>KO-FI</strong></button>    
                                    <button type="button" class="btn  text-dark shadow mx-3" style="background-color: #6F4695; letter-spacing: 4px; font-size: 10px"><strong><i class="fa-brands fa-paypal"></i>PAYPAL</strong></button>    
                                </div>
                            </div>
                        </div>
                      
                        <div class="mx-5 d-flex flex-column justify-content-center align-items-center" class="h-100">
                            <p>Please Start You <strong>Journy</strong> Here !!</p>
                            <p >Dear User ! Here You Can <strong>Login</strong> Or <strong>Register</strong></p>
                            <button onclick="sendLogin()" type="button" class="btn  text-light shadow mt-4" style="background-color: #6F4695; letter-spacing: 4px; font-size: 10px"><strong><i class="fa-solid fa-right-to-bracket"></i>Login</strong></button>    
                            <button onclick="sendReg()" type="button" class="btn  text-light shadow mt-4" style="background-color: #6F4695; letter-spacing: 4px; font-size: 10px"><strong><i class="fa-solid fa-registered"></i>Register</strong></button>    
                        </div>
                    </div>
                 </div>
            </div>
        </div>
    </body>
    <script>
        function sendLogin(){
            window.location.href = "login.html";
        }
        
        function sendReg(){
            window.location.href = "registration.html";
        }
    </script>
</html>
