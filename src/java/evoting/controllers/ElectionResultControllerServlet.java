
package evoting.controllers;

import evoting.dao.CandidateDao;
import evoting.dao.VoteDao;
import evoting.dto.CandidateDetails;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ElectionResultControllerServlet extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession sess = request.getSession();
        String userid = (String)sess.getAttribute("userid");
        if(userid == null){
            sess.invalidate();
            response.sendRedirect("showException.jsp");
            return;
        }
        RequestDispatcher rd = null;
        try{
//            is Map me bohot saare Entry objects (key value pairs) honge , yaha par humen LinkedHashMap ka object mil ra jo Map ki child hai... 
            Map<String , Integer> result = VoteDao.getResult();
//            saari Entry set ka collection humne Set me store karwa diya... 
            Set s = result.entrySet();
            
            System.out.println("set of entryset is = "+s);
//            aur us Set me hum iterate karenge...
            Iterator it = s.iterator();
            
//            ye LinkedHashMap candidateObject and unke votes ko as a key value pair ke form me store karwanne ke liye... 
            LinkedHashMap <CandidateDetails, Integer> resultDetails = new LinkedHashMap();
            
            while(it.hasNext()){
//                pehle candidate ka key value pair in form of Entry object...
                Map.Entry<String, Integer> e = (Map.Entry)it.next();
                System.out.println("++++ "+e);
//                pehle candidate ki key ko get karke db se uski poori details le lo... 
                CandidateDetails cd = CandidateDao.getDetailsById(e.getKey());
//                resultDetails me CandidateDetails ka object aur uske corresponding votes ko LinkedHashMap me store karwa rae hai... 
                resultDetails.put(cd, e.getValue());
                
            }
//            LinkedHashMap jsp ko send karna hai , aur total number of votes bhi send karna hai... 
            request.setAttribute("votecount", VoteDao.getVoteCount());
            request.setAttribute("result", resultDetails);
            rd = request.getRequestDispatcher("electionResult.jsp");
        }
        catch(Exception ex){
            System.out.println("inside ElectionResultContollerServlet");
            ex.printStackTrace();
            rd = request.getRequestDispatcher("showException.jsp");
        }
        finally{
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
