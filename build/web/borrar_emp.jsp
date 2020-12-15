<%-- 
    Document   : borrar_emp
    Created on : 11/12/2020, 10:24:58 AM
    Author     : Gómez Rodrigo
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        Connection con=null;
        Statement st=null;
        ResultSet rs=null;
        
              try {

                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost/java_web_curso", "root", "");
                st = con.createStatement();
                st.executeUpdate("delete FROM empledos where id='"+request.getParameter("id")+"'");
                request.getRequestDispatcher("index.jsp").forward(request, response);
               } catch (Exception e) {
                   
              out.print(e);
               }

                                
        %>
        
    </body>
</html>
