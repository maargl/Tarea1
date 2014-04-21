/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.sql.*;
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
@WebServlet(urlPatterns = {"/insertUser"})
public class insertUser extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    public insertUser() {
        super();
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //response.setContentType("index/xhtml;charset=UTF-8");
        //aqui hay que comparar con la base de datos
        String nombre=request.getParameter("Usuario");
        String clave=request.getParameter("Contrasenna");
        /*conexion conec= new conexion();
        conec.getConnection();*/
        //String text1= new String("18408267");
        //String text2= new String("1234567");
        
        OracleBD baseDatos = new OracleBD().conectar();
        
        ResultSet resultados = baseDatos.consultar("SELECT rut, contrasenna,tipo FROM usuario");
        
        if (resultados != null) {
            try {
                while (resultados.next()) {
                    if(nombre.equals(resultados.getString("RUT")) && clave.equals(resultados.getString("CONTRASENNA")) && "administrador".equals(resultados.getString("TIPO"))){
                        response.sendRedirect("admin.xhtml");
                        break;
                    }
                    else if(nombre.equals(resultados.getString("RUT")) && clave.equals(resultados.getString("CONTRASENNA")) && "vendedor".equals(resultados.getString("TIPO"))){
                        //response.sendRedirect("admin.xhtml");
                        break;
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        
        /*if ( (nombre.compareTo(text1) + clave.compareTo(text2)==0))         
        {
            response.sendRedirect("admin.xhtml");
        }*/
        else
        {
           try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Error!!</title>");
            out.println("<body>");
            out.println("<h1> Usuario y/o contraseña no validos!! </h1>");
            out.println("</body>");
            out.println("</html>");
        }
        }
    }
        
        
    //}

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
