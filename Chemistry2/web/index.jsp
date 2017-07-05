<%-- 
    Document   : index.jsp
    Created on : 6 Jun, 2017, 3:40:11 PM
    Author     : abhi
--%>
<%@page import="DAO.SubtopicDAO"%>
<%@page import="Objects.Subtopic"%>
<%@page import="Objects.Topic"%>
<%@page import="java.util.*"%>
<%@page import="DAO.TopicDAO"%>
<%@page import="DAO.VSEPRDAO"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%--Code for displaying sidebar depending on topic selected--%>
<%
    int count = -1;
    if(request.getParameter("option")!=null)
     count=Integer.parseInt(request.getParameter("option"));
    System.out.print(request.getParameter("option"));
    String sidebar="sidebars/generic.jsp";
    String description="xyz";
    String tip="No tip";
    try{
    SubtopicDAO subtopicDAO=new SubtopicDAO();
           Subtopic subtopic=subtopicDAO.getSubtopicWithId(count);
           description=subtopic.getDescription();
           if(description==null)
               description="No content available";
           
           tip=subtopic.getTip();
    if(count>-1)
       sidebar="sidebars/sidebar"+count+".jsp";
    }
    catch(Exception e)
    {
        e.printStackTrace();
    }
%>

<!DOCTYPE html>
<html>
    <head>
    <title>EkShiksha: Chemistry</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
    <script src="http://code.responsivevoice.org/responsivevoice.js"></script>
    <!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>-->
    <script type = "text/javascript" src = "js/three.js"> </script>
    <script type = "text/javascript" src = "js/atom.js"> </script>
    <script type = "text/javascript" src = "js/geometry.js"> </script>
    <script type = "text/javascript" src = "js/lattice.js"> </script>
    <script type = "text/javascript" src = "js/reaction.js"> </script>
    <script type = "text/javascript" src = "js/allreactions.js"> </script>
    <script type = "text/javascript" src = "js/hybridisation.js"> </script>
    <script type = "text/javascript" src = "js/organic_reactions.js"> </script>
    <script type = "text/javascript" src = "js/OrbitControls.js"> </script>
    <script type = "text/javascript" src = "js/TrackballControls.js"> </script>
    <script type = "text/javascript" src = "js/animations.js"> </script>
        <!-- Bootstrap Core CSS -->
    <link href="https://blackrockdigital.github.io/startbootstrap-freelancer/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Theme CSS -->
    <link href="https://blackrockdigital.github.io/startbootstrap-freelancer/css/freelancer.min.css" rel="stylesheet">
    <!-- Custom Fonts -->
    <link href="https://blackrockdigital.github.io/startbootstrap-freelancer/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <link rel="stylesheet" href="index.css">
  
    </head>
  <body onload="init();navControl();">
        <nav id="mainNav" class="navbar navbar-default navbar-fixed-top navbar-custom">
            <div class="container">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header page-scroll">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#menubar">
                        <span class="sr-only">Toggle navigation</span> Menu <i class="fa fa-bars"></i>
                    </button>
                    <a class="navbar-brand" href="#page-top"><img src="Images/logo.png" height="55" width="55"></a>
                    <a class="navbar-brand" href="#page-top">EkShiksha Chemistry<br><span style="font-size:14px">Observe. Explore. Understand.</span></a>
                </div>


                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="menubar">
                    <ul class="nav navbar-nav navbar-right">
                        <li class="hidden">
                            <a href="#page-top"></a>
                        </li>
                        <li class="active">
                            <a href="#">Explore</a>
                        </li>
                        <li>
                            <a href="home.jsp">Home</a>
                        </li>
                    </ul>
                </div>
                <!-- /.navbar-collapse -->
            </div>
        <!-- /.container-fluid -->
    </nav>
    <section class="success" id="mainContainer">


 <div class="container">
    <div class="row">
        <div class="col-12 col-sm-3 col-md-3 col-lg-3 col-xl-3 align-self-start">

                             <nav class="navbar navbar-inverse" id="topicsbar" style="background-color: #284f54;">
  <div class="container-fluid">

      <div class="navbar-header" class="navbar-toggle" data-toggle="collapse" data-target="#myTopics">
             <a class="navbar-brand" href="#">Topics</a>

    </div>


    <div class="navbar-collapse collapse" id="myTopics">
        <form id="chooseTopics" method="Get" action="index.jsp">
              <input type="hidden" name="option" id="topicId"/>

              <ul class="nav navbar-nav" >
            <%  
                    TopicDAO topicDAO=new TopicDAO();
                    List<Topic> topics=topicDAO.getTopic();
                for(int i=0; i < topics.size(); i++)
            {
                %>
                  <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown"  ><strong><%= topics.get(i).getTopicName()%></strong> </a>
                <ul class="dropdown-menu">
                <%
                        List<Subtopic> subtopics=topics.get(i).getSubtopics();
                        for(int j=0; j < subtopics.size(); j++)
            {
                %>
               
                <li><a href="" onclick="javascript:document.getElementById('topicId').value=<%=subtopics.get(j).getSubId()%>;document.forms['chooseTopics'].submit(); return false" value="<%=subtopics.get(j).getSubId()%>"><%= subtopics.get(j).getSubtopicName()%></a></li>

                <%} %>
                </ul>
                  </li>
                  <%  }%>    
      </ul>
        </form>
    </div>
  </div>
