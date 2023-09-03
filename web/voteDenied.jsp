<%-- 
    Document   : voteDenied
    Created on : 22 Apr, 2023, 9:06:15 PM
    Author     : sande
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <link href="stylesheet/backgroundimage.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://kit.fontawesome.com/05d425af79.js" crossorigin="anonymous"></script>
        <link href="stylesheet/pageheader.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@1,900&display=swap" rel="stylesheet">
        <style>
            body{
                background-image: url('images/election1.jpg');
            }
            #box1{
                width: 50vw;
                height: 50vh;   
            }
            #main{
                height: 100vh;
            }
            .shadow{
                box-shadow: rgba(17, 12, 46, 0.15) 0px 48px 100px 0px;
            }
            .customeFont{
                font-family: 'Montserrat', sans-serif;
                font-weight: 900;
                font-size: 20px;
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
                    + "<div class='subcandidate'>Dear Customer You Selected Candidate Is Here...</div>"
                    + "<div class='logout '><a href = 'logout.html'>logout</a></div>"
                    + "</div><div class='button mt-5'>");
            out.println(sf);
           
        %>

        <div class="d-flex justify-content-center" style="width: 100vw; height: 100vh">
            <div class="container">
                <table class="text-center shadow table table-dark table-striped mx-auto table-rounded" style="width: 70%">
                    <tbody>
                      <tr>
                          <th scope="col">#</th>
                          <th class="col-6 customeFont">
                              NAME : 
                          </th>
                          <td id="name" class="customeFont">
                              sss
                          </td>
                      </tr>
                       <tr>
                           <th scope="col">1</th>
                          <th class="customeFont">
                              ADDRESS : 
                          </th>
                          <td id="add" class="customeFont">
                              sss
                          </td>
                      </tr>
                       <tr>
                           <th scope="col">2</th>
                          <th class="customeFont">
                              CITY : 
                          </th>
                          <td id="city" class="customeFont">
                              sss
                          </td>
                      </tr>
                       <tr>
                           <th scope="col">3</th>
                          <th class="customeFont">
                              EMAIL_ID : 
                          </th>
                          <td id="email" class="customeFont">
                              sss
                          </td>
                      </tr>
                       <tr>
                           <th scope="col">4</th>
                          <th class="customeFont">
                              MOBILE_NO : 
                          </th>
                          <td id="mob" class="customeFont">
                              sss
                          </td>
                      </tr>
                       <tr>
                           <th scope="col">5</th>
                          <th class="customeFont">
                              GENDER : 
                          </th>
                          <td id="gender" class="customeFont">
                              sss
                          </td>
                      </tr>
                    </tbody>
                    
                  </table>
            </div>
        </div>


    </body>
    <script>
        window.onload = function(){
          $.ajax({
              url: 'GetCandOfVoterControllerServlet',
              type: "post",
              data: null,
              success: function(response){
                  console.log(response);
                  let info = JSON.parse(response);
                  console.log(info);
                  document.getElementById("name").textContent = info.name;
                  document.getElementById("add").textContent = info.ADDRESS;    
                  document.getElementById("city").textContent = info.CITY;
                  document.getElementById("email").textContent = info.EMAIL_ID;
                  document.getElementById("mob").textContent = info.MOBILE_NO;
                  document.getElementById("gender").textContent = info.GENDER;
              },
              error : function(xhr, status, error){
                  console.log(error);
              }
          });
        };
    </script>
</html>
