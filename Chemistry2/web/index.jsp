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
    <title>Chemistry</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="http://code.responsivevoice.org/responsivevoice.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
    <script type = "text/javascript" src = "js/three.js"> </script>
    <script type = "text/javascript" src = "js/atom.js"> </script>
    <script type = "text/javascript" src = "js/geometry.js"> </script>
    <script type = "text/javascript" src = "js/lattice.js"> </script>
    <script type = "text/javascript" src = "js/reaction.js"> </script>
    <script type = "text/javascript" src = "js/hybridisation.js"> </script>
    <script type = "text/javascript" src = "js/hydrocarbon.js"> </script>
    <script type = "text/javascript" src = "js/organic_reactions.js"> </script>
    <script type = "text/javascript" src = "js/OrbitControls.js"> </script>
    <script type = "text/javascript" src = "js/TrackballControls.js"> </script>
    <script type = "text/javascript" src = "js/animations.js"> </script>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <link rel="stylesheet" href="index.css">
  </head>
  <body onload="init()" background="Images/back.jpg">
  <nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#">ekshiksha</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active" ><a href="#">Home</a></li>
        <li><a href="#">About</a></li>
        <li><a href="#">Join us</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
      </ul>
    </div>
  </div>
</nav>
 <div class="container">
 <div class="row">
  <div class="col-12 col-sm-3 col-md-3 col-lg-3 col-xl-3 align-self-start">
      <nav class="navbar navbar-inverse" id="topicsbar">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myTopics">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#">Topics</a>
    </div>
    <div class="collapse navbar-collapse" id="myTopics">
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
                <a class="dropdown-toggle" data-toggle="dropdown" href="#" ><strong><%= topics.get(i).getTopicName()%></strong> <span class="caret"></span></a>
                <ul class="dropdown-menu">
                <%
                        List<Subtopic> subtopics=topics.get(i).getSubtopics();
                        for(int j=0; j < subtopics.size(); j++)
            {
                %>
               
                <%--<li><button type="submit" name="option" value="<%=subtopics.get(j).getSubId()%>"> <img src="Images/button.png" height="38" width="38" ></button><%= subtopics.get(j).getSubtopicName()%></li>--%>
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
  <div class="col-12 col-sm-6 col-md-6 col-lg-6 col-xl-6 align-self-center" id="canvasArea">
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
          <%= description %>    
        </div>
      </div>
    </div>
      </center>
            <!-- The Modal -->
        <div id="myModal" class="modal">
          <!-- Modal content -->
          <div class="modal-content">          
            <span class="close">&times;</span>
            <p id="modalinnerContent">
                <input type="image" class="audio" onclick="talk('<%= tip %>')" src="Images/voice.png" alt="Submit" width="35" height="35">
         <input type="image" class="audio" onclick="stop()" src="Images/stop.png" alt="Submit" width="35" height="35">
                <%= tip %>
           </p>
          </div>
        </div>           
<!--other modal was here-->                   
     <div id="id01" class="modal">                
     <div class="modal-content">
      <span class="close">&times;</span>     
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
       
       
       <div id="id02" class="modal">                
     <div class="modal-content">
      <span class="close">&times;</span>     
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
<div id="id03" class="modal">                
     <div class="modal-content">
      <span class="close">&times;</span>     
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

<div id="id04" class="modal">                
     <div class="modal-content">
      <span class="close">&times;</span>     
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

<div id="id05" class="modal">                
     <div class="modal-content">
      <span class="close">&times;</span>     
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

<div id="id06" class="modal">                
     <div class="modal-content">
      <span class="close">&times;</span>     
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
<div id="id07" class="modal">                
    <div class="modal-content">
      <span class="close">&times;</span>     
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
   <div class="col-12 col-sm-3 col-md-3 col-lg-3 col-xl-3 align-self-end">
  <nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#mySidebar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
    </div>
      <div class="collapse navbar-collapse" id="mySidebar" style="color:#ffffff">
                <jsp:include page="<%= sidebar %>" flush="true"/>  

    </div>
  </div>
</nav>
   </div>
 </div>
 </div>
 <script type = "text/javascript" src="js/appFunctions.js"></script>         
</body>
</html>