<%-- 
    Document   : insertUser
    Created on : 27-04-2014, 01:39:16 PM
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
        <title>JSP Page</title>
    </head>
    <body>
        <%
             String nombre=request.getParameter("Usuario");
        String clave=request.getParameter("Contrasenna");
        session.setAttribute( "User", nombre );
        /*conexion conec= new conexion();
        conec.getConnection();*/
        //String text1= new String("18408267");
        //String text2= new String("1234567");
        
        OracleBD baseDatos = new OracleBD().conectar();
        
        ResultSet resultados = baseDatos.consultar("SELECT rut, contrasenna,tipo FROM usuario");
        
        if (resultados != null) {
            try {
                while (resultados.next()) {
                    if(nombre.equals(resultados.getString("RUT")) && clave.equals(resultados.getString("CONTRASENNA")) && "administrador".equals(resultados.getString("TIPO"))){
                        session.setAttribute("tipo", "administrador");
                        response.sendRedirect("admin.jsp");
                        break;
                    }
                    else if(nombre.equals(resultados.getString("RUT")) && clave.equals(resultados.getString("CONTRASENNA")) && "vendedor".equals(resultados.getString("TIPO"))){
                        response.sendRedirect("vendedor.jsp");
                        session.setAttribute("tipo", "vendedor");
                        break;
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        
        /*if ( (nombre.compareTo(text1) + clave.compareTo(text2)==0))         
        {
            response.sendRedirect("admin.xhtml");
        }*/
        else{
            out.println("<h1> Usuario y/o contraseña no validos!! </h1>");
        }
            %>
    </body>
</html>
