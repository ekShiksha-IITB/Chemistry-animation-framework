
<%-- 
    Document   : sidebar2.jsp
    Created on : 8 Jun, 2017, 3:40:10 PM
    Author     : abhi
--%>
<%@page import="Objects.Lattice"%>
<%@page import="java.util.List"%>
<%@page import="DAO.LatticeDAO"%>
<%@page import="DAO.LatticeExamplesDAO"%>
<%@page import="ConnectionUtil.ConnectionFactory"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<input type="image" class="plus" onclick="openModal(3)" src="Images/plus.png" alt="Submit" width="40px" height="40px">
           
                  
        <label>Examples<br><br></label>
        
            <select class="form-control" id="compound" onchange="setShape(this.value)">
            <option value="-1">Choose compound</option>            
            <%               
                try
                {
                   Connection connection = ConnectionFactory.getConnection();
            Statement statement = connection.createStatement();
                    ResultSet myRs=statement.executeQuery("select * from lattice_examples");
            while(myRs.next())
            {
            %>
     
            <option value="<%=myRs.getInt("lattice_id")%>"><%=myRs.getString("example_name")%></option>
            
            <%
            }
                }
            catch(Exception e)
            {
                e.printStackTrace();
            }
            
            %>
            </select><br>
        <label style="font-size: 14px">Crystal Structures<br></label>

                   <ul class=" navbar-nav">
            <%  
         
                    LatticeDAO latticeDao=new LatticeDAO();
                    List<Lattice> lattices=latticeDao.getLattices();
                for(int i=0; i < lattices.size(); i++)
            { 
                   
            %>
                            
                    <li id="lattice<%= lattices.get(i).getId()%>" class="hintLeft lattices" onclick="setShape(<%= lattices.get(i).getId()%>)" style="cursor:pointer"><%= lattices.get(i).getName()%>
                        <span class="toolLeft"><%= lattices.get(i).getSideConstraint()+"<br>"+lattices.get(i).getAngleConstraint() %></span> 
                    </li><br>
        
             <%  
             }
             %>
        </ul> 
 <div class="hintLeft">
     <span><input style="visibility:hidden"></span>
</div> 
    <div id="SCC" style="visibility: hidden" onclick="getLattice(3)"><span class="choice">End-centered</span></div>
    <div id="Simple" style="visibility: hidden" onclick="getLattice(0)"><span class="choice">Simple</span></div>
    <div id="BCC" style="visibility: hidden" onclick="getLattice(1)"><span class="choice">Body-centered</span></div>
    <div id="FCC" style="visibility: hidden" onclick="getLattice(2)"><span class="choice">Face-centered</span></div>

  <div class="hintLeft">
    <input type="image" class="hint" src="Images/hint.png" height="38px" width="38px">
    <span class="toolLeft" id="help">Hint</span>
    <input type="image" class="question" onclick="openModal(1)" src="Images/question.png" alt="Submit" width="48px" height="48px">
</div>   