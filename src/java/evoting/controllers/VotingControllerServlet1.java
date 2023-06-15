
package evoting.controllers;

import evoting.dao.CandidateDao;
import evoting.dao.VoteDao;
import evoting.dto.CandidateVote;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class VotingControllerServlet1 extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher rd = null;
        HttpSession sess = request.getSession();
        System.out.println("aaaaaaaaaaaaaaaaaaaaaaa");
        String userid = (String)sess.getAttribute("userid");
        if(userid == null){
            sess.invalidate();
            response.sendRedirect("accessdenied.html");
            return;
        }
        try{
            String cid = VoteDao.getCandidateIdOfVoter(userid);
            System.out.println("cid = "+cid);
            if(cid == null){
                ArrayList<CandidateVote> candidatelist = CandidateDao.viewCandidate(userid);
                request.setAttribute("candidatelist", candidatelist);
//                request.setAttribute("hello", hello);
                rd = request.getRequestDispatcher("showCandidate2.jsp");
            }
            else{
                CandidateVote candidate = VoteDao.getVote(cid);
                request.setAttribute("candidate", candidate);
                rd = request.getRequestDispatcher("voteDenied.jsp");
            }
        } 
        catch(Exception ex){
            System.out.println("exception inside VotingControllerServlet");
            ex.printStackTrace();
            request.setAttribute("exception", ex);
            rd = request.getRequestDispatcher("showException.jsp");
        }
        finally{
            
            rd.forward(request, response);
            return;
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
