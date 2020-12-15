<%-- 
    Document   : crear_em
    Created on : 10/12/2020, 12:48:44 AM
    Author     : Gómez Rodrigo
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="icon/fontawesome-free-5.15.1-web/css/all.css" rel="stylesheet" type="text/css"/>
        <title>Crear empleado</title>
    </head>
    <body>
        <div class="container mt-5">
            <div class="row">
                <div class="col-sm">
                    <form action="crear_em.jsp" method="post">
                        <div class="form-group">
                            <label for="nombre">Nombre</label>
                            <input type="text" name="txtnom" class="form-control" id="nombre" placeholder="Nombre" required="required">
                        </div>
                        <div class="form-group">
                            <label for="direccion">Direccion</label>
                            <input type="text" name="txtdirecc" class="form-control" id="direccion" placeholder="Direccion" required="required">
                        </div>
                        <div class="form-group">
                            <label for="telefono">Telefono</label>
                            <input type="text" name="txttelef" class="form-control" id="telefono" placeholder="Telefono" required="required">
                        </div>
                        <button type="submit" name="enviar" class="btn btn-primary">Guardar <i class="fas fa-save"></i></button>
                    </form>
                </div>
            </div>
        </div>
        <% if (request.getParameter("enviar") != null) {
                String nombre = request.getParameter("txtnom");
                String direccion = request.getParameter("txtdirecc");
                String telefono = request.getParameter("txttelef");

                try {
                    Connection con=null;
                    Statement st=null;
                    
                    Class.forName("com.mysql.jdbc.Driver");
                    con=DriverManager.getConnection("jdbc:mysql://localhost/java_web_curso","root","");
                    st=con.createStatement();
                    st.executeUpdate("insert into empledos(nombre, direccion, telefono) values ('"+nombre+"', '"+direccion+"', '"+telefono+"');");
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                } catch (Exception e) {
                    out.print(e);
                }
            }
        %>
    </body>
</html>
