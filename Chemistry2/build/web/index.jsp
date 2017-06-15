<%-- 
    Document   : index.jsp
    Created on : 6 Jun, 2017, 3:40:11 PM
    Author     : abhi
--%>

<%@page import="Objects.Subtopic"%>
<%@page import="Objects.Topic"%>
<%@page import="java.util.*"%>
<%@page import="DAO.TopicDAO"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <title>Chemistry</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
    <script type = "text/javascript" src = "js/three.js"> </script>
    <script type = "text/javascript" src = "js/atom.js"> </script>
    <script type = "text/javascript" src = "js/geometry.js"> </script>
    <script type = "text/javascript" src = "js/lattice.js"> </script>
    <script type = "text/javascript" src = "js/OrbitControls.js"> </script>
    <script type = "text/javascript" src = "js/TrackballControls.js"> </script>
    <script type = "text/javascript" src = "js/animations.js"> </script>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@include file="jspFunctions.jsp"%>
    <link rel="stylesheet" href="index.css">
  </head>
  <body onload="init()">
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
  <div class="col-sm-2">
    <div class="sidebar-nav">
      <div class="navbar navbar-default" role="navigation">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <span class="visible-xs navbar-brand">Choose your topic</span>
        </div>
         <div class="navbar-collapse collapse sidebar-navbar-collapse">
         <form method="Get" action="DemoServlet">
            <table>
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
                    <td><p><li><input value="<%=subtopics.get(j).getSubId()%>" name="option" type="submit" ><%= subtopics.get(j).getSubtopicName()%><li></p></td>
                <tr>  
                </tr>
                <%}}%>
        </table>  
         </form>
        </div>
        
      </div>
    </div>
  </div>
  <div class="col-sm-6">
      <div width="700px" height ="800px" id="animationCanvas"></div>
            <!-- The Modal -->
        <div id="myModal" class="modal">
          <!-- Modal content -->
          <div class="modal-content">
            <span class="close">&times;</span>
            <p id="modalinnerContent">
                <c:out value="${tip}"/>
           </p>
          </div>

        </div>
  </div>
  
   <div class="col-sm-3">
    <div class="sidebar-nav2">
      <div class="navbar navbar-default" role="navigation">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <span class="visible-xs navbar-brand">Choose options</span>
        </div>

      <div class="navbar-collapse collapse sidebar-navbar-collapse"  id="sidebar">
                <!--Content goes here -->
                <jsp:include page="${somePage}" flush="true"/>  
        </div>

      </div>
    </div>
  </div>
</div>
            <div id="desc">
            <jsp:include page="${descBox}" flush="true"/> 
            
        </div>  
</div>
 <script type = "text/javascript" src="js/appFunctions.js"></script>         
</body>
</html>
