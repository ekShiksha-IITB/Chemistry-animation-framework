<%-- 
    Document   : sidebar2.jsp
    Created on : 8 Jun, 2017, 3:40:10 PM
    Author     : abhi
--%>
<%@page import="Objects.Lattice"%>
<%@page import="java.util.List"%>
<%@page import="DAO.LatticeDAO"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

           
          <div>
		  <h2>Crystal structures</h2>
                   <ul class=" navbar-nav">
            <%  
                    LatticeDAO latticeDao=new LatticeDAO();
                    List<Lattice> lattices=latticeDao.getLattices();
                for(int i=0; i < lattices.size(); i++)
            { %>
               
                    <li class="hintLeft" onclick="setShape(<%= lattices.get(i).getId()%>)" style="cursor:pointer"><%= lattices.get(i).getName()%>
                        <span class="toolLeft"><%= lattices.get(i).getSideConstraint()+"<br>"+lattices.get(i).getAngleConstraint() %></span> 
                    </li>
        
             <%  
             }
             %>
        </ul> 
<div>
    
    <div id="SCC" style="visibility: hidden" onclick="getLattice(3)"><span class="choice">End-centred</span></div>
    <div id="Simple" style="visibility: hidden" onclick="getLattice(0)"><span class="choice">Simple</span></div>
    <div id="BCC" style="visibility: hidden" onclick="getLattice(1)"><span class="choice">Body-centred</span></div>
    <div id="FCC" style="visibility: hidden" onclick="getLattice(2)"><span class="choice">Face-centred</span></div>
            
</div>
  <input type="image" class="question" onclick="openModal(1)" src="Images/question.png" alt="Submit" width="48" height="48">