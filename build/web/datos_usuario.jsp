<%-- 
    Document   : datos_usuario
    Created on : 11/12/2020, 11:18:13 AM
    Author     : Gómez Rodrigo
--%>


<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="utileria.encriptador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="icon/fontawesome-free-5.15.1-web/css/all.css" rel="stylesheet" type="text/css"/>
        <title>Datos del Usuario</title>
    </head>
    <body>
        <%
            HttpSession sesion = request.getSession();
            if (sesion.getAttribute("logueado") == null || sesion.getAttribute("logueado").equals("0")) {
                response.sendRedirect("datos_usuario.jsp");
            }
            Connection con = null;
            Statement st = null;
           
        %>
        
        <div class="container mt-5">
            <div class="row">
                <div class="col-sm">
                    <form action="datos_usuario.jsp" method="post">
                        <div class="form-group">
                            <label>User</label>
                            <input type="text" class="form-control" name="user" placeholder="Ingrese usuario" value="<%=sesion.getAttribute("user")%>">
                        </div>
                        <div class="form-group">
                            <label>Password</label>
                            <input type="password" class="form-control" name="password" placeholder="Ingrese contraseña" >
                        </div>
                        <div class="form-group">
                            <label>Repita Password</label>
                            <input type="password" class="form-control" name="Repetir_password" placeholder="Ingrese nuevamente su contraseña">
                        </div>

                        <button type="submit" class="btn btn-primary" name="guardar">Guardar</button>
                        <a href="p_principal.jsp" class="btn btn-danger">Cancelar</a>
                    </form>
                </div>
            </div>
        </div>
    </body>
    <%
    if(request.getParameter("guardar")!=null){
       String user=request.getParameter("user");
       String password=request.getParameter("password");
       String Repetir_password=request.getParameter("Repetir_password");
       encriptador enc= new encriptador();
       if(password.equals(Repetir_password)){
           try {
                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost/java_web_curso", "root", "");
                    st = con.createStatement();
                    st.executeUpdate("update user set user='"+ user +"', password='" + enc.getMD5(password) + "' where id='"+sesion.getAttribute("id")+"';");
                    sesion.setAttribute("user", user);
                    response.sendRedirect("index.jsp");
           } catch (Exception e) {
               out.print(e);
               }
       }
       else{
           out.print("password diferentes");
       }
    }
    %>
</html>
