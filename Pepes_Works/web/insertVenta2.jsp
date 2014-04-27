<%-- 
    Document   : insertVenta2
    Created on : 27-04-2014, 02:53:14 PM
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
        <title>venta</title>
    </head>
    <body>
        <%
            String id_producto = request.getParameter("id_producto");
            String cantidad = request.getParameter("Cantidad");
            
            int a= 0;
            try{
                    Integer.parseInt(id_producto);
                    a++;
                }
            catch(NumberFormatException exc){
                    out.println("Id Producto invalido!");
                }
            try{
                    Integer.parseInt(cantidad);
                    a++;
             }
             catch(NumberFormatException exc){
                    out.println("cantidad invalida!");
                }
            if (a==2){
                OracleBD baseDatos = new OracleBD().conectar();                
                
                ResultSet resultados = baseDatos.consultar("SELECT ID_VENTA FROM VENTA WHERE MONTO_TOTAL=0");
                String id_venta =new String();
                 if (resultados != null) {
                    try {
                        while (resultados.next()) {
                            id_venta= resultados.getString("ID_VENTA");
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
                
                if (baseDatos.ejecutar("INSERT INTO DETALLE_VENTA VALUES(auto_inc_detalle_venta.nextval,"
                        +id_venta+","+id_producto+","+cantidad +")")){
                    out.println("Producto insertado");
                    
                    out.println("<h2><br></br><a href=\"insertVenta.jsp\">Ingresar siguiente Producto</a><br></br>");
                    out.println("<a href=\"finalizarVenta.jsp\">Finalizar</a><br></br></h2>");
                }
                else{
                    out.println("Producto NO insertado, verifique que el producto se encuentre en la base de datos");
                }
                
            }
            
            
            
        %>
    </body>
</html>
