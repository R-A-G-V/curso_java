<%-- 
    Document   : p_principal
    Created on : 14/12/2020, 09:26:34 AM
    Author     : Gómez Rodrigo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="icon/fontawesome-free-5.15.1-web/css/all.css" rel="stylesheet" type="text/css"/>
        <title>Pagina Principal</title>
    </head>
    <body>
        <%
            HttpSession sesion = request.getSession();
            if (sesion.getAttribute("logueado") == null || sesion.getAttribute("logueado").equals("0")) {
                response.sendRedirect("login.jsp");
            }

        %>
        <div class="container mt-5">
            <div class="row">
                <div class="col-sm">
                    <nav class="navbar navbar-expand-lg navbar-light bg-light">
                        <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
                            <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
                                <li class="nav-item">
                                    <a class="btn btn-outline-danger" href="ventas.jsp">Ventas</a>
                                </li>
                                <li class="nav-item">
                                    <a class="btn btn-outline-success" href="productos.jsp">Productos</a>
                                </li>
                                <li class="nav-item">
                                     <a class="btn btn-outline-primary" href="index.jsp">Empleados</a>
                                </li>
                                <li class="nav-item">
                                     <a class="btn btn-outline-secondary" href="reportes.jsp">Reportes</a>
                                </li>
                            </ul>
                            <form class="form-inline my-2 my-lg-0" action="cerrar_sesion.jsp">
                                <a href="datos_usuario.jsp"><i class="fas fa-chalkboard-teacher"></i> <%=sesion.getAttribute("user")%></a>
                                <button class="btn btn-outline-danger my-2 my-sm-0 ml-2" type="submit">Cerrar Sesion</button>
                            </form>
                        </div>
                    </nav>
                                <center>
                                    <img src="icon/img/gention-de-ventas-cover.png"  width="600" height="600"/>
                                </center>
                                
                </div>
            </div>
        </div>
    </body>
</html>
