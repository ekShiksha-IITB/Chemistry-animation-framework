package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
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

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("<head>\n");
      out.write("  <title>Chemistry</title>\n");
      out.write("  <meta charset=\"utf-8\">\n");
      out.write("  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("  <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css\">\n");
      out.write("  <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js\"></script>\n");
      out.write("  <script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js\"></script>\n");
      out.write("  <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css\">\n");
      out.write("          <script type = \"text/javascript\" src = \"js/three.js\"> </script>\n");
      out.write("        <script type = \"text/javascript\" src = \"js/Linear.js\"> </script>\n");
      out.write("        <script id=\"octahedralScript\" type = \"text/javascript\" src = \"js/Octahedral.js\"> </script>\n");
      out.write("        <script type = \"text/javascript\" src = \"js/tetrahedral.js\"> </script>\n");
      out.write("\n");
      out.write("        <script type = \"text/javascript\" src = \"js/OrbitControls.js\"> </script>\n");
      out.write("        <script type = \"text/javascript\" src = \"js/TrackballControls.js\"> </script>\n");
      out.write("  <style>\n");
      out.write(" \n");
      out.write("\n");
      out.write("  .sidebar-nav .navbar ul {\n");
      out.write("    float: none;\n");
      out.write("    display: block;\n");
      out.write("  }\n");
      out.write("  .sidebar-nav .navbar li {\n");
      out.write("    float: none;\n");
      out.write("    display: block;\n");
      out.write("  }\n");
      out.write("  .sidebar-nav .navbar li a {\n");
      out.write("    padding-top: 12px;\n");
      out.write("    padding-bottom: 12px;\n");
      out.write("  }\n");
      out.write(".sidebar-nav .navbar li a:hover {\n");
      out.write("   background-color:green;\n");
      out.write("  }\n");
      out.write(" .sidebar-nav2{\n");
      out.write("width:200px;\n");
      out.write(" margin-left:160px;}\n");
      out.write(" \n");
      out.write(" .sidebar-nav2 .navbar li {\n");
      out.write("    float: none;\n");
      out.write("    display: block;\n");
      out.write("  }\n");
      out.write("  .sidebar-nav2 .navbar li {\n");
      out.write("    padding-top: 12px;\n");
      out.write("    padding-bottom: 12px;\n");
      out.write("  }\n");
      out.write("                      /* The Modal (background) */\n");
      out.write("        .modal {\n");
      out.write("            display: none; /* Hidden by default */\n");
      out.write("            position: fixed; /* Stay in place */\n");
      out.write("            z-index: 1; /* Sit on top */\n");
      out.write("            left: 0;\n");
      out.write("            top: 0;\n");
      out.write("            width: 100%; /* Full width */\n");
      out.write("            height: 100%; /* Full height */\n");
      out.write("            overflow: auto; /* Enable scroll if needed */\n");
      out.write("            background-color: rgb(0,0,0); /* Fallback color */\n");
      out.write("            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        /* Modal Content/Box */\n");
      out.write("        .modal-content {\n");
      out.write("            background-color: #fefefe;\n");
      out.write("            margin: 15% auto; /* 15% from the top and centered */\n");
      out.write("            padding: 20px;\n");
      out.write("            border: 1px solid #888;\n");
      out.write("            width: 80%; /* Could be more or less, depending on screen size */\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        /* The Close Button */\n");
      out.write("        .close {\n");
      out.write("            color: #aaa;\n");
      out.write("            float: right;\n");
      out.write("            font-size: 28px;\n");
      out.write("            font-weight: bold;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .close:hover,\n");
      out.write("        .close:focus {\n");
      out.write("            color: black;\n");
      out.write("            text-decoration: none;\n");
      out.write("            cursor: pointer;\n");
      out.write("        }\n");
      out.write(" input[type=\"radio\"]{\n");
      out.write("  margin: 0 10px 0 10px;\n");
      out.write("}\n");
      out.write("\n");
      out.write("  </style>\n");
      out.write("  </head>\n");
      out.write("  <body>\n");
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
      out.write("          <ul class=\"nav navbar-nav\">\n");
      out.write("\t\t  <h2>List of topics</h2>\n");
      out.write("           <!-- <li id=\"linear\" onclick=\"getVal(1)\">Linear</li>\n");
      out.write("            <li id=\"octahedral\" onclick=\"getVal(2)\">Octahedral</li>-->\n");
      out.write("           <li><a href='#'>Structure of an Atom</a></li>\n");
      out.write("           <li><a href='#'>Chemical bonding (VSEPR)</a></li>\n");
      out.write("           <li><a href='#'>Crystal Structure</a></li>\n");
      out.write("           <li><a href='#'>Chemical Reactions</a></li>\n");
      out.write("\n");
      out.write("           \n");
      out.write("            \n");
      out.write("          </ul>\n");
      out.write("        </div>\n");
      out.write("      </div>\n");
      out.write("    </div>\n");
      out.write("  </div>\n");
      out.write("  <div class=\"col-sm-6\">\n");
      out.write("  <div width=\"700px\" height=\"800px\" style=\"border:1px solid black\" id=\"animationCanvas\">\n");
      out.write("         \n");
      out.write("  </div>\n");
      out.write("            <!-- The Modal -->\n");
      out.write("        <div id=\"myModal\" class=\"modal\">\n");
      out.write("\n");
      out.write("          <!-- Modal content -->\n");
      out.write("          <div class=\"modal-content\">\n");
      out.write("            <span class=\"close\">&times;</span>\n");
      out.write("            <p id=\"modalinnerContent\">\n");
      out.write("            Central atom radius: <input type='number' id='central'><br><br>\n");
      out.write("            Bond thickness: <input type='number' id='bond'><br><br>\n");
      out.write("            Node radius: <input type='number' id='node'><br><br>\n");
      out.write("            <input type='submit' value='Create Shape' id='shapeCreate' onclick='getParams()'>\"\n");
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
      out.write("          <span class=\"visible-xs navbar-brand\">Choose your method</span>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"navbar-collapse collapse sidebar-navbar-collapse\">\n");
      out.write("\n");
      out.write("        <center>\n");
      out.write("            <label>Compounds<br><br></label>\n");
      out.write("        \n");
      out.write("        <select class=\"form-control\" id=\"compound\">\n");
      out.write("            <option value=\"-1\">Choose compound</option>\n");
      out.write("            \n");
      out.write("            ");

                try
                {
                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                    Connection myConn=DriverManager.getConnection("jdbc:mysql://localhost:3306/Chemistry","root","shoot");
                    Statement mystmt=myConn.createStatement();
                    ResultSet myRs=mystmt.executeQuery("select * from VSEPR");
            while(myRs.next())
            {
            
      out.write("\n");
      out.write("            <option value=\"");
      out.print(myRs.getInt("compound_id"));
      out.write("\" >");
      out.print(myRs.getString("compound_name"));
      out.write("</option>\n");
      out.write("            \n");
      out.write("            ");

            }
                }
            catch(Exception e)
            {
                e.printStackTrace();
            }
            
            
      out.write("\n");
      out.write("        </select>\n");
      out.write("        <button onclick=\"showval()\">Go!</button>\n");
      out.write("    </center>\n");
      out.write("          <div class=\"nav navbar-nav\">\n");
      out.write("\t\t  <h2>Shapes</h2>\n");
      out.write("                  <div id='options'>\n");
      out.write("                  <ul class=\" navbar-nav\">\n");
      out.write("            <p>List of topics</p>\n");
      out.write("            <li id=\"linear\" onclick=\"getVal(1)\"><a href='#'>Linear</a></li>\n");
      out.write("            <li id=\"octahedral\" onclick=\"getVal(2)\"><a href='#'>Octahedral</a></li>\n");
      out.write("            </ul>\n");
      out.write("                      \n");
      out.write("                  </div>\n");
      out.write("          \n");
      out.write("          </div>\n");
      out.write("        </div>\n");
      out.write("      </div>\n");
      out.write("    </div>\n");
      out.write("  </div>\n");
      out.write("  \n");
      out.write("  \n");
      out.write("</div>\n");
      out.write("</div>\n");
      out.write(" <script type = \"text/javascript\">\n");
      out.write("      var scene, camera, renderer;\n");
      out.write("      var controls, cont,neededShape;\n");
      out.write("      //init();\n");
      out.write("      //animate();\n");
      out.write("       var modal = document.getElementById('myModal');\n");
      out.write("        var span = document.getElementsByClassName(\"close\")[0];\n");
      out.write("        var modalc,central_radius,bond_thickness,atom_radius,value;\n");
      out.write("        span.onclick = function closeModal() {\n");
      out.write("            modal.style.display = \"none\";\n");
      out.write("        };\n");
      out.write("        function createShapes(val){\n");
      out.write("          if(val===1)\n");
      out.write("          {\n");
      out.write("           // alert(\"Linear!\");\n");
      out.write("            //alert(central_radius+\" \"+bond_thickness+\" \"+atom_radius+\" in linear\");\n");
      out.write("\n");
      out.write("           neededShape = new Linear(central_radius,bond_thickness,atom_radius) ;\n");
      out.write("\n");
      out.write("          }\n");
      out.write("          else if(val===2)\n");
      out.write("          {\n");
      out.write("           // alert(\"Octahedral\");\n");
      out.write("            neededShape= new Octahedral(central_radius,bond_thickness,atom_radius) ;\n");
      out.write("\n");
      out.write("          }\n");
      out.write("          init();\n");
      out.write("          animate();\n");
      out.write("        }\n");
      out.write("        function getParams()\n");
      out.write("        {\n");
      out.write("          central_radius=document.getElementById('central').value;\n");
      out.write("          bond_thickness=document.getElementById('bond').value;\n");
      out.write("          atom_radius=document.getElementById('node').value;\n");
      out.write("          //alert(val);\n");
      out.write("          modal.style.display = \"none\"; \n");
      out.write("          createShapes(value);\n");
      out.write("          }\n");
      out.write("        function openModal(val) {\n");
      out.write("            modal.style.display = \"block\";\n");
      out.write("\n");
      out.write("          }\n");
      out.write("          function showval(p)\n");
      out.write("          {\n");
      out.write("             // console.log(p);\n");
      out.write("              var idElement = document.getElementById(\"compound\");\n");
      out.write("                var selectedValue = idElement.options[idElement.selectedIndex].value;\n");
      out.write("                alert(selectedValue);\n");
      out.write("          }\n");
      out.write("\n");
      out.write("        // When the user clicks anywhere outside of the modal, close it\n");
      out.write("     /*   window.onclick = function(event) {\n");
      out.write("            if (event.target === modal) {\n");
      out.write("                modal.style.display = \"none\";\n");
      out.write("            }\n");
      out.write("        };*/\n");
      out.write("      function getVal(val)\n");
      out.write("      {\n");
      out.write("        value=val;\n");
      out.write("\n");
      out.write("        openModal();\n");
      out.write("\n");
      out.write("      }\n");
      out.write("\n");
      out.write("      function init() {\n");
      out.write("        scene = new THREE.Scene();\n");
      out.write("        scene.background = new THREE.Color('black');\n");
      out.write("\n");
      out.write("        camera = new THREE.PerspectiveCamera(60, window.innerHeight / window.innerWidth, 0.1, 10000.0);\n");
      out.write("        camera.position.set(0, 0, 15);\n");
      out.write("        camera.lookAt(new THREE.Vector3(0, 0, 0));\n");
      out.write("\n");
      out.write("        renderer = new THREE.WebGLRenderer({antialias: false});\n");
      out.write("\n");
      out.write("        controls = new THREE.OrbitControls(camera, renderer.domElement);\n");
      out.write("        cont = new THREE.TrackballControls(camera, renderer.domElement);\n");
      out.write("        \n");
      out.write("\n");
      out.write("        \n");
      out.write("        window.addEventListener('resize', onWindowResize, false);\n");
      out.write("        onWindowResize();\n");
      out.write("        var canvas=document.getElementById(\"animationCanvas\");\n");
      out.write("        canvas.innerHTML='';\n");
      out.write("        canvas.appendChild(renderer.domElement);\n");
      out.write("        \n");
      out.write("        \n");
      out.write("        /*actual starts here*/\n");
      out.write("        scene.add(neededShape.shape) ;\n");
      out.write("        /*end*/\n");
      out.write("      }\n");
      out.write("\n");
      out.write("      function onWindowResize() {\n");
      out.write("        camera.aspect = window.innerWidth / window.innerHeight;\n");
      out.write("        camera.updateProjectionMatrix();\n");
      out.write("        renderer.setSize(window.innerWidth/2, 3*window.innerHeight/4);\n");
      out.write("      }\n");
      out.write("\n");
      out.write("      function animate(time) {\n");
      out.write("        \n");
      out.write("        controls.update() ;\n");
      out.write("        cont.update() ;\n");
      out.write("        renderer.render(scene, camera);\n");
      out.write("        requestAnimationFrame(animate);\n");
      out.write("      }\n");
      out.write("        </script> \n");
      out.write(" \n");
      out.write("  </body>\n");
      out.write("</html>  \n");
      out.write("  ");
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
