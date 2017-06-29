<%-- 
    Document   : sidebar10.jsp
    Created on : 16 Jun, 2017, 2:46:12 PM
    Author     : shreya
--%>

<%@page import="ConnectionUtil.ConnectionFactory"%>
<%@page import="java.sql.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
    <script type = "text/javascript" src = "js/animations.js"> </script>

    <center>
            <label>Substitution Nucleophilic Unimolecular Reactions<br><br></label>
    </center>
        <div id='options'>
                    <%
                    try
                    {
                        Connection connection = ConnectionFactory.getConnection();
                        Statement statement = connection.createStatement();
                        ResultSet myRs=statement.executeQuery("select * from organic_sn1");
                        while(myRs.next())
                       {
                        %>
                        <li class="choice" value="<%=myRs.getInt("organic_reaction_ID")%>" ><%=myRs.getString("Reactants")%> --> <br><%=myRs.getString("Products")%></li>
                       
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