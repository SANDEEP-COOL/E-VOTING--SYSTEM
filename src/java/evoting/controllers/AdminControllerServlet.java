
package evoting.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AdminControllerServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        System.out.println("//////////////cjwhvjadddddddddddddjqkasjddddddddddddddddddddddbkccccccccccccc");
        RequestDispatcher rd = null;
        
//        ab hume check karna hai ki user logged in hai ki ni ok , to sabse pehle us user ke session ko get karo... 
        HttpSession sess = request.getSession();
        
        try{
//        user ke session me stored id ko get karo... 
            String userid = (String)sess.getAttribute("userid");

//        ab agar user id  null hai to , iska mtlb user loggin nahi hai...
            if(userid == null){
//                to asa user jo loggedin hi ni h ase user ki session ko destory kar do uske session object ko server me rakho hi ni...
                sess.invalidate();
//                ab user ko accessDenied html page me send kar do... 

//                ek bohot normal se cheez hai ki accessDenied ek normal sa static html page hai jise hume is sevlet se koi data send nahi , 
//                vo ek independent html page hai to yaha se hume send redirect ka use karna chahiye...
                response.sendRedirect("accessdenied.html");
            }

//              user logged in hai... 
//              ab agar user logged in hai iska matlab hume is request ko aage continue rekhna hai isiye hum yaha par forward use karenge...
                System.out.println("hhh");
                rd = request.getRequestDispatcher("adminOptions1.jsp");

        }
        catch(Exception ex){
            ex.printStackTrace();
            rd = request.getRequestDispatcher("showException.jsp");
            request.setAttribute("exception", ex);
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
