<%-- 
    Document   : sidebar6.jsp
    Created on : 20 Jun, 2017, 1:46:12 AM
    Author     : shreya
--%>

<%@page import="ConnectionUtil.ConnectionFactory"%>
<%@page import="java.sql.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
    <script type = "text/javascript" src = "js/animations.js"> </script>
     <script type = "text/javascript" src = "js/organic_reactions.js"> </script>

    <center>
            <label>Substitution Nucleophilic Bimolecular Reactions<br><br></label>
    </center>
      <div id='options'>
                    <%
                    try
                    {
                        Connection connection = ConnectionFactory.getConnection();
                        Statement statement = connection.createStatement();
                        ResultSet myRs=statement.executeQuery("select * from organic_sn2");
                        while(myRs.next())
                       {
                        %>
                        <li class="choice" onclick="showSN2('${sn2.Adding_group}','${sn2.Grp1}','C','${sn2.Grp4}','${sn2.Leaving_grp}')" value="<%=myRs.getInt("organic_reaction_ID")%>" ><%=myRs.getString("Reactants")%> -->  <br><%=myRs.getString("Products")%>
                        <br></li>
                        <%
                        }
                    }
                    catch(Exception e)
                    {
                        e.printStackTrace();
                    }   
                    %>
        </div>
    

<div class="hintLeft">
    <input type="image" class="hint" src="Images/hint.png" height="38px" width="38px">
    <span class="toolLeft" id="help">Hint</span>
    <input type="image" class="question" onclick="openModal(1)" src="Images/question.png" alt="Submit" width="48px" height="48px">
</div>               