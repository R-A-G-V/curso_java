<%-- 
    Document   : login
    Created on : 11/12/2020, 10:42:15 AM
    Author     : Gómez Rodrigo
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
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
        <title>Login</title>
    </head>
    <body>
        <div class="container mt-5">
            <div class="row ">
                <div class="col-sm">
                    <form method="post" action="login.jsp">
                        <div class="form-group">
                            <label>Usuario</label>
                            <input type="text" class="form-control" name="user" placeholder="Ingrese usuario">
                        </div>
                        <div class="form-group">
                            <label>Password</label>
                            <input type="password" class="form-control" name="password" placeholder="Ingrese contraseña">
                        </div>

                        <button type="submit" class="btn btn-primary" name="login">Login</button>
                    </form>
                    <%

                        Connection con = null;
                        Statement st = null;
                        ResultSet rs = null;
                        encriptador enc= new encriptador();
                        if (request.getParameter("login") != null) {
                            String user = request.getParameter("user");
                            String password = request.getParameter("password");
                            HttpSession sesion = request.getSession();

                            try {
                                Class.forName("com.mysql.jdbc.Driver");
                                con = DriverManager.getConnection("jdbc:mysql://localhost/java_web_curso", "root", "");
                                st = con.createStatement();
                                rs = st.executeQuery("SELECT * FROM user where user='" + user + "' and password='" + enc.getMD5(password) + "'");
                                while (rs.next()) {
                                    sesion.setAttribute("logueado", 1);
                                    sesion.setAttribute("user", rs.getString("user"));
                                    sesion.setAttribute("id", rs.getString("id"));
                                    response.sendRedirect("p_principal.jsp");
                                }
                                out.print("<div class=\"alert alert-danger\" role=\"alert\">usuario incorrecto</div>");
                            } catch (Exception e) {
                            }
                        }
                    %>
                </div>
            </div>
        </div>
    </body>

</html>
