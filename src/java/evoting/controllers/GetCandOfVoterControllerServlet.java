
package evoting.controllers;

import evoting.dao.SelectedCandByVoterInfoDao;
import evoting.dto.SelectedCandByVoterInfoDto;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.simple.JSONObject;

public class GetCandOfVoterControllerServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession sess = request.getSession();
        String userid = (String)sess.getAttribute("userid");
        try{
            SelectedCandByVoterInfoDto cand = SelectedCandByVoterInfoDao.getVotersCandidateInfo(userid);
            JSONObject obj = new JSONObject();
            obj.put("name", cand.getUSERNAME());
            obj.put("ADDRESS", cand.getADDRESS());
            obj.put("CITY", cand.getCITY());
            obj.put("EMAIL_ID", cand.getEMAIL_ID());
            obj.put("MOBILE_NO", cand.getMOBILE_NO());
            obj.put("GENDER", cand.getGENDER());
            String jsonStr = obj.toJSONString();
            response.getWriter().print(jsonStr);
        }
        catch(SQLException se){
            System.out.println("Exception in GetCandOfVoterControllerServlet");
            se.printStackTrace();
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
