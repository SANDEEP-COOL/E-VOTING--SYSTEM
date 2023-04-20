function redirectadministratorpage(){
    
//    swal hamesa hume ek promise return karta hai... 

//    aur logic hum .then() ke andar likh rahe hai so that user ko ye msg tab tak dikhta rahe jab tak user redirect na ho... 
    swal("Admin", "Redirecting To Admin Action page", "success").then((result) => {
        window.location = "adminActions.jsp";
    });
}

function redirectvotingpage(){
    swal("Voter", "Redirecting To Voting Controller page", "success").then((result) => {
        window.location = "VotingControllerServlet";
    });
}

//
//function manageuser(){
//    console.log("888888888888888");
////    swal hamesa hume ek promise return karta hai... 
//
////    aur logic hum .then() ke andar likh rahe hai so that user ko ye msg tab tak dikhta rahe jab tak user redirect na ho... 
//    swal("Admin", "Redirecting To User Management page", "success").then((result) => {
//        console.log("inside manage user");
//        window.location = "ManageUserControllerServlet";
//    });
//}

function managecandidate(){
    swal("Voter", "Redirecting To Candidate Management page", "success").then((result) => {
        window.location = "manageCandidate.jsp";
    });
}

//function getDetails(event) {
//    console.log("getDetails chal gaya");
//    console.log("event keyCode is " + event.keyCode);
//    if (event.keyCode === 13) {
//
//        data = { uid: $('#uid').val() };
//        $.post('AddCandidateControllerServlet', data, function(responseText) {
//            let details = JSON.parse(responseText);
//            console.log(details);
//            let username = details.username;
//            let city = details.city;
//            if (username === "wrong")
//                swal("Wrong Adhar Number!", "Adhar No is Invalid", "error");
//            else {
//                $('#cname').val(username);
//                $('#city').empty();
//                $('#clist').append(city);
//                $('#cname').prop('disabled', true);
//            }
//        });
//        return false;
//    }
//}

//function showaddcandidateform() {
//    
//    console.log("////////////////////////");
////    removeCandidateForm();
////    let newdiv = document.createElement('div');
////    newdiv.setAttribute('id', 'candidateform');
////    newdiv.setAttribute('float', 'left');
////    newdiv.setAttribute('padding-left', '12px');
////    newdiv.setAttribute('border', 'solid 2px red');
//    
////    form
//    let str = `<div class="d-flex justify-content-center">
//            
//          </div>`;
////    form
//
////    newdiv.innerHTML = newdiv.innerHTML+str;
////    newdiv.innerHTML = newdiv.innerHTML+"<br> <span id='addresp'></span>";
//    var addCand = $('#result')[0];
//    addCand.innerHTML = addCand.innerHTML+str;
//    $('#candidateform').hide();
//    $('#candidateform').fadeIn(3500);
//    data = {id : 'getid'};
//    $.post('AddCandidateControllerServlet', data, function(responseText) {
//       $('#candid').val(responseText);
//       $('#candid').prop('disabled', true);
//    });
//
//}   

//showupdatecandidateform
//
//showcandidate
//
//deletecandidate

//function addcandidate(){
//    document.getElementById("addcandidate").addEventListener('click', (e)=>{
//    e.preventDefault();
//    console.log("hello");
//});



