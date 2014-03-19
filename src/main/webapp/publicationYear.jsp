<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
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
	<jsp:param name="caller" value="index" />
</jsp:include>
<div id="center">
<c:if test="${not empty param.year }">
	<h1>Publication relationships for <c:out value="${param.year }"/></h1>
	<a href="publicationYear.jsp?year=<c:out value="${param.year - 1}"/>"><c:out value="${param.year - 1}"/></a> <a href="publicationYear.jsp?year=<c:out value="${param.year + 1}"/>"><c:out value="${param.year + 1}"/></a>
</c:if>
<c:if test="${empty param.label}">
	<br/><a href="publicationYear.jsp?year=<c:out value="${param.year }"/>&label=yes">Show node labels</a>
</c:if>
<c:if test="${not empty param.label}">
	<br/><a href="publicationYear.jsp?year=<c:out value="${param.year }"/>">Hide node labels</a>
</c:if>
	<div id="graph"></div>
				<c:url var="encodedMapURL" value="publicationYearData.jsp">
					<c:param name="year" value="${param.year}"/>
				</c:url>
		<c:if test="${empty param.label}">
				<jsp:include page="graphs/forceGraph.jsp" flush="true">
					<jsp:param name="ld" value="30" />
					<jsp:param name="data_page" value="${encodedMapURL}" />
				</jsp:include>
		</c:if>
		<c:if test="${not empty param.label}">
				<jsp:include page="graphs/labelledForceGraph.jsp" flush="true">
					<jsp:param name="ld" value="30" />
					<jsp:param name="data_page" value="${encodedMapURL}" />
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
