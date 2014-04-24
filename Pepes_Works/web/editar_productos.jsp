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
                    <h2><b>Edicion de Producto</b><br></br></h2>
                    <form action="editProducto.jsp" method="post"><h4>
                       <%
                String id=request.getParameter("Busqueda");
                OracleBD baseDatos = new OracleBD().conectar();
		
                ResultSet resultados = baseDatos.consultar("SELECT * FROM PRODUCTO");
                int a=0;
		if (resultados != null) {
                    try {
                                       
                         while (resultados.next()) {
                              if (id.equals(resultados.getString("ID_PRODUCTO"))){
                                  out.println("<center><table aling='left'>");
                                  out.println("<tr><td>Producto: </td><td><input type=\"text\" name=\"id\"> Por favor ingrese "+id+" aquí </input></td></tr>");
                                  out.println("<tr><td>Descripcion: </td><td>"+ " <input type=\"text\" name=\"Descripcion\"></input>   - "+resultados.getString("DESCRIPCION")+"</td></tr>");
                                  out.println("<tr><td>Categoria: </td><td>"+ "  <input type=\"text\" name=\"Categoria\"></input>   - "+resultados.getString("CATEGORIA")+"</td></tr>");
                                  out.println("<tr><td>Stock: </td><td>"+ "  <input type=\"text\" name=\"Stock\"></input>   - "+resultados.getString("STOCK")+"</td></tr>");
                                  out.println("<tr><td>Precio: </td><td>"+ "  <input type=\"text\" name=\"Precio\"> </input>  - "+resultados.getString("PRECIO")+"</td></tr>");
                                  out.println("</table></center><br></br>");
                                  out.println("<input type=\"submit\" value=\"Finalizar\"></input><br></br>");
                                  a++;
                              }
                              
                                
                        }
                        if (a==0){
                            out.println("Producto no Encontrado!");
                            out.println("<a  href= http://localhost:8080/Pepes_Works/administrar_productos.jsp >Volver</a>");
                            
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
                    </h4></form>
                  
                </th>  
            </tr>
         </table>
    </body>
</html>
