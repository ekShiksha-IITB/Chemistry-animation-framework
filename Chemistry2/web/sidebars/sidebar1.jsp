<%-- 
    Document   : atom
    Created on : 12 Jun, 2017, 10:02:35 PM
    Author     : abhi
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
    <script type = "text/javascript" src = "js/animations.js"> </script>
    <center>
    <form method="Get" action="PeriodicServlet"><br>
        <div class="input-group" style="z-index: 0">
        <button type="submit" class="btn btn-default" value="Periodic table"><i class="glyphicon glyphicon-th"> Periodic-Table</i></button>

         </div>
    </form>
    </center>
    <br>
    <form class="navbar-form" method="Post" action="ElementServlet" >
        <div class="input-group" style="z-index: 0">
        <input class="form-control" type="number" placeholder="Enter atomic number" name="atomic_number">
        <div class="input-group-btn">
                <button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-circle-arrow-right"></i></button>
            </div>
        </div>
        <br><br>
 <ul class="nav navbar-nav">
     <li class="choice" onclick="addAtom('${an}','${element.k}','${element.l}','${element.m}','${element.n}','${element.o}','${element.p}','${element.q}', 2)">Full View</li><br>
     <li class="choice" onclick="addAtom('${an}','${element.k}','${element.l}','${element.m}','${element.n}','${element.o}','${element.p}','${element.q}', 1)">Electron view</li><br>
     <li class="choice" onclick="addAtom('${an}','${element.k}','${element.l}','${element.m}','${element.n}','${element.o}','${element.p}','${element.q}', 3)">Valence shell view</li><br>
  </ul>
</form>
   <div class="hintLeft">
       
       <img src="Images/hint.png" height="38" width="38" onclick="openModal('id01hint')" >
<input type="image" class="question" onclick="openModal('id00')" src="Images/question.png" alt="Submit" width="48px" height="48px">

            <!--  <button class="btn btn-primary" data-toggle="modal" data-target="#tipModal"><img class="question"  src="Images/question.png" width="48" height="48">
       </button> -->
 </div>


