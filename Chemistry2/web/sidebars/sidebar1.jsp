<%-- 
    Document   : sidebar1.jsp
    Created on : 9 Jun, 2017, 11:00:44 AM
    Author     : abhi
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<center>
            <label>Atomic View<br><br></label>
        
            <select class="form-control" id="compound" onchange="getElement(this.value)">
            <option value="-1">Choose Atom</option>
            
            <%
                try
                {
                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                    Connection myConn=DriverManager.getConnection("jdbc:mysql://localhost:3306/Chemistry2","root","shoot");
                    Statement mystmt=myConn.createStatement();
                    ResultSet myRs=mystmt.executeQuery("select * from Element");
            while(myRs.next())
            {
            %>
            <option value="<%=myRs%>"><%=myRs.getString("symbol")%></option>            
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
    Atomic number:<input type="number" id="Z">
        <h2>Choose view</h2>
        <div>
        <ul class=" navbar-nav">
  <li onclick="getAtom(1)"><a href='#'>Valence shell view</a></li>
  <li onclick="getAtom(2)"><a href='#'>Electron view</a></li>
  <li onclick="getAtom(3)"><a href='#'>Full View</a></li>

  </ul>

        </div>

</div>
