

function hello() {
    // Your code here
    console.log("Hello, world!");
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
        
//    removeCandidateForm();
//    form
    let str = `<div id="cont1" class="d-flex justify-content-center">
            <form method="POST" id="candidateform" enctype="multipart/form-data">
                <div class="mb-3">
                    <label for="candid" class="form-label">Cadidate Id : </label>
                    <input type="text" class="form-control" id="candid">
                  </div>

                  <div class="mb-3">
                    <label for="uid" class="form-label" >User Id : </label>
                    <input type="text" id="uid" onkeypress='return getDetails(event)' class="form-control" >
                  </div>

                  <div class="mb-3">
                    <label for="cname" class="form-label">Candidate Name : </label>
                    <input type="text" id="cname" class="form-control" >
                  </div>

                  <div class="mb-3">
                    <label for="clist" class="form-label">City List : </label>
                    <select id="clist"></select>
                  </div>

                  <div class="mb-3">
                    <label for="cparty" class="form-label">Candidate Party : </label>
                    <input type="text" id="cparty" class="form-control" >
                  </div>

                  <div class="mb-3">
                    <input type="file" name="files" value="select-image" id="cfile" class="form-control" >
                  </div>  
    
                  <button type="button" onclick="addcandidate()">add</button>
                  <button onclick="clearText()" type="reset" value="clear" class="btn btn-primary">Clear</button>
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

//function removeCandidateForm(){
//        let div = document.getElementById("cont1");
//        let form = document.getElementsByTagName('form')[0];
//        console.log(form);
//        $('form').fadeOut(3500);
//        div.remove();
//}

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
            str=data+"....";
            
            swal("Admin", str, "success").then((value) => {
//                removeCandidateForm();
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



function clearText(){
    $("#addresp").html("");
}

