<%-- 
    Document   : vendedor
    Created on : 27-04-2014, 05:47:34 PM
    Author     : Jeremy
--%>

<%@page import="packages2.OracleBD"%>
<%@page import="java.sql.*" %>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>Administrador</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    </head>
    <body>
        <table border='3' width='600px' align='center' bgcolor='#F8F8FF'>
            <tr>
                <th>
                    <h2><b><%
                        
                       OracleBD baseDatos = new OracleBD().conectar();
                       ResultSet vendedor = baseDatos.consultar("SELECT NOMBRE FROM USUARIO WHERE RUT='"+session.getAttribute("User")+"'");
                       if (vendedor != null) {
                            try {
                                while (vendedor.next()) {
                                    out.println(vendedor.getString("NOMBRE")+" : Vendedor");
                                }
                             } catch (Exception e) {
                                e.printStackTrace();
                             }
                        } 
                        
                            
                            
                    %></b></h2>
                    <form action="optionAdmin" method="post">
                        <select name="Opcion">
                            <option value="ingresar_cliente">Ingresar Cliente</option>
                            <option value="ingresar_ventas">Ingresar Ventas</option>
                            <option value="ver_ventas">Ver Ventas a Cliente</option>
                            <option value="mis_ventas">Mis Ventas</option>
                        </select><br></br>
                        <input type="submit" value="Enviar"></input> <br></br><br></br>
                        
                    </form>
                  
                </th>  
            </tr>
         </table>
    </body>
</html>