</nav>
    </div>
  <div class="col-12 col-sm-9 col-md-9 col-lg-9 col-xl-9" id="canvasArea">
      <center>
      <div id="animationCanvas" width="100%"></div>
        <div class="panel panel-default" id="desc">
            <div class="panel-heading">
                <h4 class="panel-title">
                <a data-toggle="collapse" data-parent="#accordion" href="#collapse2">Description</a>
                </h4>
            </div>
            <div id="collapse2" class="panel-collapse collapse">
                <div class="panel-body">
                    <input type="image" class="audio" onclick="talk('<%= description %>')" src="Images/voice.png" alt="Submit" width="35" height="35">
                    <input type="image" class="audio" onclick="stop()" src="Images/stop.png" alt="Submit" width="35" height="35">

                    <%--For description bar--%>
                    <%= description %>    
                </div>
            </div>
        </div>
      </center>
            <!-- The Modal for tip -->
        <div id="id00" class="modal">
          <!-- Modal content -->
          <div class="modal-content">          
              <span class="close" id="close0" onclick="closeModal('id00')">&times;</span>
                <p id="modalinnerContent">
                <input type="image" class="audio" onclick="talk('<%= tip %>')" src="Images/voice.png" alt="Submit" width="35" height="35">
                <input type="image" class="audio" onclick="stop()" src="Images/stop.png" alt="Submit" width="35" height="35">
                <%= tip %>
                </p>
          </div>
        </div>   
      
<!--Modal for insertion of Compounds-->                   
     <div id="id01" class="modal">                
     <div class="modal-content">
      <span class="close" id="close1" onclick="closeModal('id01')">&times;</span>     
      <p id="modalinnerContent">          
          <form method="post" action="VSEPRServlet">
            <table>
            <tr><td>Compound name:</td><td><input type="text" name="cname"></td></tr>
            <tr><td>Total electron pairs:</td><td><input type="number" name="ep"></td></tr>
            <tr><td>Lone pairs:</td><td><input type="number" name="lp"></td></tr>
            <tr><td>Shape:</td><td><input type="text" name="shape"></td></tr>
            <tr><td></td><td><input type="submit" value="Submit"></td></tr>
            </table>
            </form>
       </p>
       </div>              
    </div>
       
<!--Modal for insertion of Examples-->        
     <div id="id02" class="modal">                
     <div class="modal-content">
      <span class="close" id="close2" onclick="closeModal('id02')">&times;</span>     
      <p id="modalinnerContent">          
          <form method="post" action="ExampleServlet">
            <table>
            <tr><td>Example Name:</td><td><input type="text" name="ename"></td></tr>
            <tr><td>Lattice type:</td><td><input type="text" name="lname"></td></tr>
            <tr><td></td><td><input type="submit" value="Submit"></td></tr>
            </table>
            </form>
       </p>
       </div>              
