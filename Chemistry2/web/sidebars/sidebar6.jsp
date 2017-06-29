<%-- 
    Document   : sidebar2.jsp
    Created on : 8 Jun, 2017, 3:40:10 PM
    Author     : abhi
--%>
<%@page import="ConnectionUtil.ConnectionFactory"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<input type="image" class="plus" onclick="openModal(5)" src="Images/plus.png" alt="Submit" width="40px" height="40px">
                             
<label style="cursor:pointer" >Decomposition reactions <i onclick="callReactionsDemo(2)" class="glyphicon glyphicon-play-circle"></i><br><br></label>
<div>
    <center> <button class="reaction btn btn-default" onclick="showDecomposition()">Show</button></center>
</div>
<center><br>
            <label>Reactants<br><br></label>  
              <form method="Get" action="DRServlet">
               <input class="form-control" name="reactant" list="reactant">
            <datalist  id="reactant" >
            <%               
            try
            {
            Connection connection = ConnectionFactory.getConnection();
            Statement statement = connection.createStatement();
            ResultSet myRs=statement.executeQuery("select distinct reactant from decomposition_reaction");
            while(myRs.next())
            {
            %>     
            <option value="<%=myRs.getString("reactant")%>"><%=myRs.getString("reactant")%></option>
            <%
            }
            }
            catch(Exception e)
            {
                e.printStackTrace();
            }            
            %>
            </datalist><br>
    
           <input value="Go" class="btn btn-default" type="submit"/>
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
