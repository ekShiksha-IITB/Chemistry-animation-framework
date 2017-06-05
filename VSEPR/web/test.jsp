<%-- 
    Document   : index
    Created on : 31 May, 2017, 11:47:05 AM
    Author     : aishwarya
--%>

<%@page import="java.sql.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Select an atom</title>
    </head>
    <body>
        <br><br><br>
    <center>
        <label>Atoms<br></label>
        
        <select>
            <option value="-1">Select an atom</option>
            
            <%
                try
                {
                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                    Connection myConn=DriverManager.getConnection("jdbc:mysql://localhost:3306/Chemistry","root","shoot");
                    Statement mystmt=myConn.createStatement();
                    ResultSet myRs=mystmt.executeQuery("select * from Element");
            while(myRs.next())
            {
            %>
            <option value="<%=myRs.getInt("atomic_number")%>"><%=myRs.getString("name")%></option>
            
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
    </body>
</html>
