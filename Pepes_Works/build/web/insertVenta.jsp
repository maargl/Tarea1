<%-- 
    Document   : insertVenta
    Created on : 27-04-2014, 12:46:20 PM
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
        <title>Venta producto</title>
    </head>
    <body>
        <table border='3' width='600px' align='center' bgcolor='#F8F8FF'>
            <tr>
                <th>
                    <h2><b>Insertar Producto</b><br></br></h2><%
                String opcion=request.getParameter("Opcion");
                session.setAttribute("id_cliente", opcion);
                
                OracleBD baseDatos = new OracleBD().conectar();
                
                 ResultSet resultados = baseDatos.consultar("SELECT MONTO_TOTAL FROM VENTA");
                 String monto =new String();
                 if (resultados != null) {
                    try {
                        while (resultados.next()) {
                            monto= resultados.getString("MONTO_TOTAL");
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
                if (!"0".equals(monto)){
                    baseDatos.ejecutar("INSERT INTO VENTA(ID_VENTA,ID_CLIENTE,ID_USUARIO,MONTO_TOTAL) VALUES(auto_inc_venta.nextval,'"
                        +opcion+"','"+session.getAttribute("User")+"',0)");
                }
		
                /*baseDatos.ejecutar("INSERT INTO VENTA(ID_VENTA,ID_CLIENTE,ID_USUARIO,MONTO_TOTAL) VALUES(auto_inc_venta.nextval,'"
                        +opcion+"','"+session.getAttribute("User")+"',0)");*/
                
		//out.println(session.getAttribute("User"));
	%>
                    <form action="insertVenta2.jsp" method="post">
                        ID Producto: <input type="text" name="id_producto"></input><br></br>
                        Cantidad: <input type="text" name="Cantidad"></input><br></br>
                        <input type="submit" value="OK"></input><br></br> 
                    </form>      
                    
                </th>  
            </tr>
         </table>
    </body>
</html>
