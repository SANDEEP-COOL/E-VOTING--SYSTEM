<%-- 
    Document   : showAllUsersForDeleting
    Created on : 30 Jul, 2023, 8:19:23 AM
    Author     : sande
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/WEB-INF/tag.tld" prefix="c"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Remove User</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@1,900&display=swap" rel="stylesheet">
        <style>
            
            body{
                background-image: url('images/election1.jpg');
                background-repeat: no-repeat;
                background-size: cover;
            }
            .customeFont{
                font-family: 'Montserrat', sans-serif;
                font-weight: 900;
                font-size: 20px;
            }
        </style>
    </head>
    
    
    <body>
        
        <c:printuserslist list="${requestScope.userlist}"/>
        
    </body>
    <script>
        
        function askAgain() {
            
           
        }
        
    </script>
</html>
