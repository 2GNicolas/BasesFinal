/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.ProductoDAO;
import Modelo.ProductoVDAO;
import VO.ProdCarrito;
import VO.Producto;
import VO.Producto_Vendido;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Nicolas
 */
public class ControladorCarrito extends HttpServlet {

    ProductoDAO daop;
    ProductoVDAO daov;
     List<ProdCarrito> pp = new ArrayList<>(100);
    //es el constructor del Servlet
    @Override
    public void init() throws ServletException {
        this.daop = new ProductoDAO();
        this.daov = new ProductoVDAO();
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
       
if(request.getParameter("Cargar") != null){
    listar(request, response);
}
if(request.getParameter("agregar") != null){
    
   int id = Integer.parseInt(request.getParameter("ID"));
   int cantidad = Integer.parseInt(request.getParameter("Cantidad"));
   Producto p = null;
   if(id != 0){
       try {
          p= this.daop.Buscar(id);
          Producto pn = new Producto(p.getId_P(), p.getNombre(), p.getCantidad()-cantidad, p.getP_Compra(), p.getP_Venta());
          this.daop.actualizar(pn);
           Producto_Vendido pv = new Producto_Vendido();
           pv.setCantidad(id);
           pv.setId_P(id);
           daov.insertar(pv);
           ProdCarrito pc = new ProdCarrito(id, p.getNombre(),cantidad ,cantidad*(int)p.getP_Venta());
          pp.add(pc);
           System.out.println(pp.size());
          
          request.setAttribute("carrito", pp);
            RequestDispatcher rq = request.getRequestDispatcher("index.jsp");
            rq.forward(request, response);
          
       } catch (SQLException ex) {
           Logger.getLogger(ControladorProductos.class.getName()).log(Level.SEVERE, null, ex);
       }
    
   }

}
if(request.getParameter("eliminar") != null){
  
       pp = new ArrayList<>();
       //pp.remove(p);
       request.setAttribute("carrito", pp);
       RequestDispatcher rq = request.getRequestDispatcher("index.jsp");
       rq.forward(request, response);
      
   
}
        //Capturar los parametros.
        // nombre--> el name de la clase donde está el login.
       
//Validaciones - SQL Inyection.
if (request.getParameter("total") != null) {
    int total=0;
    for (int i = 0; i < pp.size(); i++) {
        total = +  (int)pp.get(i).getPrecioT();
    }
    String cadena = Integer.toString(total);
    request.setAttribute("totalizado", cadena);
            RequestDispatcher rq = request.getRequestDispatcher("index.jsp");
            rq.forward(request, response);
}
         }
    private void listar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        
            
            request.setAttribute("carrito", pp);
            RequestDispatcher rq = request.getRequestDispatcher("GestionarProducto.jsp");
            rq.forward(request, response);
    
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