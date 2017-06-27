<%-- 
    Document   : sidebar2
    Created on : 19 Jun, 2017, 1:17:45 PM
    Author     : aishwarya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<h3>Electron excitation</h3>

    Level 1 (n1) : <input type="number" id="l1" name="level_1"/>
    Level 2 (n2) : <input type="number" id="l2" name="level_2"/>
    <br><br>
    <input type='submit' value="Go" onclick="excitation()" />   
        <br><br>
        <div id="energy"></div>


        <div class="hintLeft"><input type="image" class="hint" src="Images/hint.png" height="38px" width="38px">
             <span class="toolLeft">E= -13.6 eV [(<sup>1</sup>&frasl;<sub>n2</sub>)<sup>2</sup> - (<sup>1</sup>&frasl;<sub>n1</sub>)<sup>2</sup>]</span>
             <input type="image" class="question" onclick="openModal(1)" src="Images/question.png" alt="Submit" width="48px" height="48px">
       </div>