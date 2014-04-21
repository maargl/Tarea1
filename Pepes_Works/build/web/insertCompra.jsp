<%-- 
    Document   : insertCompra
    Created on : 19-04-2014, 11:16:20 PM
    Author     : Jeremy
--%>




<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.io.IOException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Result</title>
    </head>
    <body>
        <%
             
		String id_producto = request.getParameter("Producto");
		String precio= request.getParameter("Precio");
                String cantidad= request.getParameter("Cantidad");
		try{
                    Integer.parseInt(id_producto);
                }
                catch(NumberFormatException exc){
                    out.println("Id Producto invalido!");
                }
                try{
                    Integer.parseInt(precio);
                }
                catch(NumberFormatException exc){
                    out.println("Precio invalido!");
                }
                try{
                    Integer.parseInt(cantidad);
                }
                catch(NumberFormatException exc){
                    out.println("Cantidad invalida!");
                }
                
                DateFormat dateFormat= new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
                Date date = new Date();
                String fecha=dateFormat.format(date);
                
                out.println("Ingreso: " + id_producto + "   Cantidad: "+ cantidad + "   Precio: " + precio + "      "+ fecha);
                
		/*} else {
			out.println("invalid login");
		}*/
	%>
    </body>
</html>
