<%-- 
    Document   : sidebar2.jsp
    Created on : 8 Jun, 2017, 3:40:10 PM
    Author     : abhi
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

        <center>
           <%-- <label>Compounds<br><br></label>
        
            <select class="form-control" id="compound" onchange="getVal(this.value)">
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
        </select>--%>
          <div class="nav navbar-nav">
		  <h2>Crystal structures</h2>
                  <div id='options'>
                  <ul class=" navbar-nav">
            <li id="cubic" onclick="getLattice(1)"><a href='#'>Cubic</a></li>
            <li id="Tetragonal" onclick="getLattice(2)"><a href='#'>Tetragonal</a></li>
            <li id="Orthorhombic" onclick="getLattice(3)"><a href='#'>Orthorhombic</a></li>
            <li id="Hexagonal" onclick="getLattice(4)"><a href='#'>Hexagonal</a></li>
            <li id="Monoclinic" onclick="getLattice(5)"><a href='#'>Monoclinic</a></li>
            </ul>
                      
                  </div>
          
          </div>
    </center>

