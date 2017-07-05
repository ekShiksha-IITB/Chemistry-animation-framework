<%-- 
    Document   : sidebar10.jsp
    Created on : 16 Jun, 2017, 2:46:12 PM
    Author     : shreya
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@page import="ConnectionUtil.ConnectionFactory"%>
<%@page import="java.sql.*"%><%@page import="java.util.*"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

    <div>
    <center>
    <input type="image" class="plus" onclick="openModal('id08')" src="Images/plus.png" alt="Submit" width="40px" height="40px">
    
    <label>Substitution Nucleophilic Unimolecular Reactions<br><br></label>
    <select class="form-control" name="options"  id="sn1Form" onchange="showsn1Groups(this.options[this.selectedIndex])">
        <option value="-1">Select reactants</option>  
            <%
                try
                {
                    Connection connection = ConnectionFactory.getConnection();
                    Statement statement = connection.createStatement();
                    ResultSet myRs=statement.executeQuery("select * from organic_sn1");
                    while(myRs.next())
                    {
                    %>
                    <script>
                        var sn1=document.createElement( 'option' );
                        sn1.re="<%=myRs.getString("Reactants")%>";
                        sn1.pr="<%=myRs.getString("Products")%>";
                        sn1.g1="<%=myRs.getString("Grp1")%>";
                        sn1.g2="<%=myRs.getString("Grp2")%>";
                        sn1.g3="<%=myRs.getString("Grp3")%>";
                        sn1.lg="<%=myRs.getString("Leaving_group")%>";
                        sn1.ca="<%=myRs.getString("center_atom")%>"; 

                        sn1.g4="<%=myRs.getString("Grp4")%>"; 
                        sn1.ag="<%=myRs.getString("Adding_group")%>"; 
                        sn1.value="<%=myRs.getInt("organic_reaction_ID")%>";
                        sn1.textContent="<%=myRs.getString("Reactants")%>";
                       // sn1.setAttribute("onClick","showsn1Groups(this);");
                        document.getElementById("sn1Form").appendChild(sn1);
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
    <div id="sn1Details" style="top:10%">
    </div>
 <input type="image" class="question" onclick="openModal('id00')" src="Images/question.png" alt="Submit" width="48px" height="48px">         
</div>        
     
    </div>      
         