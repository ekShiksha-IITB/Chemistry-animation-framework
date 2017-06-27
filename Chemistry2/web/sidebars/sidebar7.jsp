<%-- 
    Document   : sidebar2.jsp
    Created on : 8 Jun, 2017, 3:40:10 PM
    Author     : abhi
--%>
<%@page import="ConnectionUtil.ConnectionFactory"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div>
    Single Displacement reactions<br><br>
    <center> <button class="reaction btn btn-default" onclick="showSingleDisplacement()">Show</button></center>
</div>
<center><br>
            <label>Reactants<br><br></label>  
              <form method="Get" action="DisplacementServlet">
               <input name="reactant1" list="reactant_1">
            <datalist  id="reactant_1" >
            <%               
            try
            {
            Connection connection = ConnectionFactory.getConnection();
            Statement statement = connection.createStatement();
            ResultSet myRs=statement.executeQuery("select distinct reactant_1 from displacement_reaction");
            while(myRs.next())
            {
            %>     
            <option value="<%=myRs.getString("reactant_1")%>"><%=myRs.getString("reactant_1")%></option>
            <%
            }
            }
            catch(Exception e)
            {
                e.printStackTrace();
            }            
            %>
            </datalist><br>
              <input name="reactant2" list="reactant_2">
        <datalist  id="reactant_2">
            <%               
            try
            {
            Connection connection = ConnectionFactory.getConnection();
            Statement statement = connection.createStatement();
            ResultSet myRs=statement.executeQuery("select distinct reactant_2 from displacement_reaction");
            while(myRs.next())
            {
            %>     
            <option value="<%=myRs.getString("reactant_2")%>"><%=myRs.getString("reactant_2")%></option>
            <%
            }
            }
            catch(Exception e)
            {
                e.printStackTrace();
            }            
            %>
        </datalist>
    
           <input class="btn btn-default" type="submit"/>
        </form>
                       <c:forEach items="${reactions}" var="reaction">
                       <span class="choice">  <c:out value="${reaction.reaction}" /></span><br>
                       </c:forEach>
       
         </center>

<div class="hintLeft">
    <input type="image" class="hint" src="Images/hint.png" height="38px" width="38px">
    <span class="toolLeft" id="help">Hint</span>
    <input type="image" class="question" onclick="openModal(1)" src="Images/question.png" alt="Submit" width="48px" height="48px">
</div>
