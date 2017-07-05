<%-- 
    Document   : sidebar2.jsp
    Created on : 8 Jun, 2017, 3:40:10 PM
    Author     : abhi
--%>
<%@page import="ConnectionUtil.ConnectionFactory"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <script type = "text/javascript" src = "js/appFunctions.js"> </script>

<input type="image" class="plus" onclick="openModal('id06')" src="Images/plus.png" alt="Submit" width="40px" height="40px">
                             
<label style="cursor:pointer" >Double Displacement reactions <i onclick="callReactionsDemo(4)" class="glyphicon glyphicon-play-circle"></i><br><br></label>

<center><br>
            <label>Reactants<br><br></label>  
              <form method="Get" action="DoubleDisServlet">
               <input class="form-control" name="reactant1" list="reactant_1">
            <datalist  id="reactant_1" >
            <%               
            try
            {
            Connection connection = ConnectionFactory.getConnection();
            Statement statement = connection.createStatement();
            ResultSet myRs=statement.executeQuery("select distinct reactant_1 from doubledisplacement_reaction");
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
              <input class="form-control" name="reactant2" list="reactant_2">
        <datalist  id="reactant_2">
            <%               
            try
            {
            Connection connection = ConnectionFactory.getConnection();
            Statement statement = connection.createStatement();
            ResultSet myRs=statement.executeQuery("select distinct reactant_2 from doubledisplacement_reaction");
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
        </datalist><br>
    
           <input value="Go" class="btn btn-default reaction" type="submit"/>
        </form>
           <div id="reactions">
                       <c:forEach items="${reactions}" var="reaction" >
                           <script>
                        var reaction = document.createElement( 'span' );
                        reaction.className = 'choice';
                        reaction.innerHTML=getReaction("<c:out value='${reaction.reaction}'/>");
                        reaction.setAttribute("onclick", "navControl();start('${reaction.getReaction()}')");

                        document.getElementById('reactions').appendChild(reaction);
                           </script>
                           <br>
                       </c:forEach>
           </div>
       
         </center>

        <div>
            <br>

    <input type="image" class="question" onclick="openModal('id00')" src="Images/question.png" alt="Submit" width="48px" height="48px">
</div>