</div>

<!--Modal for Combination Reactions--> 
<div id="id03" class="modal">                
     <div class="modal-content">
      <span class="close" id="close3" onclick="closeModal('id03')">&times;</span>     
      <p id="modalinnerContent">          
          <form method="post" action="CRInputServlet">
            <table>
            <tr>
                <td>Coefficient of Reactant 1:</td><td><input type="number" name="n1"></td>
                <td>Reactant 1:</td><td><input type="text" name="reactant_1"></td>
            </tr>
            <tr>
                <td>Coefficient of Reactant 2:</td><td><input type="number" name="n2"></td>
                <td>Reactant 2:</td><td><input type="text" name="reactant_2"></td>
            </tr>
            <tr>
                <td>Coefficient of Product:</td><td><input type="number" name="p"></td>
                <td>Product:</td><td><input type="text" name="product"></td>
            </tr>
            <tr>
               <td>Reaction:</td><td><input type="text" name="reaction"></td>
            </tr>
            <tr><td></td><td><input type="submit" value="Submit"></td></tr>
            </table>
            </form>
       </p>
       </div>              
</div>

<!--Modal for Decomposition Reactions--> 
<div id="id04" class="modal">                
     <div class="modal-content">
      <span class="close" id="close4" onclick="closeModal('id04')">&times;</span>     
      <p id="modalinnerContent">          
          <form method="post" action="DRInputServlet">
            <table>
            <tr>
                <td>Coefficient of Reactant:</td><td><input type="number" name="n"></td>
                <td>Reactant:</td><td><input type="text" name="reactant"></td>
            </tr>
            <tr>
                <td>Coefficient of Product 1:</td><td><input type="number" name="p1"></td>
                <td>Product 1:</td><td><input type="text" name="product_1"></td>
            </tr>
            <tr>
                <td>Coefficient of Product 2:</td><td><input type="number" name="p2"></td>
                <td>Product 2:</td><td><input type="text" name="product_2"></td>
            </tr>
            <tr>
               <td>Reaction:</td><td><input type="text" name="reaction"></td>
            </tr>
            <tr><td></td><td><input type="submit" value="Submit"></td></tr>
            </table>
            </form>
       </p>
       </div>              
</div>

<!--Modal for Displacement Reactions--> 
<div id="id05" class="modal">                
     <div class="modal-content">
      <span class="close" id="close5" onclick="closeModal('id05')">&times;</span>     
      <p id="modalinnerContent">          
          <form method="post" action="DisInputServlet">
            <table>
            <tr>
                <td>Coefficient of Reactant 1:</td><td><input type="number" name="n1"></td>
                <td>Reactant 1:</td><td><input type="text" name="reactant_1"></td>
            </tr>
            <tr>
                <td>Coefficient of Reactant 2:</td><td><input type="number" name="n2"></td>
                <td>Reactant 2:</td><td><input type="text" name="reactant_2"></td>
            </tr>
            <tr>
                <td>Coefficient of Product 1:</td><td><input type="number" name="p1"></td>
                <td>Product 1:</td><td><input type="text" name="product_1"></td>
            </tr>
            <tr>
                <td>Coefficient of Product 2:</td><td><input type="number" name="p2"></td>
                <td>Product 2:</td><td><input type="text" name="product_2"></td>
            </tr>
            <tr>
               <td>Reaction:</td><td><input type="text" name="reaction"></td>
            </tr>
            <tr><td></td><td><input type="submit" value="Submit"></td></tr>
            </table>
            </form>
       </p>
       </div>              
</div>

