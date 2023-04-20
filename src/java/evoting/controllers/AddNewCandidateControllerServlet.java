
package evoting.controllers;

import evoting.dao.CandidateDao;
import evoting.dto.CandidateDto;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.apache.tomcat.util.http.fileupload.servlet.ServletRequestContext;

public class AddNewCandidateControllerServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("AddNewCandidateControllerServlet me aa gaya");
        RequestDispatcher rd = null;
//        FileItem...
//          ServletFileUpload... 
        try{
            
//            change
            
//            change
            
            
            DiskFileItemFactory df = new DiskFileItemFactory(); 
            ServletFileUpload sfu = new ServletFileUpload(df);
            ServletRequestContext src = new ServletRequestContext(request);
            List<FileItem> items = sfu.parseRequest(src);
            
           ArrayList<String> objvalues = new  ArrayList<String>();
           InputStream file = null;
                   
            for(FileItem item : items){
                if(item.isFormField()){
//                    text... 
                    String key = item.getFieldName();
                    String val = item.getString();
                    System.out.println("Inside If key = "+key+" and value = "+val);
                    objvalues.add(val);
                }
                else{
//                    file...
                    file = item.getInputStream();
                    System.out.println("file = "+file);
                    String key = item.getFieldName();
                    String name = item.getName();
                    System.out.println("Inside Else key = "+key+" and name = "+name);
                }
            }
            
//            change
            String party = objvalues.get(2);
            String city = objvalues.get(3);
            boolean ans = CandidateDao.validateCandidateBaseUponCityAndParty(city, party);
            System.out.println("answer = "+ans);
            if(ans == false){
                System.out.println("candidate add nahi ho sakta");
                request.setAttribute("city", city);
                request.setAttribute("party", party);
                rd = request.getRequestDispatcher("CandidateCanNotPartInContest.jsp");
            }
            else if(ans == true){
                System.out.println("candidate add ho sakta");
                System.out.println("objvalues = "+objvalues);
                CandidateDto candidate = new CandidateDto(objvalues.get(0), objvalues.get(2), objvalues.get(3), objvalues.get(1), file);
                boolean result = CandidateDao.addCandidate(candidate);
                System.out.println(result);
                if(result == true)
                    rd = request.getRequestDispatcher("success.jsp");
                else
                    rd = request.getRequestDispatcher("failure.jsp");
            }
//            change     
//            System.out.println("objvalues = "+objvalues);
//            CandidateDto candidate = new CandidateDto(objvalues.get(0), objvalues.get(2), objvalues.get(3), objvalues.get(1), file);
//            boolean result = CandidateDao.addCandidate(candidate);
//            System.out.println(result);
//            if(result == true)
//                rd = request.getRequestDispatcher("success.jsp");
//            else
//                rd = request.getRequestDispatcher("failure.jsp");
        }
        catch(Exception ex){
            System.out.println("Exception in AddNewCandidateControllerServlet");
            ex.printStackTrace();
            request.setAttribute("exception", ex);
            rd = request.getRequestDispatcher("showException.jsp");
        }
        finally{
            if(rd != null)
                rd.forward(request, response);
        }
    }
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
