<%@page import="Objects.Subtopic"%>
<%@page import="Objects.Topic"%>
<%@page import="java.util.*"%>
<%@page import="DAO.TopicDAO"%>
<%@page import="DAO.SubtopicDAO"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
    <title>Chemistry</title>
    </head>
    <body>
        <strong>Description:</strong>
       <c:out value="${description}"/>
       
    </body>

</html>