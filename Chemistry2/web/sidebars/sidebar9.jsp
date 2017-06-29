<%-- 
    Document   : sidebar9
    Created on : 19 Jun, 2017, 02:18:35 AM
    Author     : shreya
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@page import="ConnectionUtil.ConnectionFactory"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<input type="image" class="plus" onclick="openModal(8)" src="Images/plus.png" alt="Submit" width="40px" height="40px">
                             
<label >Hydrocarbons<br><br></label>

    <center>
    <form action="HydrocarbonServlet">
    <select class="form-control" name="item">
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
                    <option value="<%=myRs.getInt("hydro_id")%>" ><%=myRs.getInt("hydro_id")%>.<%=myRs.getString("hydro_name")%></option>
                    <%
                    }
                }
                catch(Exception e)
                {
                    e.printStackTrace();
                }
            %>
    </select><br>
    <input type="submit" value="Go" class="btn btn-default reaction"/>
            <p class="choice" onclick="addHybridisation('${hy}')">Show Animation</p>

    </form>
    <br>
    
    <form action="CompoundServlet"><br>
    <select class="form-control" name="example">
        <option value="-1">Choose compound</option>  
         <% 
            if (request.getParameter("item") != null && request.getParameter("item") != "") 
            {
                long num = Long.parseLong(request.getParameter("item"));
                    try
                    {
                        Connection connection = ConnectionFactory.getConnection();
                        Statement statement = connection.createStatement();
                        ResultSet myRs=statement.executeQuery("select * from organic_compounds where type=" +num);
                        while(myRs.next())
                        {
                        %>
                        <option value="<%=myRs.getInt("id")%>" ><%=myRs.getString("name")%></option>
                        <%
                        }
                    }
                    catch(Exception e)
                    {
                        e.printStackTrace();
                    }
            }
        %>
    </select><br>
      <input type="submit" value="Go" class="btn btn-default reaction"/>
            <p class="choice" onclick="Hydrocarbon('${alkanes.carbons}', '${alkanes.hydrogen}', '${alkanes.bond1}' , '${alkanes.bond2}', '${alkanes.type}')">Show Structure</p>

    </form>
</center>
<br>
                  
<div class="hintLeft"><input type="image" class="hint" src="Images/hint.png" height="38px" width="38px">
    <span class="toolLeft" id="atomDetails" style="top:10%">
    <br><h3><strong>Properties</strong></h3><br>
                                       <strong>Hydrocarbon:</strong><c:out value="${hydrocarbon.hydro_name}" /><br>
                                       <strong>Hybrid Type:</strong><c:out value="${hydrocarbon.hybrid_type}" /><br>
                                   <strong>Atomic Orbitals:</strong><c:out value="${hydrocarbon.atomic_orbitals}" /><br>
                               <strong> No. of s orbitals: </strong><c:out value="${hydrocarbon.s_orbitals}" /><br>
                                <strong>No. of p orbitals: </strong><c:out value="${hydrocarbon.p_orbitals}" /><br>
            <strong> No. of groups attached to carbon atom:</strong><c:out value="${hydrocarbon.groups_attached_to_carbon}" /><br>
  <strong> Angle between each pair of orbitals(in Degrees):</strong><c:out value="${hydrocarbon.angle_beetween_each_pair}" /><br>
                              <strong>Spatial arrangement: </strong><c:out value="${hydrocarbon.spatial_arrangement}" /><br>
                           <strong> Percent of s character:</strong><c:out value="${hydrocarbon.s_character}" /><br>
                          <strong> Percent of p character: </strong><c:out value="${hydrocarbon.p_character}" /><br>                                             <strong> Shape:</strong><c:out value="${hydrocarbon.shape}" /><br>
                                         <strong> Example: </strong><c:out value="${hydrocarbon.example}" /><br>
    </span>
    <input type="image" class="question" onclick="openModal(1)" src="Images/question.png" alt="Submit" width="48px" height="48px">
</div>