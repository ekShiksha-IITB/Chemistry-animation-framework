<%-- 
    Document   : sidebar3
    Created on : 12 Jun, 2017, 2:45:05 PM
    Author     : abhi
--%>

<%--@page import="java.util.List"%>
<%@page import="Objects.Element"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<table id="myTable" border="0" cellspacing="0" style="border-spacing:0; width:100%;border-collapse: collapse;">
            <%
                List<Object> object = (List<Object>)request.getAttribute("myContact");
        for(int i=0;i<object.size();i++){
                MyModel myModel = (MyModel)object.get(i);
                String mail = myModel.getmail()!=null ? myModel.getmail().toString().trim() : "";
                String title = myModel.gettitle()!=null ? myModel.gettitle().toString().trim() : "";
                String name = myModel.getname()!=null ? myModel.getname().toString().trim() : "";               
            %>


            <tr>
            <td class="table-border-bottom"><label for="name">Name:</label></td>
            <td class="table-border-bottom"><input id="name" type="text" value='<%=name%>' name="name" class="required" style="height: 17px;"/>
            </td>
            <td class="table-border-bottom"><label for="contactTitle">Title:</label></td>
            <td class="table-border-bottom"> <input id="title" type="text" value='<%=title%>' name="title" class="required" style="height: 17px;"/>

            </td>
            <td class="table-border-bottom"><label for="mail">Email:</label></td>
            <td class="table-border-bottom"><input id="mail" type="text" value='<%=mail%>' name="mail" class="required email" style="height: 17px; "/>

            </td>
            </tr>

    <% } %>

            <tr align="center">
            <td valign="bottom" colspan="6" style="height: 45px; ">
            <input type="button" id="submit" name="submit" value="Save" style="width: 80px ; height:24px; text-align: center;border-radius: 10px 10px 10px 10px;"/> 
            <input type="button" id="revert" name="revert" value="Revert" style="width: 80px ; height:24px;text-align: center;border-radius: 10px 10px 10px 10px;"/></td>
            </tr>

      </table>   --%>
