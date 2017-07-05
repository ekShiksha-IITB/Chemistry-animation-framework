<%-- 
    Document   : sidebar2
    Created on : 19 Jun, 2017, 1:17:45 PM
    Author     : aishwarya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<label style="font-size: 14px">Electronic Excitation<br></label><br>

    Level 1 (n1) : <input class="form-control" type="number" id="l1" name="level_1"/>
    Level 2 (n2) : <input class="form-control" type="number" id="l2" name="level_2"/>
    <br><br>
    <input class="btn btn-default reaction" type='submit' value="Go" onclick="excitation()" />   
        <br><br>
        <div id="energy"></div>


        <div>
       <img src="Images/hint.png" height="38" width="38" onclick="openModal('id02hint')" >
             
            <input type="image" class="question" onclick="openModal('id00')" src="Images/question.png" alt="Submit" width="48px" height="48px">
       </div>
      