<%-- 
    Document   : insertProducto
    Created on : 22-04-2014, 11:46:51 PM
    Author     : Jeremy
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="packages2.OracleBD"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
                    <%
                OracleBD baseDatos = new OracleBD().conectar();
                String cod = request.getParameter("Codigo");
                //String nombre = request.getParameter("Nombre");
                String descripcion = request.getParameter("Descripcion");
                String categoria = request.getParameter("Categoria");
                String cantidad = request.getParameter("Cantidad");
                String precio = request.getParameter("Precio");                
		
                               
                if (baseDatos.ejecutar("INSERT INTO PRODUCTO(ID_PRODUCTO,STOCK,DESCRIPCION,CATEGORIA,PRECIO) VALUES('" + cod + "','"+ cantidad + "','"+ descripcion + "','"+ categoria + "','"+ precio +"')")){          
                    out.println("<h1>Producto Insertado!</h1>");            
                }
                else {
                    out.println("<h1>Producto no insertado</h1>"); 
                }
	%>
       
    </body>
    <%
          if ("administrador".equals(session.getAttribute("tipo"))){
              out.println("<h4><a href=\"admin.jsp\">Volver</a><br></br></h4>");
          }else{
             out.println("<h4><a href=\"vendedor.jsp\">Volver</a><br></br></h4>"); 
          }      
    %>
</html>
