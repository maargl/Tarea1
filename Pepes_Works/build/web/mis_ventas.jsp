<%-- 
    Document   : mis_ventas
    Created on : 29-abr-2014, 18:19:47
    Author     : Marcelo Retamal
--%>
<%@page import="packages2.OracleBD"%>
<%@page import="java.sql.*" %>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mis Ventas</title>
    </head>
    <body>
        <table border='3' width='600px' align='center' bgcolor='#F8F8FF'>
            <tr>
                <th>
                    <%
                OracleBD baseDatos = new OracleBD().conectar();
                
                ResultSet resultados = baseDatos.consultar("select nombre from usuario WHERE RUT='"+
                        session.getAttribute("User")+"'");
                
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
                    out.println("Error en conexion");
                }
                
                %>
                    <form action="editar_productos.jsp" method="post">
                        <textarea name="productos" rows="20" cols="50" disabled><%
                //OracleBD baseDatos = new OracleBD().conectar();
		
                resultados = baseDatos.consultar("select * from VIEW_VENTASVENDEDOR WHERE RUT='"+session.getAttribute("User")+"'");
                
		if (resultados != null) {
                    try {
                        out.println("ID \t PRODUCTO:");  
                
                         while (resultados.next()) {
                              out.println(resultados.getString("id_producto")+"\t"+resultados.getString("DESCRIPCION"));                                
                        }
                    }
                    catch (Exception e) {
                        e.printStackTrace();
                    }
                }
                else{
                    out.println("Error en conexion");
                }
	%>
                       </textarea>
                         <br></br>                       
                   </form >         
                </th>  
            </tr>
         </table>
    </body>
</html>
