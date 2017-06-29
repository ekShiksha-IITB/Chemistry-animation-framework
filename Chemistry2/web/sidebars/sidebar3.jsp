<%-- 
    Document   : sidebar3.jsp
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

<input type="image" class="plus" onclick="openModal(3)" src="Images/plus.png" alt="Submit" width="40px" height="40px">
                             
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

         <div><br>
        <label style="font-size: 14px">Shapes<br></label>

                  <div id='options'>
                  <ul class=" navbar-nav">
            <li class="choice" id="linear" onclick="createVSEPRShapes(10)">Linear</li><br>
            <li class="choice" id="trigonal" onclick="createVSEPRShapes(20)">Trigonal Planar</li><br>
            <li class="choice" id="tetrahedral" onclick="createVSEPRShapes(30)">Tetrahedral</li><br>
            <li class="choice" id="pyramidal" onclick="createVSEPRShapes(40)">Trigonal Bipyramidal</li><br>
            <li class="choice" id="octahedral" onclick="createVSEPRShapes(50)">Octahedral</li><br>
            <li class="choice" id="pentpy" onclick="createVSEPRShapes(60)">Pentagonal Bipyramidal</li><br>
            </ul>   
                  </div>
          </div>
          <div class="hintLeft"><input type="image" class="hint" src="Images/hint.png" height="38px" width="38px">
             <span class="toolLeft" id="help">Hint</span>
             <input type="image" class="question" onclick="openModal(1)" src="Images/question.png" alt="Submit" width="48px" height="48px">
          </div>