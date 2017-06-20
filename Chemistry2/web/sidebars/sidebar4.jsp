<%-- 
    Document   : sidebar2.jsp
    Created on : 8 Jun, 2017, 3:40:10 PM
    Author     : abhi
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

        <center>
           
          <div class="nav navbar-nav">
		  <h2>Crystal structures</h2>
                  <div id='options'>
                  <ul class=" navbar-nav">
            <li id="cubic" onclick="setShape(1)"><a href='#'>Cubic</a></li>
            <li id="Tetragonal" onclick="setShape(2)"><a href='#'>Tetragonal</a></li>
            <li id="Orthorhombic" onclick="setShape(3)"><a href='#'>Orthorhombic</a></li>
            <li id="Hexagonal" onclick="setShape(4)"><a href='#'>Hexagonal</a></li>
            <li id="Monoclinic" onclick="setShape(5)"><a href='#'>Monoclinic</a></li>
            <br><br>
            </ul>
                      
                  </div>
                    
          </div>
          
  </center>

<div>
    
    <div id="SCC" style="visibility: hidden" onclick="getLattice(3)"><a href='#'>End-centred</a></div>
    <div id="Simple" style="visibility: hidden" onclick="getLattice(0)"><a href='#'>Simple</a></div>
    <div id="BCC" style="visibility: hidden" onclick="getLattice(1)"><a href='#'>Body-centred</a></div>
    <div id="FCC" style="visibility: hidden" onclick="getLattice(2)"><a href='#'>Face-centred</a></div>
            
</div>
  <input type="image" class="question" onclick="openModal(1)" src="Images/question.png" alt="Submit" width="48" height="48">