<%-- 
    Document   : ingresar_venta
    Created on : 26-04-2014, 10:56:36 PM
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
        <title>Nueva venta</title>
    </head>
    <body>
        <table border='3' width='600px' align='center' bgcolor='#F8F8FF'>
            <tr>
                <th>
                    <h2><b>Venta</b><br></br></h2>
                    <form action="insertVenta.jsp" method="post">
                        Cliente: <select name="Opcion"><%
                OracleBD baseDatos = new OracleBD().conectar();
		
                ResultSet resultados = baseDatos.consultar("SELECT RUT,NOMBRE  FROM CLIENTE");
                
		if (resultados != null) {
                    try {
                                       
                         while (resultados.next()) {
                              out.println("<option value=\""+resultados.getString("RUT")+"\">"+resultados.getString("NOMBRE")+"</option>");
                                                         
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
                       </select>
                       <input type="submit" value="Insertar Producto"></input><br></br>
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
