package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("<!DOCTYPE html>\n");
      out.write("<!--\n");
      out.write("To change this license header, choose License Headers in Project Properties.\n");
      out.write("To change this template file, choose Tools | Templates\n");
      out.write("and open the template in the editor.\n");
      out.write("-->\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <script src=\"https://unpkg.com/sweetalert/dist/sweetalert.min.js\"></script>\n");
      out.write("        <!--<link href=\"stylesheet/backgroundimage.css\" rel=\"stylesheet\">-->\n");
      out.write("        <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css\" rel=\"stylesheet\" integrity=\"sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ\" crossorigin=\"anonymous\">\n");
      out.write("        <script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js\" integrity=\"sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe\" crossorigin=\"anonymous\"></script>\n");
      out.write("        <script src=\"https://code.jquery.com/jquery-3.6.0.min.js\"></script>\n");
      out.write("        <script src=\"https://kit.fontawesome.com/05d425af79.js\" crossorigin=\"anonymous\"></script>\n");
      out.write("        <link href=\"stylesheet/pageheader.css\" rel=\"stylesheet\">\n");
      out.write("        <link href=\"https://fonts.googleapis.com/css2?family=Montserrat:wght@100&display=swap\" rel=\"stylesheet\">\n");
      out.write("        <script src=\"https://kit.fontawesome.com/05d425af79.js\" crossorigin=\"anonymous\"></script>\n");
      out.write("        <style>\n");
      out.write("            body{\n");
      out.write("                background-image: url('images/election1.jpg');\n");
      out.write("                /*width: 100%;*/\n");
      out.write("                background-size: cover;\n");
      out.write("                background-repeat: no-repeat;\n");
      out.write("                font-family: 'Montserrat', sans-serif;\n");
      out.write("            }\n");
      out.write("            .shadow{\n");
      out.write("                box-shadow: rgba(50, 50, 93, 0.25) 0px 50px 100px -20px, rgba(0, 0, 0, 0.3) 0px 30px 60px -30px;\n");
      out.write("            }\n");
      out.write("            #main-h{\n");
      out.write("                padding: 10px 0 0 12px;\n");
      out.write("                letter-spacing: 8px;\n");
      out.write("            }\n");
      out.write("        </style>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("       \n");
      out.write("        \n");
      out.write("        <div class=\"d-flex justify-content-center align-items-center\" style=\"height: 100vh\">\n");
      out.write("            <div class=\"container\">\n");
      out.write("                <div class=\" mx-auto shadow text-light\" style=\"width: 70vw; height: 60vh; background-image: url('images/election.jpg'); background-repeat: no-repeat; background-size: cover\">\n");
      out.write("                    \n");
      out.write("                    <div class=\"d-flex\" style=\"height: 100%\">\n");
      out.write("                        <div>\n");
      out.write("                            <h1 id=\"main-h\">Vote For Change</h1>\n");
      out.write("                            <p style=\"font-size: 10px; letter-spacing: 5px; padding: 3px 0 0 13px;\">\"Making your voice heard, one vote at a time\"</p>\n");
      out.write("                            <div style=\"height: 352px\" class=\"p-5 d-flex flex-column justify-content-center align-items-center\">\n");
      out.write("                                <div class=\"mb-5\">\n");
      out.write("                                    \n");
      out.write("                                    <button type=\"button\" class=\" btn  text-dark shadow mx-3\" style=\"background-color: #6F4695; letter-spacing: 4px; font-size: 10px\"><strong><i class=\"fa-brands fa-facebook-f\"></i>FACEBOOK</strong></button>    \n");
      out.write("                                    <button type=\"button\" class=\"btn  text-dark shadow mx-3\" style=\"background-color: #6F4695; letter-spacing: 4px; font-size: 10px\"><strong><i class=\"fa-brands fa-instagram\"></i>INSTAGRAM</strong></button>    \n");
      out.write("                                    <button type=\"button\" class=\"btn  text-dark shadow mx-3\" style=\"background-color: #6F4695; letter-spacing: 4px; font-size: 10px\"><strong><i class=\"fa-brands fa-tiktok\"></i>TIKTOK</strong></button>    \n");
      out.write("                                </div>\n");
      out.write("                                <div>\n");
      out.write("                                    <button type=\"button\" class=\"btn  text-dark shadow mx-3\" style=\"background-color: #6F4695; letter-spacing: 4px; font-size: 10px\"><strong><i class=\"fa-brands fa-whatsapp\"></i>WATSAPP</strong></button>    \n");
      out.write("                                    <button type=\"button\" class=\"btn  text-dark shadow mx-3\" style=\"background-color: #6F4695; letter-spacing: 4px; font-size: 10px\"><strong><i class=\"fa-solid fa-mug-tea\"></i>KO-FI</strong></button>    \n");
      out.write("                                    <button type=\"button\" class=\"btn  text-dark shadow mx-3\" style=\"background-color: #6F4695; letter-spacing: 4px; font-size: 10px\"><strong><i class=\"fa-brands fa-paypal\"></i>PAYPAL</strong></button>    \n");
      out.write("                                    \n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                        <div>\n");
      out.write("                            \n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                    \n");
      out.write("                 </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        \n");
      out.write("        \n");
      out.write("      \n");
      out.write("\n");
      out.write("        \n");
      out.write("\n");
      out.write("    </body>\n");
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
