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
<c:if test="${not empty param.year }">
	<h1>Publication relationships for <c:out value="${param.year }"/></h1>
</c:if>
<c:if test="${empty param.label}">
	<a href="publicationYear.jsp?year=<c:out value="${param.year - 1}"/>"><c:out value="${param.year - 1}"/></a> <a href="publicationYear.jsp?year=<c:out value="${param.year + 1}"/>"><c:out value="${param.year + 1}"/></a>
	<br/><a href="publicationYear.jsp?year=<c:out value="${param.year }"/>&label=yes">Show node labels</a>
</c:if>
<c:if test="${not empty param.label}">
	<a href="publicationYear.jsp?year=<c:out value="${param.year - 1}"/>&label=yes"><c:out value="${param.year - 1}"/></a> <a href="publicationYear.jsp?year=<c:out value="${param.year + 1}"/>&label=yes"><c:out value="${param.year + 1}"/></a>
	<br/><a href="publicationYear.jsp?year=<c:out value="${param.year }"/>">Hide node labels</a>
</c:if>

<sql:query var="nodes" dataSource="jdbc/Shakeosphere">
		select count(*) from estc.pub_year where pubdate = ?::int ;
		<sql:param value="${param.year}"/>
</sql:query>
<c:forEach items="${nodes.rows}" var="row" varStatus="rowCounter">
	<fmt:parseNumber var="count" value="${row.count}"/>
</c:forEach>
<br/>Count: <c:out value="${count}"/>
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
				<c:url var="encodedMapURL" value="publicationYearData.jsp">
					<c:param name="year" value="${param.year}"/>
				</c:url>
		<c:if test="${empty param.label}">
				<jsp:include page="graphs/forceGraph.jsp" flush="true">
					<jsp:param name="charge" value="${charge}" />
					<jsp:param name="linkDistance" value="${500.0/count}" />
					<jsp:param name="data_page" value="${encodedMapURL}" />
					<jsp:param name="year" value="${param.year}" />
				</jsp:include>
		</c:if>
		<c:if test="${not empty param.label}">
				<jsp:include page="graphs/labelledForceGraph.jsp" flush="true">
					<jsp:param name="charge" value="${charge}" />
					<jsp:param name="linkDistance" value="${500.0/count}" />
					<jsp:param name="data_page" value="${encodedMapURL}" />
					<jsp:param name="year" value="${param.year}" />
				</jsp:include>
		</c:if>
<c:if test="${not empty param.year }">
	<br/>
	<a href="publicationCount.jsp">Back to decade histogram.</a>
</c:if>

<jsp:include page="footer.jsp" flush="true" />
</div>
</div>
</body>
</html>
