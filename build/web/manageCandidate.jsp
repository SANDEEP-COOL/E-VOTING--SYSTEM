<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <script src="jsscript/jquery.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <link href="stylesheet/backgroundimage.css" rel="stylesheet">
        <link href="stylesheet/pageheader.css" rel="stylesheet">
        <link href="stylesheet/admin.css" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@1,900&display=swap" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <style>
            body{
                height: 150%;
            }
            .customeFont{
                font-family: 'Montserrat', sans-serif;
                font-weight: 900;
                font-size: 30px;
            }
        </style>
        <title>manage candidate</title>
    </head>
    <body>
        
        
        <%
            
            String userid=(String)session.getAttribute("userid");
            if(userid==null)
            {
                response.sendRedirect("accessdenied.html");
                return;
            }
            StringBuffer sf = new StringBuffer();
            
            StringBuffer sf1 = new StringBuffer();
            
            sf1.append("<div><div class='candidate'>VoteForChange</div></br>"
                    + "<div class='subcandidate'>Manage Candidate</div>"
                    + "<div class='logout '><a href = 'logout.html'>logout</a></div>"
                    + "</div><div class='button mt-5'>");
            out.println(sf1);
            
            sf.append("<div class='container d-flex flex-row  mb-3'>"
                    + "<div onclick='showaddcandidateform()' class='shadow-lg p-3 mb-5 bg-body-tertiary rounded mx-2' style='width: 350px; height: 250px; background-image: url(images/addcandidate.png); background-size: cover; backgroun-repeat: no-repeat'></div>"
                    + "<div onclick='showupdatecandidateform()' class='shadow-lg p-3 mb-5 bg-body-tertiary rounded mx-2' style='width: 350px; height: 250px; background-image: url(images/update1.jpg); background-repeat: no-repeat; background-size: cover'></div>"
                    + "<div onclick='sandeep()' class='shadow-lg p-3 mb-5 bg-body-tertiary rounded mx-2' style='width: 350px; height: 250px; background-image: url(images/candidate.jpg); background-size: cover; background-size: background-repeat: no-repeat'></div>"
                    + "<div onclick='deletecandidate()' class='shadow-lg p-3 mb-5 bg-body-tertiary rounded mx-2' style='width: 350px; height: 250px; background-image: url(images/update3.jpg); background-size: cover; background-repeat: no-repeat'></div></div>"
                    + "<div class='container d-flex flex-row justify-content-around' style='justify-content: space-around; padding-top: 0px'>"
                    + "<div class='text-light customeFont'>Add Candidate</div>"
                    + "<div class='text-light customeFont'>Update Candidate</div>"
                    + "<div class='text-light customeFont'>Show Candidate</div>"
                    + "<div class='text-light customeFont'>Delete Candidate</div>"
                    + "</div>"
                    + "<div class='mt-5'  align='center' id='result'></div>");  //style='justify-content: space-around; padding-top: 30px' class='text-light container '
            
             out.println(sf);               

        %>
    </body>
    
    <script>
  
        function clearText(){
            console.log("chalaclear text")
            document.getElementById('result').innerHTML  = "";
        }
        function sandeep() {
            console.log("dd");
            clearText();
//            removeCandidateForm();
            var newdiv = document.createElement("div");
            newdiv.setAttribute("id", "candidateform");
            newdiv.setAttribute("float", "left");
            newdiv.setAttribute("padding-left", "12px");
            newdiv.setAttribute("border", "2px solid red");
            newdiv.innerHTML = newdiv.innerHTML+"<h3>Show Candidate</h3>";
            newdiv.innerHTML = newdiv.innerHTML+"<div style='color:white';font-weight: bold>Candidate Id : </div><div><select class='form-select-sm w-50 rounded p-2 bg-dark text-danger mt-1  border-0' id='cid'></select></div>";
            newdiv.innerHTML = newdiv.innerHTML+"</br><span id ='addresp'></span>";
            var addcand = $("#result")[0];
            addcand.appendChild(newdiv);
            $("#candidateform").hide();
            $("#candidateform").fadeIn(3500);
            data = {data : "cid"};

            
            $.post("ShowCandidateControllerServlet", data, function(responseText){
               var candidateIdList = JSON.parse(responseText);
               var s = candidateIdList.cid;
               var a = document.getElementById("cid");
               $("#cid").append(s);
            });

            $("#cid").change(function(){
                var cid = $("#cid").val();
                console.log("val = "+cid);
                if(cid === ' '){
                    swal("No Selection", "Please Select An Id","error");
                }
                data = {data: cid};
                $.post("ShowCandidateControllerServlet", data, function(responseText){
                    clearText();
                    var details = JSON.parse(responseText);
                    console.log(details);
                    $("#result").append(details.candidateDetails);
                });
            });

            
        }

        function getDetails(event) {
            console.log("getDetails chal gaya");
            console.log("event keyCode is " + event.keyCode);
            if (event.keyCode === 13) {

                data = { uid: $('#uid').val() };
                $.post('AddCandidateControllerServlet', data, function(responseText) {
                    let details = JSON.parse(responseText);
                    console.log(details);
                    let username = details.username;
                    let city = details.city;
                    if (username === "wrong")
                        swal("Wrong Adhar Number!", "Adhar No is Invalid", "error");
                    else {
                        $('#cname').val(username);
                        $('#city').empty();
                        $('#clist').append(city);
                        $('#cname').prop('disabled', true);
                    }
                });
                return false;
            }
        }

        function showaddcandidateform(){
            clearText();
        //    form
            let str = `<div id="cont1" class="d-flex justify-content-center">
                    <form class="text-light shadow-lg p-3 mb-5 bg-body-tertiary rounded" method="POST" id="candidateform" enctype="multipart/form-data">
                        <div class="mb-3">
                            <label for="candid" class="form-label">Cadidate Id : </label>
                            <input type="text" class="border-0 bg-dark text-light form-control" id="candid">
                          </div>

                          <div class="mb-3">
                            <label for="uid" class="form-label" >User Id : </label>
                            <input type="text" id="uid" onkeypress='return getDetails(event)' class="border-0 bg-dark text-light form-control" >
                          </div>

                          <div class="mb-3">
                            <label for="cname" class="form-label">Candidate Name : </label>
                            <input type="text" id="cname" class="border-0 bg-dark text-light form-control" >
                          </div>

                          <div class="mb-3">
                            <label for="clist" class="form-label">City List : </label>
                            <select class="bg-dark text-light border-0 form-select" id="clist"></select>
                          </div>

                          <div class="mb-3">
                            <label for="cparty" class="form-label">Candidate Party : </label>
                            <input type="text" id="cparty" class="border-0 bg-dark text-light form-control" >
                          </div>

                          <div class="mb-3">
                            <input type="file" name="files" value="select-image" id="cfile" class="border-0 bg-dark text-light form-control-sm" >
                          </div>  

                          <button class="btn btn-outline-danger" type="button" onclick="addcandidate()">add</button>
                          <button onclick="clearText()" type="reset" value="clear" class="btn btn-outline-primary">Clear</button>
                    </form>
                  </div>`;
        //    form

        //    newdiv.innerHTML = newdiv.innerHTML+str;
        //    newdiv.innerHTML = newdiv.innerHTML+"<br> <span id='addresp'></span>";
            var addCand = $('#result')[0];
            addCand.innerHTML = addCand.innerHTML+str;
            $('#candidateform').hide();
            $('#candidateform').fadeIn(3500);
            data = {id : 'getid'};
                $.post('AddCandidateControllerServlet', data, function(responseText) {
               $('#candid').val(responseText);
               $('#candid').prop('disabled', true);
            });
        }

            function removeCandidateForm(){
                let div = document.getElementById("cont1");
                console.log("removecandidatechala");
                console.log(div);
                let form = document.getElementsByTagName('form')[0];
                console.log(form);
                $('form').fadeOut(3500);
                div.remove();
        }

        function addcandidate(){
            var form = $('#candidateform')[0];
            console.log(form);
        //    data variable form me presented image copy ho jaa rahi hai... 
            var data = new FormData(form);

            alert(data);

            data.append("candid", $('#candid').val());
            data.append("uid", $('#uid').val());
            data.append("cparty", $('#cparty').val());
            data.append("clist", $('#clist').val());

            $.ajax({
                type: "post",
                enctype: "multipart/form-data",
                url: "AddNewCandidateControllerServlet",
                data: data,
                processData: false,
                contentType: false,
                cache: false,
                timeout: 60000,
                success: function(data){
                    console.log("/////////"+data);
                    str=data;

                    swal("Admin", str, "success").then((value) => {
                        removeCandidateForm();
                        setTimeout(()=>{
                            showaddcandidateform();
                        }, 3000);

                    });
                },
                error: function(e){
                    swal("Admin", e, "error");
                }
            });   
        }

        function deletecandidate() {
    $.post('GetCandidateIdToRemoveCandidateControllerServlet', null, function(response) {
        console.log(response);
        $("#result").hide().html(response).fadeIn(3000);
        $('html, body').animate({
            scrollTop: $(window).scrollTop() + 800
        }, 1000);
        $("#myselect").on('change', function() {
            var cid = $(this).find('option:selected').text();
            console.log(cid + " " + typeof(cid));
            $.post('GetCandidateDetailsForUser', { "cid": cid }, function(response) {
//                System.out.printnl("response: "+response);
                $("#result").hide().html(response).fadeIn(3000);
                $('html, body').animate({
                    scrollTop: $(window).scrollTop() + 800
                }, 1000);
                $.post('RemoveCandidateControllerServlet', { "cid": cid }, function(response) {
                    console.log(response);
                }).fail(function() {
                    // Handle failure if needed
                });
            });
        });
    }).fail(function() {
        // Handle failure if needed
    });
}



    </script>
</html>
