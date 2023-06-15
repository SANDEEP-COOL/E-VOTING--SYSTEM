//kuch variables banane padenge... 
let username, password, cpassword, city, address, adhar, email, mobile;



//function...
function addUser(){
    
//    username lekar aao jquery ki help se... 
    username = $('#username').val();
    console.log(username);
    
//    password lekar aao jquery ki help se... 
    password = $('#password').val();
    console.log(password);
    
//    cpassword lekar aao jquery ki help se... 
    cpassword = $('#cpassword').val();
    console.log(cpassword);
    
//    city lekar aao jquery ki help se... 
    city = $('#city').val();
    console.log(city);
    
//    address lekar aao jquery ki help se... 
    address = $('#address').val();
    console.log(address);
    
//    adhar lekar aao jquery ki help se... 
    adhar = $('#adhar').val();
    console.log(adhar);
    
//    email lekar aao jquery ki help se... 
    email = $('#email').val();
    console.log(email);
    
//    mobile lekar aao jquery ki help se... 
    mobile = $('#mobile').val();
    console.log(mobile);
    
//    gender lekar aao
//     gender = $('input[name = "gender"]').val();
//     console.log(gender);
        var gender;
        var genderRadios = document.querySelectorAll('input[type="radio"][name="gender"]');
        genderRadios.forEach(function(radio) {
          if (radio.checked) {
            console.log(radio.value);
            gender = radio.value;
          }
        });
        console.log(gender); // logs the selected gender outside the loop

//        means validation is passed for empty fields(user ne saare input fill kiye hai)... 
    if(validateUser()){

        console.log("validateUser ke andar hoon");
//        agar paddword != cpassword...
        if(password !== cpassword){
            
            console.log("password !== cpassword ke andar hoon");
            swal("Error!", "Passwords are not matched", "error");
            return;
        }
        
//        email ka format wrong hai... 
        else{
            if(checkEmail() === false){
                console.log('checkEmail ke andar hoon');
                 return;
            }
               
            console.log("chala");
            
//            js object banaya , key are exactly equal to keys which are used to get values of user in registrationServlet... 
            let data = {
                username : username,
                password : password,
                city : city,
                address : address,
                userid : adhar,
                email : email, 
                mobile : mobile,
                gender : gender
            };
            
            for (const key in data) {
                console.log(`${key}: ${data[key]}`);
             }
            
//            ab hum is data ko post(AJAX) ke help se servlet ko pass karenge... 
            let xhr = $.post("RegistrationControllerServlet", data , processResponse);
            xhr.fail(handleError);
            console.log("aaya");
        }
    }
}

//processResponse and handleError parameters lenge jo javascript inhe khud pass karegi...
//processResponse...
//responseText : success, uap yeb sab aayega... 
//textStatus : ok tha ya nai tha ye sab... 
//xhr : AJAX object... 

function processResponse(responseText) {
    console.log("processResponse");
    let str = responseText.trim();
    if(str === "success"){
        swal("Success", "Registration Successfully Done! You can Login", "success");
        setTimeout(redirectUser, 3000);
    }
        
    
    else if(str === "uap"){
        swal("Error", "Sorry! The userid is already presented!", "error");
    }
    
    else{
        swal("Error", "Registration Failed!, Try again", "error");
    }
}

//handleError ek parameter leta hai which xhr(AJAX object)
function handleError(xhr) {
    console.log("error Handler chala");
    swal("Error", "Problem in server communication! "+xhr.statusText, "error");
    console.log("swal ke baad");
}


//validate whether all the fileds are filled or not... 
function validateUser(){
    
    maleRadio = document.querySelector('input[name="gender"][value="male"]');
    femaleRadio = document.querySelector('input[name="gender"][value="female"]');
    if(username === ""|| password === "" || cpassword === "" || city === "" || address === "" || adhar === "" || email === "" || mobile === "" || (maleRadio.checked == false && femaleRadio.checked == false)){
        swal("Error!", "All fields are mandatory", "error");
        return false;
    }
    return true;
}

//validatation of email... 
function checkEmail() {
    
//    agar @ mil gaya to ye pos -1 chodkar kuch bhi sakti hai... 
    let attheratepos = email.indexOf('@');
    
    let dotpos = email.indexOf('.');
    
    if(attheratepos < 1 || dotpos < attheratepos +2 || dotpos+2 >= email.length){
        swal("Error!", "please enter a valid email", "error");
        return false;
    }
    return true;
}

//for redirecting user to login page... 
function redirectUser(){
    window.location = "login.html";
}