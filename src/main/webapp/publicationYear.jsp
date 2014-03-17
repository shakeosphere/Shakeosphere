<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Shakeosphere</title>
<style type="text/css" media="all">@import "resources/layout.css";</style>
</head>
<body>

<div id="roof" style="background-image: url(images/graph_small.png); height: 92px"><div> </div></div>
<div id="content">
<jsp:include page="header.jsp" flush="true" />


<c:if test="${empty guid}">
	<c:set var="guid" value="guest" scope="session" />
</c:if>
<jsp:include page="menu.jsp" flush="true">
	<jsp:param name="caller" value="index" />
</jsp:include>
<div id="centerCol">
<c:if test="${not empty param.year }">
	<h1>Publication relationships for <c:out value="${param.year }"/></h1>
	<a href="publicationYear.jsp?year=<c:out value="${param.year - 1}"/>"><c:out value="${param.year - 1}"/></a> <a href="publicationYear.jsp?year=<c:out value="${param.year + 1}"/>"><c:out value="${param.year + 1}"/></a>
</c:if>
	<div id="graph"></div>
				<c:url var="encodedMapURL" value="publicationYearData.jsp">
					<c:param name="year" value="${param.year}"/>
				</c:url>
				<jsp:include page="graphs/forceGraph.jsp" flush="true">
					<jsp:param name="ld" value="30" />
					<jsp:param name="data_page" value="${encodedMapURL}" />
				</jsp:include>
<c:if test="${not empty param.year }">
	<br/>
	<a href="publicationCount.jsp">Back to decade histogram.</a>
</c:if>

<jsp:include page="footer.jsp" flush="true" />
</div>
</div>
</body>
</html>
