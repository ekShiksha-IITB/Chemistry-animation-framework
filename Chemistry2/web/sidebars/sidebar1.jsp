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
        <div class="input-group">
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
   <div class="hintLeft"><input type="image" class="hint" src="Images/hint.png" height="38px" width="38px">
       <span class="toolLeft" id="atomDetails" style="top:10%">
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
       </span>
   <input type="image" class="question" onclick="openModal(1)" src="Images/question.png" alt="Submit" width="48" height="48">

</div>



