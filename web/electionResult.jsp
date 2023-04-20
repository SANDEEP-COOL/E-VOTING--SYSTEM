<%-- 
    Document   : showResult
    Created on : 16 Apr, 2023, 11:18:15 AM
    Author     : sande
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, evoting.dto.CandidateDetails"%>
<!DOCTYPE html>
<html>
    <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Election Result</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
     <link href="stylesheet/backgroundimage.css" rel="stylesheet">
    </head
     
    <body>
        <div class="container mt-4 ">
            <table class="table text-light table-bordered table-dark shadow-lg p-3 mb-5 bg-white rounded">
            <thead class="table-danger">
              <tr>
                <th scope="col">#</th>
                <th scope="col">CANDIDATE ID</th>
                <th scope="col">USER ID</th>
                <th scope="col">NAME</th>
                <th scope="col">CITY</th>
                <th scope="col">PARTY</th>
                <th scope="col">SYMBOL</th>
                <th scope="col">TOTAL VOTE</th>
              </tr>
            </thead>
            <tbody>
                 <%
                    int count = 0;
                    HttpSession sess = request.getSession();
                    String userid = (String)sess.getAttribute("userid");
                    if(userid == null){
                        sess.invalidate();
                        response.sendRedirect("accessdenied.jsp");
                        return;
                    }
                    LinkedHashMap<CandidateDetails, Integer> result = (LinkedHashMap<CandidateDetails, Integer>) request.getAttribute("result");
                    Integer totalvote = (Integer)request.getAttribute("votecount");
                    Iterator it = result.entrySet().iterator();
                    while(it.hasNext()){
                        Map.Entry<CandidateDetails, Integer> e = (Map.Entry)it.next();
                        CandidateDetails candidate = e.getKey();
                        String candidateid = candidate.getCandidateid();
                        String name = candidate.getCandidatename();
                        String city = candidate.getCity();
                        String party = candidate.getParty();
                        String cuid = candidate.getUserid();
//                        String symbol = candidate.getSymbol(); 
                        float vote = (float) result.get(candidate);
                        float perVote = (vote / 100) * (float) totalvote;
                  %>
                   <tr>
                    <th scope="row "><%= count++ %></th>
                    <td><%= candidateid %></td>
                    <td><%= cuid %></td>
                    <td><%= name %></td>
                    <td><%= city %></td>
                    <td><%= party %></td>
                    <td><img src='data:image/jpg;base64,<%= candidate.getSymbol()%>' style='width:300px;height:200px;'/></td>
                    <td><%= perVote %>%</td>
                  </tr>
                  <% } %>
            </tbody>
          </table>
        </div>
       
    </body>
</html>
