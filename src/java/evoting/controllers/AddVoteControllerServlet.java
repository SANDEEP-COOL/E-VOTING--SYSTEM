
package evoting.controllers;

import evoting.dto.CandidateVote;
import evoting.dao.VoteDao;
import evoting.dto.VoteDto;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class AddVoteControllerServlet extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher rd = null;
        HttpSession sess = request.getSession();
        String userid = (String)sess.getAttribute("userid");
        if(userid == null) {
            sess.invalidate();
            response.sendRedirect("accessdenied.html");
        }
        try{
            String candidateid = (String)request.getParameter("candidateid");
            String city = (String)request.getParameter("city");
            VoteDto vote = new VoteDto(candidateid, userid, city);
            boolean ans = VoteDao.addVote(vote);
            CandidateVote candidate = VoteDao.getVote(candidateid);
            if(ans == true) {
                sess.setAttribute("candidate", candidate);
            }
            request.setAttribute("ans", ans);
            rd = request.getRequestDispatcher("verifyVote.jsp");
        }
        catch(Exception ex) {
            ex.printStackTrace();
            request.setAttribute("exception", ex);
            rd = request.getRequestDispatcher("showException.js");
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
