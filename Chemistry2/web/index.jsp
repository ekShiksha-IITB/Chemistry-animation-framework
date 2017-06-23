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
  <div class="col-sm-3">
    <div class="sidebar-nav">
      <div id="topics" class="navbar navbar-default" role="navigation">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <span class="visible-xs navbar-brand">Topics</span>
        </div>
         <div class="navbar-collapse collapse sidebar-navbar-collapse" style="background-color: #8bc1c3">
         <form method="Get" action="index.jsp">
            <table>
                <h2>
                    Topics
                </h2>
            <%  
                    TopicDAO topicDAO=new TopicDAO();
                    List<Topic> topics=topicDAO.getTopic();
                for(int i=0; i < topics.size(); i++)
            {
                %>
                <tr>
                    <td style="font-size: 16px;"><p><strong><%= topics.get(i).getTopicName()%></strong></p></td>
                    <%
                        List<Subtopic> subtopics=topics.get(i).getSubtopics();
                        for(int j=0; j < subtopics.size(); j++)
            {
                %>
                <tr>
                    <td><p><li><button type="submit" name="option" value="<%=subtopics.get(j).getSubId()%>"> <img src="Images/button.png" height="38" width="38" ></button><%= subtopics.get(j).getSubtopicName()%><li></p></td>
                </tr>  
                </tr>
                <%}}%>
        </table>  
         </form>
        </div>
      </div>
    </div>
  </div>
  <div class="col-sm-6">
      <div height ="800px" id="animationCanvas"></div>
      <center>
      <div style="position: relative; margin-top: 5%;" id="desc" style="font-size: 18px">
        <input type="image" class="audio" onclick="talk('<%= description %>')" src="Images/voice.png" alt="Submit" width="35" height="35">
         <input type="image" class="audio" onclick="stop()" src="Images/stop.png" alt="Submit" width="35" height="35">
           
          <strong>Description:</strong>
       <%= description %>       
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
   <div class="col-sm-2">
       <div class="sidebar-nav2">
      <div class="navbar navbar-default" role="navigation">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <span class="visible-xs navbar-brand"></span>
        </div>
      <div class="navbar-collapse collapse sidebar-navbar-collapse"  id="sidebar">
                <!--Content goes here -->
                <jsp:include page="<%= sidebar %>" flush="true"/>  
        </div>
      </div>
  </div>
   </div>
 </div>
 </div>
 <script type = "text/javascript" src="js/appFunctions.js"></script>         
</body>
</html>