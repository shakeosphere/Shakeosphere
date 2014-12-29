<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Shakeosphere</title>
<style type="text/css" media="all">@import "resources/style.css";</style>
</head>
<body>
<div id="body">
<jsp:include page="header.jsp" flush="true" />
<jsp:include page="menu.jsp" flush="true">
	<jsp:param name="caller" value="pubyear" />
</jsp:include>
<div id="center">
<c:if test="${not empty param.surname }">
	<h2>Publication relationships for <c:out value="${param.forename }"/> <c:out value="${param.surname }"/></h2>
</c:if>
<p><c:if test="${empty param.label}">
	<a href="egocentric.jsp?forename=<c:out value="${param.forename }"/>&surname=<c:out value="${param.surname }"/>&label=yes">Show node labels</a>
</c:if>
<c:if test="${not empty param.label}">
	<a href="egocentric.jsp?forename=<c:out value="${param.forename }"/>&surname=<c:out value="${param.surname }"/>">Hide node labels</a>
</c:if></p>

<c:if test="${empty param.label}">
Hover over a node to view that person's name.
</c:if>
Double click on a node to view additional information about that person.

<c:set var="charge" value="50"/>
<c:set var="linkDistance" value="30"/>
<c:if test="${count < 10000 }">
	<c:set var="charge" value="5"/>	
	<c:set var="linkDistance" value="3"/>
</c:if>
<c:if test="${count < 2000 }">
	<c:set var="charge" value="10"/>	
	<c:set var="linkDistance" value="20"/>
</c:if>
<c:if test="${count < 500 }">
	<c:set var="charge" value="50"/>	
	<c:set var="linkDistance" value="30"/>
</c:if>
<c:if test="${count < 200 }">
	<c:set var="charge" value="50"/>	
	<c:set var="linkDistance" value="30"/>
</c:if>

	<div id="graph"></div>
				<c:url var="encodedMapURL" value="egocentricData.jsp">
					<c:param name="surname" value="${param.surname}"/>
					<c:param name="forename" value="${param.forename}"/>
				</c:url>
		<c:if test="${empty param.label}">
				<jsp:include page="graphs/forceGraph.jsp" flush="true">
					<jsp:param name="charge" value="${charge}" />
					<jsp:param name="linkDistance" value="${50}" />
					<jsp:param name="data_page" value="${encodedMapURL}" />
					<jsp:param name="year" value="${param.year}" />
				</jsp:include>
		</c:if>
		<c:if test="${not empty param.label}">
				<jsp:include page="graphs/labelledForceGraph.jsp" flush="true">
					<jsp:param name="charge" value="${charge}" />
					<jsp:param name="linkDistance" value="${50}" />
					<jsp:param name="data_page" value="${encodedMapURL}" />
					<jsp:param name="year" value="${param.year}" />
				</jsp:include>
		</c:if>

<jsp:include page="footer.jsp" flush="true" />
</div>
</div>
</body>
</html>
