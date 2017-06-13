<%-- 
    Document   : sidebar.jsp
    Created on : 8 Jun, 2017, 3:21:37 PM
    Author     : abhi
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

        <center>
            <label>Compounds<br><br></label>
        
            <select class="form-control" id="compound" onchange="createVSEPRShapes(this.value)">
            <option value="-1">Choose compound</option>
            
            <%
                try
                {
                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                    Connection myConn=DriverManager.getConnection("jdbc:mysql://localhost:3306/Chemistry2","root","shoot");
                    Statement mystmt=myConn.createStatement();
                    ResultSet myRs=mystmt.executeQuery("select * from VSEPR");
            while(myRs.next())
            {
            %>
            <option value="<%=myRs.getInt("shape_id")%>" ><%=myRs.getString("compound_name")%></option>
            
            <%
            }
                }
            catch(Exception e)
            {
                e.printStackTrace();
            }
            
            %>
        </select>
         </center>

          <div class="nav navbar-nav">
		  <h2>Shapes</h2>
                  <div id='options'>
                  <ul class=" navbar-nav">
            <li id="linear" onclick="createVSEPRShapes(1)"><a href='#'>Linear</a></li>
            <li id="trigonal" onclick="createVSEPRShapes(2)"><a href='#'>Trigonal Planar</a></li>
            <li id="tetrahedral" onclick="createVSEPRShapes(3)"><a href='#'>Tetrahedral</a></li>
            <li id="pyramidal" onclick="createVSEPRShapes(4)"><a href='#'>Trigonal Bipyramidal</a></li>
            <li id="octahedral" onclick="createVSEPRShapes(5)"><a href='#'>Octahedral</a></li>
            <li id="pentpy" onclick="createVSEPRShapes(6)"><a href='#'>Pentagonal Bipyramidal</a></li>
            </ul>
                      
                  </div>
          
          </div>

