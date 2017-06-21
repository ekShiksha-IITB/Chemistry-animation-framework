<%-- 
    Document   : sidebar9
    Created on : 19 Jun, 2017, 02:18:35 AM
    Author     : shreya
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@page import="ConnectionUtil.ConnectionFactory"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
    <script type = "text/javascript" src = "js/animations.js"  > </script>
    <script type = "text/javascript" src = "js/hybridisation.js"  > </script>
    <center>
    <h3>Hydrocarbons</h3>
    </center>
            <%
                try
                {
                    Connection connection = ConnectionFactory.getConnection();
                    Statement statement = connection.createStatement();
                    ResultSet myRs=statement.executeQuery("select * from properties");
                    while(myRs.next())
                    {
                    %>
                    <option value="<%=myRs.getInt("hydro_id")%>" >Enter <%=myRs.getInt("hydro_id")%> for <%=myRs.getString("hydro_name")%></option>
                    <%
                    }
                }
                catch(Exception e)
                {
                    e.printStackTrace();
                }
            %>
    
<form method="Post" action="HydrocarbonServlet" >
    <input type="number" name="hydro_id">
    <input type='submit' value="Go" />
    <br><br> <h3>Properties</h3><br>
                              <strong>Hydrocarbon:</strong> <c:out value="${hydrocarbon.hydro_name}" /><br>
                              <strong>Hybrid Type:</strong> <c:out value="${hydrocarbon.hybrid_type}" /><br>
                          <strong>Atomic Orbitals:</strong> <c:out value="${hydrocarbon.atomic_orbitals}" /><br>
                       <strong> No. of s orbitals: </strong><c:out value="${hydrocarbon.s_orbitals}" /><br>
                        <strong>No. of p orbitals: </strong><c:out value="${hydrocarbon.p_orbitals}" /><br>
   <strong> No. of groups attached to carbon atom:</strong> <c:out value="${hydrocarbon.groups_attached_to_carbon}" /><br>
     <strong> Angle between each pair of orbitals(in Degrees): </strong><c:out value="${hydrocarbon.angle_beetween_each_pair}" /><br>
                      <strong>Spatial arrangement: </strong><c:out value="${hydrocarbon.spatial_arrangement}" /><br>
                  <strong> Percent of s character:</strong> <c:out value="${hydrocarbon.s_character}" /><br>
                  <strong> Percent of p character: </strong><c:out value="${hydrocarbon.p_character}" /><br>
                                   <strong> Shape:</strong> <c:out value="${hydrocarbon.shape}" /><br>
                                 <strong> Example: </strong><c:out value="${hydrocarbon.example}" /><br>
</form>
<div class="nav navbar-nav">
            <ul class=" navbar-nav">
                <li onclick="addHybridisation('${hy}')"><font color="magenta"><a href='#'>Show Animation</a></li>
            </ul>
</div>
                  
<input type="image" class="question" onclick="openModal(1)" src="Images/question.png" alt="Submit" width="48" height="48">
