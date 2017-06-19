<%-- 
    Document   : atom
    Created on : 12 Jun, 2017, 10:02:35 PM
    Author     : abhi
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
    <script type = "text/javascript" src = "js/animations.js"> </script>

<form method="Post" action="ElementServlet" >
Atomic Number: <input type="number" name="atomic_number">
        <input type='submit' value="Go" />
        
        <br><br> Details<br>
       Name: <c:out value="${element.name}" /><br>
     Symbol: <c:out value="${element.symbol}" /><br>
       Type: <c:out value="${element.type}" /><br>
    K-shell:    <c:out value="${element.k}" /><br>
    L-shell:    <c:out value="${element.l}" /><br>
    M-shell:    <c:out value="${element.m}" /><br>
    N-shell:    <c:out value="${element.n}" /><br>
    O-shell:    <c:out value="${element.o}" /><br>
    P-shell:    <c:out value="${element.p}" /><br>
    Q-shell:    <c:out value="${element.q}" /><br>

</form>
<div class="nav navbar-nav">
        <ul class=" navbar-nav">
  <li onclick="addAtom('${an}','${element.k}','${element.l}','${element.m}','${element.n}','${element.o}','${element.p}','${element.q}', 3)"><a href='#'>Valence shell view</a></li>
  <li onclick="addAtom('${an}','${element.k}','${element.l}','${element.m}','${element.n}','${element.o}','${element.p}','${element.q}', 1)"><a href='#'>Electron view</a></li>
  <li onclick="addAtom('${an}','${element.k}','${element.l}','${element.m}','${element.n}','${element.o}','${element.p}','${element.q}', 2)"><a href='#'>Full View</a></li>

  </ul>
</div>
    <form method="Get" action="PeriodicServlet">
        <input type="submit" value="Get Periodic table">
    </form>
   <input type="image" class="question" onclick="openModal(1)" src="Images/question.png" alt="Submit" width="48" height="48">
