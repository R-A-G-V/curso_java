package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class p_005fprincipal_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css\" integrity=\"sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm\" crossorigin=\"anonymous\">\n");
      out.write("        <link href=\"icon/fontawesome-free-5.15.1-web/css/all.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("        <title>Pagina Principal</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");

            HttpSession sesion = request.getSession();
            if (sesion.getAttribute("logueado") == null || sesion.getAttribute("logueado").equals("0")) {
                response.sendRedirect("login.jsp");
            }

        
      out.write("\n");
      out.write("        <div class=\"container mt-5\">\n");
      out.write("            <div class=\"row\">\n");
      out.write("                <div class=\"col-sm\">\n");
      out.write("                    <nav class=\"navbar navbar-expand-lg navbar-light bg-light\">\n");
      out.write("                        <div class=\"collapse navbar-collapse\" id=\"navbarTogglerDemo02\">\n");
      out.write("                            <ul class=\"navbar-nav mr-auto mt-2 mt-lg-0\">\n");
      out.write("                                <li class=\"nav-item\">\n");
      out.write("                                    <a class=\"btn btn-outline-danger\" href=\"ventas.jsp\">Ventas</a>\n");
      out.write("                                </li>\n");
      out.write("                                <li class=\"nav-item\">\n");
      out.write("                                    <a class=\"btn btn-outline-success\" href=\"productos.jsp\">Productos</a>\n");
      out.write("                                </li>\n");
      out.write("                                <li class=\"nav-item\">\n");
      out.write("                                     <a class=\"btn btn-outline-primary\" href=\"index.jsp\">Empleados</a>\n");
      out.write("                                </li>\n");
      out.write("                                <li class=\"nav-item\">\n");
      out.write("                                     <a class=\"btn btn-outline-secondary\" href=\"reportes.jsp\">Reportes</a>\n");
      out.write("                                </li>\n");
      out.write("                            </ul>\n");
      out.write("                            <form class=\"form-inline my-2 my-lg-0\" action=\"cerrar_sesion.jsp\">\n");
      out.write("                                <a href=\"datos_usuario.jsp\"><i class=\"fas fa-chalkboard-teacher\"></i> ");
      out.print(sesion.getAttribute("user"));
      out.write("</a>\n");
      out.write("                                <button class=\"btn btn-outline-danger my-2 my-sm-0 ml-2\" type=\"submit\">Cerrar Sesion</button>\n");
      out.write("                            </form>\n");
      out.write("                        </div>\n");
      out.write("                    </nav>\n");
      out.write("                                <img src=\"icon/img/gention-de-ventas-cover.png\" alt=\"\"/>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
