/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.sql.*;
import java.util.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Jeremy
 */
@WebServlet(urlPatterns = {"/optionAdmin"})
public class optionAdmin extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //response.setContentType("admin/xhtml;charset=UTF-8");
        String opcion=request.getParameter("Opcion");
        
        if (opcion.equals("ingresar_vendedor")){
            response.sendRedirect("ingresar_vendedor.xhtml");
        }
        
        else if (opcion.equals("ingresar_cliente")){
            response.sendRedirect("ingresar_cliente.xhtml");
        }
        
        else if (opcion.equals("administrar_productos")){
            response.sendRedirect("administrar_productos.jsp");
        }
        else if (opcion.equals("ingresar_compra")){
           
            response.sendRedirect("ingresar_compra.xhtml");           
            
        }
        
        else if (opcion.equals("ingresar_ventas")){           
            response.sendRedirect("ingresar_venta.jsp");    
        }
        
        else{
            try (PrintWriter out = response.getWriter()) {
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Error!!</title>");
                out.println("<body>");
                out.println("<h1> Pagina en construccion </h1>");
                out.println("</body>");
                out.println("</html>");
            }
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
