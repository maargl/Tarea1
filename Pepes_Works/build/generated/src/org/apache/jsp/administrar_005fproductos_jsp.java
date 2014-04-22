package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import packages2.OracleBD;
import java.sql.*;
import java.sql.ResultSet;

public final class administrar_005fproductos_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Administrar</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <table border='3' width='600px' align='center' bgcolor='#F8F8FF'>\n");
      out.write("            <tr>\n");
      out.write("                <th>\n");
      out.write("                    <h2><b>administrar Productos</b><br></br></h2>\n");
      out.write("                    <form action=\"insertProducto\" method=\"post\">\n");
      out.write("                        \n");
      out.write("                        <textarea value=\"Productos\" rows=\"20\" cols=\"50\">\n");
      out.write("    ");

                OracleBD baseDatos = new OracleBD().conectar();
		
                ResultSet resultados = baseDatos.consultar("SELECT ID_PRODUCTO,STOCK,DESCRIPCION  FROM PRODUCTO");
                
		if (resultados != null) {
                    try {
                        out.println("ID_PRODUCTO\tDESCRIPCION\tSTOCK");  
                
                         while (resultados.next()) {
                              out.println(resultados.getString("ID_PRODUCTO")+"\t "+resultados.getString("DESCRIPCION")+"\t "+ resultados.getString("STOCK"));
                                
                        }
                    }
                    catch (Exception e) {
                        e.printStackTrace();
                    }
                }
                else{
                    out.println("Error en coneccion");
                }
	
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("                         </textarea><br></br> \n");
      out.write("                        Buscar: <input type=\"text\" name=\"Busqueda\"></input><br></br><br></br>    \n");
      out.write("                        <input type=\"submit\" value=\"Editar Producto\"></input> \n");
      out.write("                        <input type=\"submit\" value=\"Agregar Producto\"></input><br></br><br></br>\n");
      out.write("                        \n");
      out.write("                    </form>\n");
      out.write("                  \n");
      out.write("                </th>  \n");
      out.write("            </tr>\n");
      out.write("         </table>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
