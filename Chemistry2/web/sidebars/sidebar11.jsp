<%-- 
    Document   : sidebar6.jsp
    Created on : 20 Jun, 2017, 1:46:12 AM
    Author     : shreya
--%>

<%@page import="ConnectionUtil.ConnectionFactory"%>
<%@page import="java.sql.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
    <script type = "text/javascript" src = "js/animations.js"> </script>

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
                        <a href="#"><option value="<%=myRs.getInt("organic_reaction_ID")%>" >(<%=myRs.getInt("organic_reaction_ID")%>)<%=myRs.getString("Reactants")%><br>--><%=myRs.getString("Products")%></option>
                        </a><br>
                        <%
                        }
                    }
                    catch(Exception e)
                    {
                        e.printStackTrace();
                    }   
                    %>
                      
                  
        </div>
    
    <input type="image" class="question" onclick="openModal(1)" src="Images/question.png" alt="Submit" width="48" height="48">
               