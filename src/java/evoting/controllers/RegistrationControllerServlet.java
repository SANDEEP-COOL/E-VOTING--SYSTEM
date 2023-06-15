
package evoting.controllers;

import evoting.dao.RegistrationDao;
import evoting.dto.UserDetails;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class RegistrationControllerServlet extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
//        request dispatcher ka object bana liya...
        RequestDispatcher rd = null;
        
//        UserDetails class ka object create karo... 
        UserDetails user = new UserDetails();
        
//        ab ajax ka deta means user ki details ko AJAX se fetch karna hai...
        user.setUserId(request.getParameter("userid"));
        
        user.setPassword(request.getParameter("password"));
        
        user.setAddress(request.getParameter("address"));
        
        user.setCity(request.getParameter("city"));
        
        user.setEmailId(request.getParameter("email"));
        
//        change
        user.setGender(request.getParameter("gender"));
//        request.getParameter hume string value deta hai but hume to use long me convert karna padega...

        try{
            user.setMobile(Long.parseLong(request.getParameter("mobile")));
        }
        catch(NumberFormatException nfe){
            nfe.printStackTrace();
            return;
        }

        user.setUserName(request.getParameter("username"));

      
//        ab humne try isliye lagaya hai kyuki ab code database se interact karega...
        try{
//            sabse pehle mujhe ye pata karna hai ki kya ye user pehle se exist karta hai ki nahi... 
            boolean result = false, userFound = false;
            
            if(!RegistrationDao.searchUser(user.getUserId())){
//                means user ko register karna chahiye... 
                result = RegistrationDao.registerUser(user);
            }
//                means user pehle se hi exist karta hai... 
            else
                userFound = true;
                
//                ab hume jsp page ko teen cheeze send karna hai... 
//                1 userFound : jisse jsp ko pata chale...kyuki agar user hai to hume alag process karna hai otherwise alag... 
//                2 result : jisse hume pata chale ki user ka registration hoa ki ni hoa... 
//                3 username : beacause jsp is username ke base par kuch information agar dena ha to de de... 

//                ye saari information jsp ke pass jaayengi but jsp inhe display nahi karge...vo ise AJAX ko pass karega... 
            request.setAttribute("result", result);
            request.setAttribute("userFound", userFound);
            request.setAttribute("username", user.getUserName());

//                ab agar koi exception nahi h , to jsp ko data send karne ke liye hume RequestDispatcher need hai... 
            rd = request.getRequestDispatcher("registrationresponse.jsp");
        }
        catch(SQLException ex){
            ex.printStackTrace();
            
//            jab hum showException.jsp me jaayenge to hume exception bhi to send karna hoga na, otherwise pata kaise chalega
//            ki kon si exception aayi hai...
            request.setAttribute("exception", ex);
            
//            ab agar exception aati hai to hume exceptions ko handle karne ke liye ek jsp page to banana padega... 
            rd = request.getRequestDispatcher("showException.jsp");
        }
        finally{
//            ya to rd 62 line wala chalega ya phir 72 line wala... 
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