<!--Modal for Double displacement Reactions--> 
<div id="id06" class="modal">                
     <div class="modal-content">
      <span class="close" id="close6" onclick="closeModal('id06')">&times;</span>     
      <p id="modalinnerContent">          
          <form method="post" action="DDisInputServlet">
            <table>
            <tr>
                <td>Coefficient of Reactant 1:</td><td><input type="number" name="n1"></td>
                <td>Reactant 1:</td><td><input type="text" name="reactant_1"></td>
            </tr>
            <tr>
                <td>Coefficient of Reactant 2:</td><td><input type="number" name="n2"></td>
                <td>Reactant 2:</td><td><input type="text" name="reactant_2"></td>
            </tr>
            <tr>
                <td>Coefficient of Product 1:</td><td><input type="number" name="p1"></td>
                <td>Product 1:</td><td><input type="text" name="product_1"></td>
            </tr>
            <tr>
                <td>Coefficient of Product 2:</td><td><input type="number" name="p2"></td>
                <td>Product 2:</td><td><input type="text" name="product_2"></td>
            </tr>
            <tr>
               <td>Reaction:</td><td><input type="text" name="reaction"></td>
            </tr>
            <tr><td></td><td><input type="submit" value="Submit"></td></tr>
            </table>
            </form>
       </p>
       </div>              
</div>

<!--Modal for Adding new organic compounds--> 
<div id="id07" class="modal">                
    <div class="modal-content">
      <span class="close" id="close7" onclick="closeModal('id07')">&times;</span>     
      <p id="modalinnerContent">          
          <form method="post" action="OrganicCompoundServlet">
            <table>
            <tr><td>Name of Hydrocarbon:</td><td><input type="text" name="name"></td></tr>
            <tr><td>Number of Carbon atoms:</td><td><input type="number" name="carbons"></td></tr>
            <tr><td>Number of Hydrogen atoms:</td><td><input type="number" name="hydrogen"></td></tr>
            <tr><td>Type of Hydrocarbon(enter 1,2,3 for alkanes,alkenes,alkynes respectively):</td><td><input type="number" name="type"></td></tr>
            <tr><td>Number of carbon atom from where double or triple bond starts(enter 0 for alkanes):</td><td><input type="number" name="bond1"></td></tr>
            <tr><td>Number of carbon atom where the double or triple bond ends(enter 0 for alkanes):</td><td><input type="number" name="bond2"></td></tr>
            <tr><td></td><td><input type="submit" value="Submit"></td></tr>
            </table>
          </form>
          <c:out value="${message}"/>
       </p>
       </div>              
</div>
       <!--Modal for SN1 Reactions--> 
<div id="id08" class="modal">                
    <div class="modal-content">
      <span class="close" id="close8" onclick="closeModal('id08')">&times;</span>     
      <p id="modalinnerContent">          
          <form method="post" action="SN1Servlet">
            <table>
            <tr><td>Reactants(Ex: A+B):</td><td><input type="text" name="Reactants"></td></tr>
            <tr><td>Products(Ex: C+D):</td><td><input type="text" name="Products"></td></tr>
            <tr><td>Active center atom:</td><td><input type="text" name="center_atom"></td></tr>
            <tr><td>Group 1 attached to center atom:</td><td><input type="text" name="Grp1"></td></tr>
            <tr><td>Group 2 attached to center atom:</td><td><input type="text" name="Grp2"></td></tr>
            <tr><td>Group 3 attached to center atom:</td><td><input type="text" name="Grp3"></td></tr>
            <tr><td>Leaving group attached to center atom:</td><td><input type="text" name="Leaving_group"></td></tr>
            <tr><td>Group to be added to center atom:</td><td><input type="text" name="Adding_group"></td></tr>
            <tr><td>Group attached to the leaving group at the end of reaction:</td><td><input type="text" name="Grp4"></td></tr>
            
            <tr><td></td><td><input type="submit" value="Submit"></td></tr>
            </table>
          </form>
          <c:out value="${message}"/>
       </p>
       </div>              
</div>
      <!--Modal for SN2 Reactions-->  
