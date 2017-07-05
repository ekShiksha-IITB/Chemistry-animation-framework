<%-- 
    Document   : sidebar9
    Created on : 19 Jun, 2017, 02:18:35 AM
    Author     : shreya
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@page import="ConnectionUtil.ConnectionFactory"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<input type="image" class="plus" onclick="openModal('id07')" src="Images/plus.png" alt="Submit" width="40px" height="40px">
                             
<label >Hydrocarbons<br><br></label>
    <center>
        <form action="CompoundServlet"><br>
        <select class="form-control" name="example" onchange="compounddetails(this.value)">
        <option value="-1">Choose compound</option>  
         <% 
                    try
                    {
                        Connection connection = ConnectionFactory.getConnection();
                        Statement statement = connection.createStatement();
                        ResultSet myRs=statement.executeQuery("select * from organic_compounds");
                        while(myRs.next())
                        {
                        %>
                        <option value="<%=myRs.getInt("carbons")*100000000+myRs.getInt("hydrogen")*1000000+myRs.getInt("bond1")*10000+myRs.getInt("bond2")*100+myRs.getInt("type")%>" ><%=myRs.getString("name")%></option>
                        <%
                        }  
                    }
                    catch(Exception e)
                    {
                        e.printStackTrace();
                    }
        %>
    </select><br>
    </form>
    <br />  
    
    <select class="form-control" id="hydrocarbonForm" onchange="showProperties(this.options[this.selectedIndex])">
        <option value="-1">Select hydrocarbon</option>  
            <%
                try
                {
                    Connection connection = ConnectionFactory.getConnection();
                    Statement statement = connection.createStatement();
                    ResultSet myRs=statement.executeQuery("select * from properties");
                    while(myRs.next())
                    {
                    %>
                    <script>
                        var hydrocarbon=document.createElement( 'option' );
                                       hydrocarbon.value="<%=myRs.getInt("hydro_id")%>";
                                        hydrocarbon.name="<%=myRs.getString("hydro_name")%>";
                                        hydrocarbon.type="<%=myRs.getString("hybrid_type")%>";
                                    hydrocarbon.orbitals="<%=myRs.getString("atomic_orbitals")%>";
                                  hydrocarbon.s_orbitals="<%=myRs.getInt("s_orbitals")%>";
                                  hydrocarbon.p_orbitals="<%=myRs.getInt("p_orbitals")%>";
                                      hydrocarbon.groups="<%=myRs.getInt("groups_attached_to_carbon")%>";
                                       hydrocarbon.angle="<%=myRs.getInt("angle_beetween_each_pair")%>";
                                 hydrocarbon.arrangement="<%=myRs.getString("spatial_arrangement")%>";
                                 hydrocarbon.s_character="<%=myRs.getInt("s_character")%>";
                                 hydrocarbon.p_character="<%=myRs.getInt("p_character")%>";
                                     hydrocarbon.example="<%=myRs.getString("example")%>";
                                 hydrocarbon.textContent="<%=myRs.getString("hydro_name")%>";
                        document.getElementById("hydrocarbonForm").appendChild(hydrocarbon);
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
    <br>
</center>
<br>           
<div >
    <div  id="hydrocarbonDetails" style="top:10%">
    </div>
    <input type="image" class="question" onclick="openModal('id00')" src="Images/question.png" alt="Submit" width="48px" height="48px">
</div>
       