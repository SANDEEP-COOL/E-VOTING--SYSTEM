package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class manageCandidate_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("\n");
      out.write("        <script src=\"jsscript/jquery.js\"></script>\n");
      out.write("        <script src=\"https://unpkg.com/sweetalert/dist/sweetalert.min.js\"></script>\n");
      out.write("        <link href=\"stylesheet/backgroundimage.css\" rel=\"stylesheet\">\n");
      out.write("        <link href=\"stylesheet/pageheader.css\" rel=\"stylesheet\">\n");
      out.write("        <link href=\"stylesheet/admin.css\" rel=\"stylesheet\">\n");
      out.write("        <script src=\"https://code.jquery.com/jquery-3.6.0.min.js\"></script>\n");
      out.write("<!--<script src=\"jsscript/adminOptionsManageCan.js\"></script>-->\n");
      out.write("        <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css\" rel=\"stylesheet\" integrity=\"sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC\" crossorigin=\"anonymous\">\n");
      out.write("        <script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js\" integrity=\"sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM\" crossorigin=\"anonymous\"></script>\n");
      out.write("        <style>\n");
      out.write("            body{\n");
      out.write("                height: 150%;\n");
      out.write("            }\n");
      out.write("        </style>\n");
      out.write("        <title>manage candidate</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        \n");
      out.write("        ");

            String userid=(String)session.getAttribute("userid");
            if(userid==null)
            {
                response.sendRedirect("accessdenied.html");
                return;
            }
            StringBuffer sf = new StringBuffer();
            sf.append("<div class='container d-flex flex-row mb-3'>"
                    + "<div onclick='showaddcandidateform()' class='shadow-lg p-3 mb-5 bg-body-tertiary rounded mx-2' style='width: 350px; height: 250px; background-image: url(images/addcandidate.png); background-size: cover; backgroun-repeat: no-repeat'></div>"
                    + "<div onclick='showupdatecandidateform()' class='shadow-lg p-3 mb-5 bg-body-tertiary rounded mx-2' style='width: 350px; height: 250px; background-image: url(images/update1.jpg); background-repeat: no-repeat; background-size: cover'></div>"
                    + "<div onclick='sandeep()' class='shadow-lg p-3 mb-5 bg-body-tertiary rounded mx-2' style='width: 350px; height: 250px; background-image: url(images/candidate.jpg); background-size: cover; background-size: background-repeat: no-repeat'></div>"
                    + "<div onclick='deletecandidate()' class='shadow-lg p-3 mb-5 bg-body-tertiary rounded mx-2' style='width: 350px; height: 250px; background-image: url(images/update3.jpg); background-size: cover; background-repeat: no-repeat'></div></div>"
                    + "<div class='container d-flex flex-row justify-content-around' style='justify-content: space-around; padding-top: 0px'>"
                    + "<div class='text-light'>Add Candidate</div>"
                    + "<div class='text-light'>Update Candidate</div>"
                    + "<div class='text-light'>Show Candidate</div>"
                    + "<div class='text-light'>Delete Candidate</div>"
                    + "</div>"
                    + "<div class='mt-5'  align='center' id='result'></div>");  //style='justify-content: space-around; padding-top: 30px' class='text-light container '
            
             out.println(sf);               

        
      out.write("\n");
      out.write("    </body>\n");
      out.write("    \n");
      out.write("    <script>\n");
      out.write("  \n");
      out.write("        function clearText(){\n");
      out.write("            console.log(\"chalaclear text\")\n");
      out.write("            document.getElementById('result').innerHTML  = \"\";\n");
      out.write("        }\n");
      out.write("        function sandeep() {\n");
      out.write("            clearText();\n");
      out.write("//            removeCandidateForm();\n");
      out.write("            var newdiv = document.createElement(\"div\");\n");
      out.write("            newdiv.setAttribute(\"id\", \"candidateform\");\n");
      out.write("            newdiv.setAttribute(\"float\", \"left\");\n");
      out.write("            newdiv.setAttribute(\"padding-left\", \"12px\");\n");
      out.write("            newdiv.setAttribute(\"border\", \"2px solid red\");\n");
      out.write("            newdiv.innerHTML = newdiv.innerHTML+\"<h3>Show Candidate</h3>\";\n");
      out.write("            newdiv.innerHTML = newdiv.innerHTML+\"<div style='color:white';font-weight: bold>Candidate Id : </div><div><select id='cid'></select></div>\";\n");
      out.write("            newdiv.innerHTML = newdiv.innerHTML+\"</br><span id ='addresp'></span>\";\n");
      out.write("            var addcand = $(\"#result\")[0];\n");
      out.write("            addcand.appendChild(newdiv);\n");
      out.write("            $(\"#candidateform\").hide();\n");
      out.write("            $(\"#candidateform\").fadeIn(3500);\n");
      out.write("            data = {data : \"cid\"};\n");
      out.write("\n");
      out.write("            \n");
      out.write("            $.post(\"ShowCandidateControllerServlet\", data, function(responseText){\n");
      out.write("               var candidateIdList = JSON.parse(responseText);\n");
      out.write("               var s = candidateIdList.cid;\n");
      out.write("               var a = document.getElementById(\"cid\");\n");
      out.write("               $(\"#cid\").append(s);\n");
      out.write("            });\n");
      out.write("\n");
      out.write("            $(\"#cid\").change(function(){\n");
      out.write("                var cid = $(\"#cid\").val();\n");
      out.write("                console.log(\"val = \"+cid);\n");
      out.write("                if(cid === ' '){\n");
      out.write("                    swal(\"No Selection\", \"Please Select An Id\",\"error\");\n");
      out.write("                }\n");
      out.write("                data = {data: cid};\n");
      out.write("                $.post(\"ShowCandidateControllerServlet\", data, function(responseText){\n");
      out.write("                    clearText();\n");
      out.write("                    var details = JSON.parse(responseText);\n");
      out.write("                    console.log(details);\n");
      out.write("                    $(\"#result\").append(details.candidateDetails);\n");
      out.write("                });\n");
      out.write("            });\n");
      out.write("\n");
      out.write("            \n");
      out.write("        }\n");
      out.write("\n");
      out.write("        function getDetails(event) {\n");
      out.write("            console.log(\"getDetails chal gaya\");\n");
      out.write("            console.log(\"event keyCode is \" + event.keyCode);\n");
      out.write("            if (event.keyCode === 13) {\n");
      out.write("\n");
      out.write("                data = { uid: $('#uid').val() };\n");
      out.write("                $.post('AddCandidateControllerServlet', data, function(responseText) {\n");
      out.write("                    let details = JSON.parse(responseText);\n");
      out.write("                    console.log(details);\n");
      out.write("                    let username = details.username;\n");
      out.write("                    let city = details.city;\n");
      out.write("                    if (username === \"wrong\")\n");
      out.write("                        swal(\"Wrong Adhar Number!\", \"Adhar No is Invalid\", \"error\");\n");
      out.write("                    else {\n");
      out.write("                        $('#cname').val(username);\n");
      out.write("                        $('#city').empty();\n");
      out.write("                        $('#clist').append(city);\n");
      out.write("                        $('#cname').prop('disabled', true);\n");
      out.write("                    }\n");
      out.write("                });\n");
      out.write("                return false;\n");
      out.write("            }\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        function showaddcandidateform(){\n");
      out.write("            clearText();\n");
      out.write("        //    form\n");
      out.write("            let str = `<div id=\"cont1\" class=\"d-flex justify-content-center\">\n");
      out.write("                    <form method=\"POST\" id=\"candidateform\" enctype=\"multipart/form-data\">\n");
      out.write("                        <div class=\"mb-3\">\n");
      out.write("                            <label for=\"candid\" class=\"form-label\">Cadidate Id : </label>\n");
      out.write("                            <input type=\"text\" class=\"form-control\" id=\"candid\">\n");
      out.write("                          </div>\n");
      out.write("\n");
      out.write("                          <div class=\"mb-3\">\n");
      out.write("                            <label for=\"uid\" class=\"form-label\" >User Id : </label>\n");
      out.write("                            <input type=\"text\" id=\"uid\" onkeypress='return getDetails(event)' class=\"form-control\" >\n");
      out.write("                          </div>\n");
      out.write("\n");
      out.write("                          <div class=\"mb-3\">\n");
      out.write("                            <label for=\"cname\" class=\"form-label\">Candidate Name : </label>\n");
      out.write("                            <input type=\"text\" id=\"cname\" class=\"form-control\" >\n");
      out.write("                          </div>\n");
      out.write("\n");
      out.write("                          <div class=\"mb-3\">\n");
      out.write("                            <label for=\"clist\" class=\"form-label\">City List : </label>\n");
      out.write("                            <select id=\"clist\"></select>\n");
      out.write("                          </div>\n");
      out.write("\n");
      out.write("                          <div class=\"mb-3\">\n");
      out.write("                            <label for=\"cparty\" class=\"form-label\">Candidate Party : </label>\n");
      out.write("                            <input type=\"text\" id=\"cparty\" class=\"form-control\" >\n");
      out.write("                          </div>\n");
      out.write("\n");
      out.write("                          <div class=\"mb-3\">\n");
      out.write("                            <input type=\"file\" name=\"files\" value=\"select-image\" id=\"cfile\" class=\"form-control\" >\n");
      out.write("                          </div>  \n");
      out.write("\n");
      out.write("                          <button type=\"button\" onclick=\"addcandidate()\">add</button>\n");
      out.write("                          <button onclick=\"clearText()\" type=\"reset\" value=\"clear\" class=\"btn btn-primary\">Clear</button>\n");
      out.write("                    </form>\n");
      out.write("                  </div>`;\n");
      out.write("        //    form\n");
      out.write("\n");
      out.write("        //    newdiv.innerHTML = newdiv.innerHTML+str;\n");
      out.write("        //    newdiv.innerHTML = newdiv.innerHTML+\"<br> <span id='addresp'></span>\";\n");
      out.write("            var addCand = $('#result')[0];\n");
      out.write("            addCand.innerHTML = addCand.innerHTML+str;\n");
      out.write("            $('#candidateform').hide();\n");
      out.write("            $('#candidateform').fadeIn(3500);\n");
      out.write("            data = {id : 'getid'};\n");
      out.write("                $.post('AddCandidateControllerServlet', data, function(responseText) {\n");
      out.write("               $('#candid').val(responseText);\n");
      out.write("               $('#candid').prop('disabled', true);\n");
      out.write("            });\n");
      out.write("        }\n");
      out.write("\n");
      out.write("            function removeCandidateForm(){\n");
      out.write("                let div = document.getElementById(\"cont1\");\n");
      out.write("                console.log(\"removecandidatechala\");\n");
      out.write("                console.log(div);\n");
      out.write("                let form = document.getElementsByTagName('form')[0];\n");
      out.write("                console.log(form);\n");
      out.write("                $('form').fadeOut(3500);\n");
      out.write("                div.remove();\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        function addcandidate(){\n");
      out.write("            var form = $('#candidateform')[0];\n");
      out.write("            console.log(form);\n");
      out.write("        //    data variable form me presented image copy ho jaa rahi hai... \n");
      out.write("            var data = new FormData(form);\n");
      out.write("\n");
      out.write("            alert(data);\n");
      out.write("\n");
      out.write("            data.append(\"candid\", $('#candid').val());\n");
      out.write("            data.append(\"uid\", $('#uid').val());\n");
      out.write("            data.append(\"cparty\", $('#cparty').val());\n");
      out.write("            data.append(\"clist\", $('#clist').val());\n");
      out.write("\n");
      out.write("            $.ajax({\n");
      out.write("                type: \"post\",\n");
      out.write("                enctype: \"multipart/form-data\",\n");
      out.write("                url: \"AddNewCandidateControllerServlet\",\n");
      out.write("                data: data,\n");
      out.write("                processData: false,\n");
      out.write("                contentType: false,\n");
      out.write("                cache: false,\n");
      out.write("                timeout: 60000,\n");
      out.write("                success: function(data){\n");
      out.write("                    console.log(\"/////////\"+data);\n");
      out.write("                    str=data;\n");
      out.write("\n");
      out.write("                    swal(\"Admin\", str, \"success\").then((value) => {\n");
      out.write("                        removeCandidateForm();\n");
      out.write("                        setTimeout(()=>{\n");
      out.write("                            showaddcandidateform();\n");
      out.write("                        }, 3000);\n");
      out.write("\n");
      out.write("                    });\n");
      out.write("                },\n");
      out.write("                error: function(e){\n");
      out.write("                    swal(\"Admin\", e, \"error\");\n");
      out.write("                }\n");
      out.write("            });   \n");
      out.write("        }\n");
      out.write("\n");
      out.write("        function deletecandidate() {\n");
      out.write("    console.log(\"chala\");\n");
      out.write("    $.post('GetCandidateIdToRemoveCandidateControllerServlet', null, function(response) {\n");
      out.write("        console.log(response);\n");
      out.write("        $(\"#result\").hide().html(response).fadeIn(3000);\n");
      out.write("        $('html, body').animate({\n");
      out.write("            scrollTop: $(window).scrollTop() + 800\n");
      out.write("        }, 1000);\n");
      out.write("        $(\"#myselect\").on('change', function() {\n");
      out.write("            var cid = $(this).find('option:selected').text();\n");
      out.write("            console.log(cid + \" \" + typeof(cid));\n");
      out.write("            $.post('GetCandidateDetailsForUser', { \"cid\": cid }, function(response) {\n");
      out.write("                $(\"#result\").hide().html(response).fadeIn(3000);\n");
      out.write("                $('html, body').animate({\n");
      out.write("                    scrollTop: $(window).scrollTop() + 800\n");
      out.write("                }, 1000);\n");
      out.write("                $.post('RemoveCandidateControllerServlet', { \"cid\": cid }, function(response) {\n");
      out.write("                    console.log(response);\n");
      out.write("                }).fail(function() {\n");
      out.write("                    // Handle failure if needed\n");
      out.write("                });\n");
      out.write("            });\n");
      out.write("        });\n");
      out.write("    }).fail(function() {\n");
      out.write("        // Handle failure if needed\n");
      out.write("    });\n");
      out.write("}\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("    </script>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
