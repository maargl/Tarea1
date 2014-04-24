<%-- 
    Document   : editProducto
    Created on : 24-04-2014, 07:47:05 PM
    Author     : Jeremy
--%>


<%@page import="java.sql.ResultSet"%>
<%@page import="packages2.OracleBD"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edicion</title>
    </head>
    <body>
        
                    <%
                OracleBD baseDatos = new OracleBD().conectar();
                String id = request.getParameter("id");
                //String nombre = request.getParameter("Nombre");
                String descripcion = request.getParameter("Descripcion");
                String categoria = request.getParameter("Categoria");
                String stock = request.getParameter("Stock");
                String precio = request.getParameter("Precio");                
		
                if ("".equals(id)){
                    out.println("<h1>ERROR: ID no ingresada, por favor ingrese la ID pedida</h1>");
                }
                else{
                    if  (!"".equals(descripcion)){
                        if (baseDatos.ejecutar("UPDATE PRODUCTO SET DESCRIPCION ='"+descripcion+"' WHERE ID_PRODUCTO="+id+"")){          
                            out.println("<h3>-Descripcion actualizada!</h3>");            
                        }
                        else {
                            out.println("<h3>-Descripcion NO actualizada</h3>"); 
                        }
                    }
                    if  (!"".equals(stock)){
                        if (baseDatos.ejecutar("UPDATE PRODUCTO SET STOCK ="+stock+" WHERE ID_PRODUCTO="+id+"")){          
                            out.println("<h3>-Stock actualizado!</h3>");            
                        }
                        else {
                            out.println("<h3>-Stock NO actualizado</h3>"); 
                        }
                    }
                    if  (!"".equals(precio)){
                        if (baseDatos.ejecutar("UPDATE PRODUCTO SET PRECIO ="+precio+" WHERE ID_PRODUCTO="+id+"")){          
                            out.println("<h3>-Precio actualizado!</h3>");            
                        }
                        else {
                            out.println("<h3>-Precio NO actualizado</h3>"); 
                        }
                    }
                    if  (!"".equals(categoria)){
                        if (baseDatos.ejecutar("UPDATE PRODUCTO SET CATEGORIA ='"+ categoria +"' WHERE ID_PRODUCTO="+id+"")){          
                            out.println("<h3>-Categoria actualizada!</h3>");            
                        }
                        else {
                            out.println("<h3>-Categoria NO actualizada</h3>"); 
                        }
                    }
                }
                out.println("<a  href= http://localhost:8080/Pepes_Works/admin.xhtml >Volver</a>");
                
                /*if (baseDatos.ejecutar("INSERT INTO PRODUCTO(ID_PRODUCTO,STOCK,DESCRIPCION,CATEGORIA,PRECIO) VALUES('" + cod + "','"+ cantidad + "','"+ descripcion + "','"+ categoria + "','"+ precio +"')")){          
                    out.println("<h1>Producto Insertado!</h1>");            
                }
                else {
                    out.println("<h1>Producto no insertado</h1>"); 
                }*/
	%>
       
    </body>
</html>
