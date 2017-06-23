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
        <input type="submit" class="btn btn-default" value="Periodic table">
    </form>
    </center>
    <br>
<form method="Post" action="ElementServlet" >
    <input type="number" placeholder="Enter atomic number" name="atomic_number">
    <center>   <input type='submit'class="btn btn-default" value="Go" />  </center> 
 <ul class=" navbar-nav">
   <li class="choice" onclick="addAtom('${an}','${element.k}','${element.l}','${element.m}','${element.n}','${element.o}','${element.p}','${element.q}', 2)">Full View</li>
  <li class="choice" onclick="addAtom('${an}','${element.k}','${element.l}','${element.m}','${element.n}','${element.o}','${element.p}','${element.q}', 1)">Electron view</li>
  <li class="choice" onclick="addAtom('${an}','${element.k}','${element.l}','${element.m}','${element.n}','${element.o}','${element.p}','${element.q}', 3)">Valence shell view</li>
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