/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.UserDao;
import VO.Admin;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Nicolas
 */
public class LoginC extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    

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
    String login = (request.getParameter("usuario"));
        String pass = (request.getParameter("pass"));
        //Validaciones que deben ser realizadas
/*        
         Parameters should be validated against positive specs:
        – Data type (string, integer, real, etc…)
        – Minimum and maximum length
        – Whether null is allowed
        – Whether the parameter is required or not
        – Numeric range
        – Specific patterns (regular expressions)
        - Modify default error pages (404, 401, etc.)
        - Error Handling - Measures
        - Use strong authentication mechanisms:
                – Password policies (strength, use, change control, storage). – Secure transport (SSL).
                – Carefully implement forgotten password functionality.
                – Remove default usernames
        https://www.owasp.org/images/8/83/Securing_Enterprise_Web_Applications_at_the_Source.pdf
        
*/
        
        Admin datosUsuario = new Admin();
        datosUsuario.setUsuario(login);
        datosUsuario.setClave(pass);
        
        //Validaciones
        UserDao userDao = new UserDao();
        Admin sesion = userDao.validar(datosUsuario);
        HttpSession sesionUsuario = request.getSession();
        Admin _sesionUsuario = (Admin)sesionUsuario.getAttribute("usuario");
        if(_sesionUsuario==null){
            
         //El usuario no a creado la sesion
          if(sesion != null){
            sesionUsuario.setAttribute("usuario", sesion);
            sesionUsuario.setMaxInactiveInterval(20);
              System.out.println("adinnnn");
            response.sendRedirect("Admin.jsp");
          }else{
             response.sendRedirect("error.jsp");
          }
         
        }else{
            System.out.println("aaaaaa");
        
        
          request.setAttribute("Error", "Revisar usuario/ pass");
          RequestDispatcher rq =  request.getRequestDispatcher("index.jsp");
          rq.forward(request, response);
        }
        
        
        
        
        
        
    
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


