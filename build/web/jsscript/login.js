let userid, password, username;

function connectUser(){
//    userid... 
    userid = $('#userid').val();
//    password...
    password = $('#password').val();
//    username...
    username = $('#username').val();
    
    if(validateUser()){
        
//        agar user validated hai to ek js object banao so that userid and password hum ek object me bharkar send kar sake... 
        let user = {
            userid : userid,
            password : password
        };
        
        for (const key in user) {
                console.log(`${key}: ${user[key]}`);
             }
        
//        send request through AJAX to LoginControllerServlet... 
        xhr = $.post('LoginControllerServlet', user, processResponse);
        xhr.fail(handleError);
    }
}

let servlet;
function processResponse(responseText){
    let str = responseText.trim();
    console.log("chala = "+str);
    if(str === "error"){
        console.log("chala = if");
        swal("Error", "Login Failed", "error");
    }
    else{
        console.log("chala = else");
        swal("Success", "Login Scuccessfully Done!", "success");
        if(str.includes('AdminControllerServlet')){
            servlet = 'AdminControllerServlet';
        }
        else if(str.includes('VotingControllerServlet')){
            servlet = 'VotingControllerServlet1';
        }
        setTimeout(redirectUser, 3000);
    }
}

function handleError(){
    swal("Error", "Problem In Server Communication!","error");
}

function redirectUser() {
//    let url = window.location.protocol + "//" + window.location.hostname + "/" + servlet;
    window.location = servlet;
}

function validateUser(){
    if(userid === "" || password === "" || username === ""){
        swal("Error", "All Fields Are Mandatory","error");
        return false;
    }
    return true;
}