<%-- 
    Document   : ssDD
    Created on : 28 Apr, 2023, 8:45:29 AM
    Author     : sande
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div onclick='redirectvotingpage()' class="resp1 itemsSize d-flex flex-column align-items-center bg-color shadow round">
            <img style='opacity: 0.8' src='images/user1.png' width="100px" class='image-fluid mt-5 mb-4'/>
            <p style="letter-spacing: 2px; font-size: 12px" class="mt-5 text-light">Dear <strong>Voter</strong> ! ! Welcome You In the <strong>Voter</strong> Pannel...</p>
            <button type="button" class="btn btn-outline-light mt-5 shadow">Click Here</button>
        </div>
    </body>
    <script>
        function redirectvotingpage() {
            window.location = "VotingControllerServlet1.java";
        }
    </script>
</html>
