<%-- 
    Document   : administrar_productos
    Created on : 21-04-2014, 11:10:17 PM
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
        <title>Administrar</title>
    </head>
    <body>
        <table border='3' width='600px' align='center' bgcolor='#F8F8FF'>
            <tr>
                <th>
                    <h2><b>Administrar Productos</b><br></br></h2>
                    <form action="insertProducto" method="post">
                        
                        <textarea value="Productos" rows="20" cols="50"><%
                OracleBD baseDatos = new OracleBD().conectar();
		
                ResultSet resultados = baseDatos.consultar("SELECT ID_PRODUCTO,STOCK,DESCRIPCION  FROM PRODUCTO");
                
		if (resultados != null) {
                    try {
                        out.println("ID\tDESCRIPCION\tSTOCK");  
                
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
	%>


                         </textarea><br></br> 
                        Buscar: <input type="text" name="Busqueda"></input><br></br><br></br>    
                        <input type="submit" value="Editar Producto"></input> 
                        <input type="submit" value="Agregar Producto"></input><br></br><br></br>
                        
                    </form>
                  
                </th>  
            </tr>
         </table>
    </body>
</html>
