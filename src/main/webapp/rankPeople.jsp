<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<sql:query var="indivDegreeRank" dataSource="jdbc/ESTCTagLib">
  SELECT name, role, degree, betweenness FROM analytics.individuals
  WHERE year = ?::int
  ORDER BY -degree
  LIMIT 10;
  <sql:param value="${param.year}"/>
</sql:query>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Shakeosphere</title>
	<style type="text/css" media="all">@import "resources/style.css";</style>
</head>
<jsp:include page="header.jsp" flush="true" />
<div id="center">
<table>
  <tr>
    <td>Name</td>
    <td>Role</td>
    <td>Degree</td>
    <td>Betweenness</td>
  </tr>
  <c:forEach items="${indivDegreeRank.rows}" var="row"
             varStatus="rowCounter">
    <tr>
      <td><c:out value="${row.name}"/></td>
      <td><c:out value="${row.role}"/></td>
      <td><c:out value="${row.degree}"/></td>
      <td><c:out value="${row.betweenness}"/></td>
    </tr>
  </c:forEach>
</table>
</div>
</html>