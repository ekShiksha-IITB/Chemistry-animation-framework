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

<input type="image" class="plus" onclick="openModal('id04')" src="Images/plus.png" alt="Submit" width="40px" height="40px">
                             
<label style="cursor:pointer" >Decomposition reactions <i onclick="callReactionsDemo(2)" class="glyphicon glyphicon-play-circle"></i><br><br></label>

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

        <div ><br>

    <input type="image" class="question" onclick="openModal('id00')" src="Images/question.png" alt="Submit" width="48px" height="48px">
</div>
