<%-- 
    Document   : sidebar.jsp
    Created on : 8 Jun, 2017, 3:21:37 PM
    Author     : abhi
--%>

<%@page import="ConnectionUtil.ConnectionFactory"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Objects.Subtopic"%>
<%@page import="Objects.Topic"%>
<%@page import="java.util.*"%>
<%@page import="DAO.TopicDAO"%>
<%@page import="DAO.SubtopicDAO"%>
<!DOCTYPE html>
        <center>
            <input type="image" class="plus" onclick="openModal(2)" src="Images/plus.png" alt="Submit" width="40" height="40">
            <label>Compounds<br><br></label>
        
            <select class="form-control" id="compound" onchange="createVSEPRShapes(this.value)">
            <option value="-1">Choose compound</option>            
            <%               
                try
                {
                   Connection connection = ConnectionFactory.getConnection();
            Statement statement = connection.createStatement();
                    ResultSet myRs=statement.executeQuery("select * from VSEPR");
            while(myRs.next())
            {
            %>
     
            <option value="<%=myRs.getInt("shape_id")*10+myRs.getInt("lonepairs")%>"><%=myRs.getString("compound_name")%></option>
            
            <%
            }
                }
            catch(Exception e)
            {
                e.printStackTrace();
            }
            
            %>
        </select>
         </center>

          <div class="nav navbar-nav">
		  <h2>Shapes</h2>
                  <div id='options'>
                  <ul class=" navbar-nav">
            <li id="linear" onclick="createVSEPRShapes(10)"><a href='#'>Linear</a></li>
            <li id="trigonal" onclick="createVSEPRShapes(20)"><a href='#'>Trigonal Planar</a></li>
            <li id="tetrahedral" onclick="createVSEPRShapes(30)"><a href='#'>Tetrahedral</a></li>
            <li id="pyramidal" onclick="createVSEPRShapes(40)"><a href='#'>Trigonal Bipyramidal</a></li>
            <li id="octahedral" onclick="createVSEPRShapes(50)"><a href='#'>Octahedral</a></li>
            <li id="pentpy" onclick="createVSEPRShapes(60)"><a href='#'>Pentagonal Bipyramidal</a></li>
            </ul>
                      
                  </div>
          
          </div>
         <input type="image" class="question" onclick="openModal(1)" src="Images/question.png" alt="Submit" width="48" height="48">
         