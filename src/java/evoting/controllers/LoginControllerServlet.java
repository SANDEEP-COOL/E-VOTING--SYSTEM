
package evoting.controllers;

import evoting.dao.UserDao;
import evoting.dto.UserDto;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class LoginControllerServlet extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        RequestDispatcher rd = null;
        
//        ye details login page se AJAX ke through aa rahi hai... 
        String userid = request.getParameter("userid");
        String password = request.getParameter("password");
        UserDto user = new UserDto(userid, password);
        
        //change
        System.out.println(user.toString());
        
//        ab hume UserDao se interact karna hai try and catch() lagenge... 
        try{
            String result = UserDao.validateUser(user);
//            ab result me 3 me se ek cheez aayegi... 
//            1 voter
//            2 admin
//            3 null
            request.setAttribute("result", result);
            
//            userid islye kyuki loginResponse is userid ka session bhi to start karega...
            request.setAttribute("userid", userid);
            
            rd = request.getRequestDispatcher("loginResponse.jsp");
            
        }
        catch(SQLException se) {
            se.printStackTrace();
            rd = request.getRequestDispatcher("showException.jsp");
            request.setAttribute("exception", se);
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
