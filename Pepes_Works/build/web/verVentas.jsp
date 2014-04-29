<%-- 
    Document   : verVentas
    Created on : 29-04-2014, 02:49:32 PM
    Author     : Jeremy
--%>

<%@page import="packages2.OracleBD"%>
<%@page import="java.sql.*" %>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ventas</title>
    </head>
    <body>
        <table border='3' width='600px' align='center' bgcolor='#F8F8FF'>
            <tr>
                <th><%
                OracleBD baseDatos = new OracleBD().conectar();
                
                ResultSet resultados = baseDatos.consultar("select nombre from cliente WHERE RUT='"+
                        request.getParameter("Opcion")+"'");
                
		if (resultados != null) {
                    try {
                        while (resultados.next()) {
                              out.println("<h2><b>Ventas: "+resultados.getString("NOMBRE")+"</b><br></br></h2>");                                
                        }
                    }
                    catch (Exception e) {
                        e.printStackTrace();
                    }
                }
                else{
                    out.println("Error en coneccion");
                }
                
                %>
                    <form action="editar_productos.jsp" method="post">
                        <textarea name="productos" rows="20" cols="50" disabled><%
                //OracleBD baseDatos = new OracleBD().conectar();
		
                resultados = baseDatos.consultar("select * from VIEW_VENTASCLIENTE WHERE RUT='"+
                        request.getParameter("Opcion")+"'");
                
		if (resultados != null) {
                    try {
                        out.println("PRODUCTO:");  
                
                         while (resultados.next()) {
                              out.println("-"+resultados.getString("DESCRIPCION"));                                
                        }
                    }
                    catch (Exception e) {
                        e.printStackTrace();
                    }
                }
                else{
                    out.println("Error en coneccion");
                }
	%>
                       </textarea>
                         <br></br>                       
                   </form >         
                </th>  
            </tr>
         </table>
    </body>
    <%
          if ("administrador".equals(session.getAttribute("tipo"))){
              out.println("<h4><a href=\"admin.jsp\">Volver</a><br></br></h4>");
          }else{
             out.println("<h4><a href=\"vendedor.jsp\">Volver</a><br></br></h4>"); 
          }      
    %>
</html>
