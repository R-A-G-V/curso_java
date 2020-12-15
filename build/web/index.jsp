<%-- 
    Document   : index
    Created on : 09/12/2020, 11:14:59 AM
    Author     : Gómez Rodrigo
--%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="icon/fontawesome-free-5.15.1-web/css/all.css" rel="stylesheet" type="text/css"/>
        <title>Lista de empleados</title>

    </head>

    <body>
        <%
            HttpSession sesion = request.getSession();
            if (sesion.getAttribute("logueado") == null || sesion.getAttribute("logueado").equals("0")) {
                response.sendRedirect("login.jsp");
            }

        %>
        <div class="container">
            <nav class="navbar navbar-light bg-light justify-content-between">
                <a class="navbar-brand">Lista de Empleados</a>
<!--                <form class="form-inline" action="p_principal.jsp">
                    <button class="btn btn-outline-danger my-2 my-sm-0 ml-2" type="submit">Atras</button>
                </form>-->
            </nav>
            <div class="row mt-2">
                <div class="col-sm">
                    <form action="index.jsp" method="get">
                  
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th scope="col" class="text-center"></th>
                                <th scope="col" class="text-center">
                                    <input type="text" name="nombre" class="form-control" placeholder="Buscar empleado"/> 
                                </th>
                                <th scope="col" class="text-center">
                                    <input type="submit" value="Buscar" name="buscar" class="form-control btn btn-primary" />
                                </th>
                                <th></th>
                                <th scope="col">
                                    <a href="crear_em.jsp"><i class="fas fa-user-plus"></i></a>
                                </th>
                            </tr>
                            <tr>
                                <th scope="col">Id</th>
                                <th scope="col">Nombre</th>
                                <th scope="col">Direccion</th>
                                <th scope="col">Telefono</th>
                                <th scope="col">Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <jsp:include page="empleado"/>
                        </tbody>
                    </table>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>