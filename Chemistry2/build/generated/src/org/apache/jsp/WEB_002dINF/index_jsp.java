package org.apache.jsp.WEB_002dINF;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import java.sql.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write('\n');
      out.write("   \n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html ng-app>\n");
      out.write("    <head>\n");
      out.write("    <title>Chemistry</title>\n");
      out.write("    <meta charset=\"utf-8\">\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("    <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css\">\n");
      out.write("    <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js\"></script>\n");
      out.write("    <script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js\"></script>\n");
      out.write("    <script src=\"http://code.angularjs.org/1.1.5/angular.min.js\"></script>\n");
      out.write("    <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css\">\n");
      out.write("    <script type = \"text/javascript\" src = \"js/three.js\"> </script>\n");
      out.write("    <script type = \"text/javascript\" src = \"js/atom.js\"> </script>\n");
      out.write("    <script type = \"text/javascript\" src = \"js/geometry.js\"> </script>\n");
      out.write("    <script type = \"text/javascript\" src = \"js/lattice.js\"> </script>\n");
      out.write("    <script type = \"text/javascript\" src = \"js/OrbitControls.js\"> </script>\n");
      out.write("    <script type = \"text/javascript\" src = \"js/TrackballControls.js\"> </script>\n");
      out.write("    <script type = \"text/javascript\" src = \"js/animations.js\"> </script>\n");
      out.write("    <script type = \"text/javascript\" src = \"js/angscript.js\"></script>\n");
      out.write("    <link rel=\"stylesheet\" href=\"index.css\">\n");
      out.write("  </head>\n");
      out.write("  <body ng-controller=\"Ctrl\" onload=\"init()\">\n");
      out.write("  <nav class=\"navbar navbar-inverse\">\n");
      out.write("  <div class=\"container-fluid\">\n");
      out.write("    <div class=\"navbar-header\">\n");
      out.write("      <button type=\"button\" class=\"navbar-toggle\" data-toggle=\"collapse\" data-target=\"#myNavbar\">\n");
      out.write("        <span class=\"icon-bar\"></span>\n");
      out.write("        <span class=\"icon-bar\"></span>\n");
      out.write("        <span class=\"icon-bar\"></span>                        \n");
      out.write("      </button>\n");
      out.write("      <a class=\"navbar-brand\" href=\"#\">ekshiksha</a>\n");
      out.write("    </div>\n");
      out.write("    <div class=\"collapse navbar-collapse\" id=\"myNavbar\">\n");
      out.write("      <ul class=\"nav navbar-nav\">\n");
      out.write("        <li class=\"active\" ><a href=\"#\">Home</a></li>\n");
      out.write("        <li><a href=\"#\">About</a></li>\n");
      out.write("        <li><a href=\"#\">Join us</a></li>\n");
      out.write("      </ul>\n");
      out.write("      <ul class=\"nav navbar-nav navbar-right\">\n");
      out.write("        <li><a href=\"#\"><span class=\"glyphicon glyphicon-log-in\"></span> Login</a></li>\n");
      out.write("      </ul>\n");
      out.write("    </div>\n");
      out.write("  </div>\n");
      out.write("</nav>\n");
      out.write(" <div class=\"container\">\n");
      out.write(" <div class=\"row\">\n");
      out.write("  <div class=\"col-sm-2\">\n");
      out.write("    <div class=\"sidebar-nav\">\n");
      out.write("      <div class=\"navbar navbar-default\" role=\"navigation\">\n");
      out.write("        <div class=\"navbar-header\">\n");
      out.write("          <button type=\"button\" class=\"navbar-toggle\" data-toggle=\"collapse\" data-target=\".sidebar-navbar-collapse\">\n");
      out.write("            <span class=\"sr-only\">Toggle navigation</span>\n");
      out.write("            <span class=\"icon-bar\"></span>\n");
      out.write("            <span class=\"icon-bar\"></span>\n");
      out.write("            <span class=\"icon-bar\"></span>\n");
      out.write("          </button>\n");
      out.write("          <span class=\"visible-xs navbar-brand\">Choose your topic</span>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"navbar-collapse collapse sidebar-navbar-collapse\">\n");
      out.write("           ");
      out.write("\n");
      out.write("\n");
      out.write("          <ul class=\"nav navbar-nav\">\n");
      out.write("\t\t  <h2>List of topics</h2>\n");
      out.write("\n");
      out.write("           <li value=\"-1\">\n");
      out.write("            \n");
      out.write("           ");

                try
                {
                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                    Connection myConn=DriverManager.getConnection("jdbc:mysql://localhost:3306/Chemistry2","root","shoot");
                    Statement mystmt=myConn.createStatement();
                    ResultSet myRs=mystmt.executeQuery("select * from subtopic");
            while(myRs.next())
            {
            
      out.write("\n");
      out.write("           <li value=\"");
      out.print(myRs.getInt("sub_id"));
      out.write("\" ng-model=\"url\"+");
      out.print(myRs.getInt("sub_id"));
      out.write(" ng-click=\"getUrl(url+");
      out.print(myRs.getInt("sub_id"));
      out.write(")\" ><a href='#'>");
      out.print(myRs.getString("subtopic_name"));
      out.write("</li>            \n");
      out.write("            ");

            }
                }
            catch(Exception e)
            {
                e.printStackTrace();
            }
            
            
      out.write("\n");
      out.write("            </li>\n");
      out.write(" \n");
      out.write("             \n");
      out.write("          </ul>\n");
      out.write("          \n");
      out.write("          \n");
      out.write("          \n");
      out.write("        </div>\n");
      out.write("      </div>\n");
      out.write("    </div>\n");
      out.write("  </div>\n");
      out.write("  <div class=\"col-sm-6\">\n");
      out.write("      <div width=\"700px\" height =\"800px\" id=\"animationCanvas\"></div>\n");
      out.write("            <!-- The Modal -->\n");
      out.write("        <div id=\"myModal\" class=\"modal\">\n");
      out.write("\n");
      out.write("          <!-- Modal content -->\n");
      out.write("          <div class=\"modal-content\">\n");
      out.write("            <span class=\"close\">&times;</span>\n");
      out.write("            <p id=\"modalinnerContent\">\n");
      out.write("            Central atom radius: <input type='number' id='central'><br><br>\n");
      out.write("            Bond length: <input type='number' id='bond'><br><br>\n");
      out.write("            <input type='submit' value='Create Shape' id='shapeCreate' onclick='getParams()'>\n");
      out.write("            </p>\n");
      out.write("          </div>\n");
      out.write("\n");
      out.write("        </div>\n");
      out.write("  </div>\n");
      out.write("  \n");
      out.write("   <div class=\"col-sm-3\">\n");
      out.write("    <div class=\"sidebar-nav2\">\n");
      out.write("      <div class=\"navbar navbar-default\" role=\"navigation\">\n");
      out.write("        <div class=\"navbar-header\">\n");
      out.write("          <button type=\"button\" class=\"navbar-toggle\" data-toggle=\"collapse\" data-target=\".sidebar-navbar-collapse\">\n");
      out.write("            <span class=\"sr-only\">Toggle navigation</span>\n");
      out.write("            <span class=\"icon-bar\"></span>\n");
      out.write("            <span class=\"icon-bar\"></span>\n");
      out.write("            <span class=\"icon-bar\"></span>\n");
      out.write("          </button>\n");
      out.write("          <span class=\"visible-xs navbar-brand\">Choose options</span>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"navbar-collapse collapse sidebar-navbar-collapse\" ng-include=\"tpl.contentUrl\" id=\"sidebar\">\n");
      out.write("                <!--Content goes here -->\n");
      out.write("        </div>\n");
      out.write("      </div>\n");
      out.write("    </div>\n");
      out.write("  </div>\n");
      out.write("</div>\n");
      out.write("</div>\n");
      out.write(" <script type = \"text/javascript\" src=\"js/appFunctions.js\"></script>         \n");
      out.write("</body>\n");
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
