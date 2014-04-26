<%-- 
    Document   : finalizarCompra
    Created on : 25-04-2014, 05:51:50 PM
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
        <title>Finalizar Compra</title>
    </head>
    <body>
        <table border='3' width='600px' align='center' bgcolor='#F8F8FF'>
            <tr>
                <th>
                    <h2><b>Compra</b><br></br></h2>
                    <%
                OracleBD baseDatos = new OracleBD().conectar();
		
                ResultSet resultados = baseDatos.consultar("SELECT ID_COMPRA FROM COMPRA WHERE MONTO_TOTAL=0");
                String id_compra=new String();
                
		if (resultados != null) {
                    try {
                        while (resultados.next()) {
                              id_compra= resultados.getString("ID_COMPRA");                                
                        }
                    }
                    catch (Exception e) {
                        e.printStackTrace();
                    }
                }
                else{
                    out.println("Error en coneccion");
                }
                
                out.println("Compra: "+id_compra+"<br></br>");
                out.println("ID PRODUCTO --------PRECIO<BR></BR>");
                int total=0;
                
                resultados = baseDatos.consultar("SELECT ID_PRODUCTO,PRECIO FROM DETALLE_COMPRA WHERE ID_COMPRA="+id_compra);
                
                if (resultados != null) {
                    try {
                        while (resultados.next()) {
                              total+= Integer.parseInt(resultados.getString("PRECIO"));
                              out.println(resultados.getString("ID_PRODUCTO")+"--------->"+resultados.getString("PRECIO")+"<br></br>");
                        }
                    }
                    catch (Exception e) {
                        e.printStackTrace();
                    }
                }
                else{
                    out.println("Error en coneccion");
                }
                if (baseDatos.ejecutar("UPDATE COMPRA SET MONTO_TOTAL="+total+" WHERE MONTO_TOTAL=0")){
                    out.println("<br></br><h2> Total: "+Integer.toString(total)+"<h2><br></br>");
                     out.println("Compra Ingresada");
                }
                else{
                    out.println("Compra No Ingresada");
                                       
                }
	%>
                       
                  
                </th>  
            </tr>
         </table>
        <a href="admin.xhtml">Volver</a><br></br>
    </body>
</html>
