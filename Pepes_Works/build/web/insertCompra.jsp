<%@page import="packages2.OracleBD"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.io.IOException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="3" url=http://localhost:8080/Pepes_Works/ingresar_compra.xhtml">
        <title>Result</title>
    </head>
    <body>
        <%
             
		String id_producto = request.getParameter("Producto");
		String precio= request.getParameter("Precio");
                String cantidad= request.getParameter("Cantidad");
                int a = 0;
		try{
                    Integer.parseInt(id_producto);
                    a++;
                }
                catch(NumberFormatException exc){
                    out.println("Id Producto invalido!");
                }
                try{
                    Integer.parseInt(precio);
                    a++;
                }
                catch(NumberFormatException exc){
                    out.println("Precio invalido!");
                }
                try{
                    Integer.parseInt(cantidad);
                    a++;
                }
                catch(NumberFormatException exc){
                    out.println("Cantidad invalida!");
                }
                
                DateFormat dateFormat= new SimpleDateFormat("yy-MM-dd HH:mm:ss");
                Date date = new Date();
                String fecha=dateFormat.format(date);
                
                if (a==3){
                     OracleBD baseDatos = new OracleBD().conectar();
                     
                     ResultSet resultados = baseDatos.consultar("SELECT ID_DETALLE FROM DETALLE_COMPRA");
                     int cont=0;
                     if (resultados != null) {
                        try {
                                       
                             while (resultados.next()) {
                                 cont++;
                            } 
                        }catch (Exception e) {
                            e.printStackTrace();
                        }
                     }
                     String id=new String();
                     String monto=new String();
                     id="0";
                     int b=0;
                     ResultSet resultados2 = baseDatos.consultar("SELECT ID_COMPRA,MONTO_TOTAL FROM COMPRA");
                     if (resultados2 != null) {
                        try {
                                       
                             while (resultados2.next()) {
                                 id=resultados2.getString("ID_COMPRA");
                                 monto=resultados2.getString("MONTO_TOTAL");
                            }
                             
                             if (!"0".equals(monto)){
                                 if(baseDatos.ejecutar("INSERT INTO COMPRA(ID_COMPRA,MONTO_TOTAL) VALUES("+Integer.toString(Integer.parseInt(id)+1) +",0)")){
                                      b =Integer.parseInt(id)+1;
                                 }
                                 else{
                                     out.println("error en insert compra"); 
                                 }
                                
                             }
                             else{
                                 b =Integer.parseInt(id);
                             }
                             
                        }catch (Exception e) {
                            out.println("error en select compra");
                            e.printStackTrace();
                        }
                     }
                                        
                     
                     
                     
                     String idFinal = Integer.toString(b);
                     //out.println(fecha);
                
                    if (baseDatos.ejecutar("INSERT INTO DETALLE_COMPRA(ID_DETALLE,ID_COMPRA,ID_PRODUCTO,CANTIDAD,PRECIO) VALUES("+cont +"," + idFinal +  "," + id_producto +  ","+cantidad + ","+ precio + ")")){          
                        out.println("<h1>Producto Insertado!</h1>");
                                  
                        out.println("Ingreso: " + id_producto + "   Cantidad: "+ cantidad + "   Precio: " + precio + "      "+ fecha);
                        out.println("<h2><br></br><a href=\"ingresar_compra.xhtml\">Ingresar siguiente Producto</a><br></br>");
                        out.println("<a href=\"finalizarCompra.jsp\">Finalizar</a><br></br></h2>");
                    }
                    else {
                        out.println("<h1>Producto no insertado</h1>Verifique que producto este en la base de datos"); 
                    }
                    
                }
                
               
                
                
               
		/*} else {
			out.println("invalid login");
		}*/
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
