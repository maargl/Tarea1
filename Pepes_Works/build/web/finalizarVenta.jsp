<%-- 
    Document   : finalizarVenta
    Created on : 27-04-2014, 03:23:57 PM
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
        <title>Fin Venta</title>
    </head>
    <body>
        <center>
        <table border='3' width='600px' align='center' bgcolor='#F8F8FF'>
            <tr>
                <th>
                    <b ><h1> Detalle Venta</h1></b> 
                    <br></br> 
        <%
                OracleBD baseDatos = new OracleBD().conectar();
                
                ResultSet cliente = baseDatos.consultar("SELECT NOMBRE FROM CLIENTE WHERE RUT='"+session.getAttribute("id_cliente")+"'");
                if (cliente != null) {
                    try {
                        while (cliente.next()) {
                            out.println("Cliente: "+cliente.getString("NOMBRE")+"<br></br> Rut cliente: "+session.getAttribute("id_cliente")+"<br></br>");
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
                
                ResultSet vendedor = baseDatos.consultar("SELECT NOMBRE FROM USUARIO WHERE RUT='"+session.getAttribute("User")+"'");
                if (vendedor != null) {
                    try {
                        while (vendedor.next()) {
                            out.println("Vendedor: "+vendedor.getString("NOMBRE")+"<br></br> Rut vendedor: "+session.getAttribute("User")+"<br></br>");
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
                
                
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
                 
                out.println("<br></br>PRODUCTOS:<br></br>"); 
                 
                resultados = baseDatos.consultar("SELECT ID_PRODUCTO,CANTIDAD FROM DETALLE_VENTA WHERE ID_VENTA="+id_venta);
                int total=0;
                if (resultados != null) {
                    try {
                        while (resultados.next()) {
                            ResultSet resultados2 = baseDatos.consultar("SELECT DESCRIPCION,PRECIO,STOCK FROM PRODUCTO WHERE ID_PRODUCTO="
                                    +resultados.getString("ID_PRODUCTO"));
                            if (resultados2!=null){
                                while(resultados2.next()){
                                    int cant=Integer.parseInt(resultados2.getString("STOCK"))-Integer.parseInt(resultados.getString("CANTIDAD"));
                                    if(cant>=0){
                                        total+=Integer.parseInt(resultados.getString("CANTIDAD"))*Integer.parseInt(resultados2.getString("PRECIO"));
                                        out.println(resultados2.getString("DESCRIPCION")+"--->"
                                            +Integer.toString(Integer.parseInt(resultados.getString("CANTIDAD"))*Integer.parseInt(resultados2.getString("PRECIO")))+
                                                "<br></br>");
                                    
                                    
                                        baseDatos.ejecutar("UPDATE PRODUCTO SET STOCK=" +Integer.toString(cant)+
                                                "WHERE ID_PRODUCTO="+resultados.getString("ID_PRODUCTO"));
                                        
                                    }
                                    else{
                                        out.println(resultados2.getString("DESCRIPCION")+"SIN Stock!!");
                                    }
                                    
                                }
                            }
                            baseDatos.ejecutar("UPDATE VENTA SET MONTO_TOTAL=" +Integer.toString(total)+
                                                "WHERE ID_VENTA="+id_venta);
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
                
                out.println("<br></br><h2> Total: "+Integer.toString(total)+"</h2><br></br>");
            
        %>
                    </th>
                <br></br><br></br>                
            </tr>
        </table>
        <a href="admin.jsp">Volver</a><br></br>
        </center>   
    </body>
</html>
