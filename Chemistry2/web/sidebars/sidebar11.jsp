<%-- 
    Document   : sidebar11.jsp
    Created on : 20 Jun, 2017, 1:46:12 AM
    Author     : shreya
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@page import="ConnectionUtil.ConnectionFactory"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
    <script type = "text/javascript" src = "js/animations.js"> </script>
    <script type = "text/javascript" src = "js/appFunctions.js"> </script> 
    <script type = "text/javascript" src = "js/organic_reactions.js"> </script>
    <center>
    <input type="image" class="plus" onclick="openModal('id09')" src="Images/plus.png" alt="Submit" width="40px" height="40px">
    
    <label>Substitution Nucleophilic Bimolecular Reactions<br><br></label>
    <select class="form-control" name="options"  id="sn2Form" onchange="showsn2Groups(this.options[this.selectedIndex])">
        <option value="-1">Select reactants</option>  
            <%
                try
                {
                    Connection connection = ConnectionFactory.getConnection();
                    Statement statement = connection.createStatement();
                    ResultSet myRs=statement.executeQuery("select * from organic_sn2");
                    while(myRs.next())
                    {
                    %>
                    <script>
                        var sn2=document.createElement( 'option' );
                        sn2.re="<%=myRs.getString("Reactants")%>";
                        sn2.pr="<%=myRs.getString("Products")%>";
                        sn2.g1="<%=myRs.getString("Grp1")%>";
                        sn2.g2="<%=myRs.getString("Grp2")%>";
                        sn2.g3="<%=myRs.getString("Grp3")%>";
                        sn2.ca="<%=myRs.getString("center_atom")%>"; 
                        sn2.lg="<%=myRs.getString("Leaving_group")%>";
                        sn2.g4="<%=myRs.getString("Grp4")%>"; 
                        sn2.ag="<%=myRs.getString("Adding_group")%>"; 
                        sn2.value="<%=myRs.getInt("organic_reaction_ID")%>";
                        sn2.textContent="<%=myRs.getString("Reactants")%>";
                        //sn2.setAttribute("onClick","showsn2Groups(this);");
                        document.getElementById("sn2Form").appendChild(sn2);
                    </script>
                   <%
                    }
                }
                catch(Exception e)
                {
                    e.printStackTrace();
                }
            %>
    </select>
    <br>
    </center>
    <br />
<div>
     <div id="sn2Details" style="top:10%">
    </div>
 <input type="image" class="question" onclick="openModal('id00')" src="Images/question.png" alt="Submit" width="48px" height="48px">         
</div>        
     
    
         