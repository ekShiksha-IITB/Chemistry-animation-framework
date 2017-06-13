<%-- 
    Document   : atom
    Created on : 12 Jun, 2017, 10:02:35 PM
    Author     : abhi
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<form method="Get" action="ElementServlet">
Atomic Number: <input type="number" name="atomic_number">
        <input type='submit' value="Go" />
        Details<br>
        Name:   <c:out value="${element.name}" /><br>
        Symbol: <c:out value="${element.symbol}" /><br>
        Type:   <c:out value="${element.type}" /><br>
        K-shell:    <c:out value="${element.k}" /><br>
        L-shell:    <c:out value="${element.l}" /><br>
        M-shell:    <c:out value="${element.m}" /><br>
        N-shell:    <c:out value="${element.n}" /><br>
        O-shell:    <c:out value="${element.o}" /><br>
        P-shell:    <c:out value="${element.p}" /><br>
        Q-shell:    <c:out value="${element.q}" /><br>
</form>
