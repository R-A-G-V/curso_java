/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servelets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.tomcat.dbcp.dbcp2.DriverManagerConnectionFactory;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.*;

/**
 *
 * @author Gómez Rodrigo
 */
@WebServlet(name = "empleado", urlPatterns = {"/empleado"})
public class empleado extends HttpServlet {

    Connection con = null;
    Statement st = null;
    ResultSet rs = null;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try (PrintWriter out = response.getWriter()) {

            try {

                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost/java_web_curso", "root", "");
                st = con.createStatement();
                rs = st.executeQuery("SELECT * FROM empledos");
                while (rs.next()) {
                    out.print("<tr>"
                    +"<th scope = \"row\" >"+rs.getString(1)+"</th> "
                    +"<td>"+rs.getString(2)+"</td>"
                    +"<td>"+rs.getString(3)+"</td>"
                    +"<td>"+rs.getString(4)+"</td>" 
                    +"<td>"
                   + "<a href=\"editar_emp.jsp?id=" + rs.getString(1) + "&nombre=" + rs.getString(2) + "&direccion=" + rs.getString(3) + "&telefono=" + rs.getString(4) + "\"><i class=\"fas fa-user-edit\"></i></a>"
                    +"<a href=\"borrar_emp.jsp?id=" + rs.getString(1) + "\" class=\"ml-1\"><i class=\"fas fa-trash-alt\"></i></a>"
                    +"</td>"
                    +"</tr>" 
                    );                                
                }
            } catch (Exception e) {
                out.print("error de conexion" + e);
            }

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
