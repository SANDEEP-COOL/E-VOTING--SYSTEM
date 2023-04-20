<%@page import="evoting.dto.CandidateDetails"%>
<%@page import="evoting.dao.CandidateDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
    </head>
    <body>
        <%
            CandidateDetails candidate = (CandidateDetails)request.getAttribute("cid");
            System.out.println("candidate: "+candidate);
            StringBuffer sf = new StringBuffer();
            sf.append("<div class='card mx-auto mt-3' style='width: 18rem;'>"
                      + "<div style=\"background-image: url('data:image/jpg;base64,"+candidate.getSymbol()+"'); width: 250px; height: 200px; background-size: cover; background-repeat: no-repeat; background-position: center center;\"></div>"
                      + "<ul class='list-group list-group-flush '><li class='bg-dark text-light  list-group-item'><strong>Name :</strong><span>"+candidate.getCandidatename()+"</span></li>"
                      + "<li class='bg-dark text-light list-group-item'><strong>CandidateId :</strong><span>"+candidate.getCandidateid()+"</span></li>"
                      + "<li class='bg-dark text-light list-group-item'><strong>City :</strong><span>"+candidate.getCity()+"</span></li>"
                      + "<li class='bg-dark text-light list-group-item'><strong>Party :</strong><span>"+candidate.getParty()+"</span></li>"
                      + "<li class='bg-dark text-light list-group-item'><strong>UserId :</strong><span>"+candidate.getUserid()+"</span></li></ul>"
                      + "<li class='bg-dark text-light list-group-item text-center'><strong>Candidate Is Removed Successfully</strong></li>");
            
            response.setContentType("text/html");
            response.getWriter().write(sf.toString());
        %>
    </body>
</html>