<div id="id09" class="modal">                
    <div class="modal-content">
      <span class="close" id="close9" onclick="closeModal('id09')">&times;</span>     
      <p id="modalinnerContent">          
          <form method="post" action="SN2Servlet">
            <table>
            <tr><td>Reactants(Ex: A+B):</td><td><input type="text" name="Reactants"></td></tr>
            <tr><td>Products(Ex: C+D):</td><td><input type="text" name="Products"></td></tr>
            <tr><td>Active center atom:</td><td><input type="text" name="center_atom"></td></tr>
            <tr><td>Group 1 attached to center atom:</td><td><input type="text" name="Grp1"></td></tr>
            <tr><td>Group 2 attached to center atom:</td><td><input type="text" name="Grp2"></td></tr>
            <tr><td>Group 3 attached to center atom:</td><td><input type="text" name="Grp3"></td></tr>
            <tr><td>Leaving group attached to center atom:</td><td><input type="text" name="Leaving_group"></td></tr>
            <tr><td>Group to be added to center atom:</td><td><input type="text" name="Adding_group"></td></tr>
            <tr><td>Group attached to the leaving group at the end of reaction:</td><td><input type="text" name="Grp4"></td></tr>
            
            <tr><td></td><td><input type="submit" value="Submit"></td></tr>
            </table>
          </form>
          <c:out value="${message}"/>
       </p>
       </div>              
</div>
       <!--Modal for Atomic properties hint--> 
     <div id="id01hint" class="modal">                
     <div class="modal-content">
      <span class="close" onclick="closeModal('id01hint')">&times;</span>     
      <p id="modalinnerContent">          
          <h3> Details</h3>
        Name: <c:out value="${element.name}" /><br>
     Symbol: <c:out value="${element.symbol}" /><br>
       Type: <c:out value="${element.type}" /><br>
    K-shell: <c:out value="${element.k}" /><br>
    L-shell: <c:out value="${element.l}" /><br>
    M-shell: <c:out value="${element.m}" /><br>
    N-shell: <c:out value="${element.n}" /><br>
    O-shell: <c:out value="${element.o}" /><br>
    P-shell: <c:out value="${element.p}" /><br>
    Q-shell: <c:out value="${element.q}" /><br>
       </p>
       </div>              
</div>
       <!--Modal for Photochemistry hint--> 
        <div id="id02hint" class="modal">                
     <div class="modal-content">
      <span class="close" onclick="closeModal('id02hint')">&times;</span>     
      <p id="modalinnerContent">          
         E= -13.6 eV [(<sup>1</sup>&frasl;<sub>n2</sub>)<sup>2</sup> - (<sup>1</sup>&frasl;<sub>n1</sub>)<sup>2</sup>]
       </p>
       </div>              
</div>
       
       <!--Message displayed on inputting data--> 
       <% String message = (String)request.getAttribute("message");%>

       <script type="text/javascript">
            var message="null";
            msg = "<%=message%>";
            if(msg!="null")
            {
            alert(msg);
        }
        </script>
</div> 

   <img class="button-menu" id="settings-icon" onclick="navControl()" src="Images/left.png">

   <div style="padding-top: 30px" id="mySidenav" class="sidenav" >
       <div style="padding-left: 10px;padding-top:10px;">
       
      <div  id="mySidebar" style="color:#ffffff">
                <jsp:include page="<%= sidebar %>" flush="true"/>  

      </div>
                <a href="" id="cross" style="right: -40px;"></a>

       </div>
                
    </div>


 </div>
 </div>
 </section>

   <!-- Footer -->
    <footer class="text-center">
        <div class="footer-below" id="footerContent">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        Copyright &copy; IITB ASL Lab 2017
                    </div>
                </div>
            </div>
        </div>
    </footer>

    <!-- Scroll to Top Button (Only visible on small and extra-small screen sizes) -->
    <div class="scroll-top page-scroll hidden-sm hidden-xs hidden-lg hidden-md">
        <a class="btn btn-primary" href="#page-top">
            <i class="fa fa-chevron-up"></i>
        </a>
    </div>
 <script type = "text/javascript" src="js/appFunctions.js"></script> 
 

    <!-- jQuery -->
    <script src="https://blackrockdigital.github.io/startbootstrap-freelancer/vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="https://blackrockdigital.github.io/startbootstrap-freelancer/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>

    
    <!-- Theme JavaScript -->
    <script src="https://blackrockdigital.github.io/startbootstrap-freelancer/js/freelancer.min.js"></script>
    
</body>
</html>