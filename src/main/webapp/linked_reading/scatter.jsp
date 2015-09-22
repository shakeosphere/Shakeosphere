<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Shakeosphere</title>
<style type="text/css" media="all">@import "../resources/style.css";</style>
</head>
<body>
<div id="body">
<jsp:include page="../header.jsp" flush="true" />
<jsp:include page="../menu.jsp" flush="true">
	<jsp:param name="caller" value="lda" />
</jsp:include>
<div id="center">
<c:if test="${not empty param.year }">
	<h1>LDA for <c:out value="${param.year }"/></h1>
</c:if>


	<div id="graph"></div>
			<sql:query var="domain" dataSource="jdbc/ESTCTagLib">
				select distinct document from linked_reading.lda_max where year=?::int order by 1 desc;
				<sql:param>${param.year}</sql:param>
			</sql:query>
			<script>
			var documentDomain = [
			<c:forEach items="${domain.rows}" var="domRow" varStatus="domainCounter">
				"${domRow.document}"<c:if test="${!domainCounter.last}">,</c:if>
			</c:forEach>
			];
			</script>
			<sql:query var="nodes" dataSource="jdbc/ESTCTagLib">
				select topic,document,max from linked_reading.lda_max where year=?::int order by 1,2;
				<sql:param>${param.year}</sql:param>
			</sql:query>
			<script>
			var dataset = [
			<c:forEach items="${nodes.rows}" var="nodeRow" varStatus="nodeCounter">
				[${nodeRow.topic}, "${nodeRow.document}", ${nodeRow.max} ]<c:if test="${!nodeCounter.last}">,</c:if>
			</c:forEach>
			];
			</script>
				<jsp:include page="../graphs/scatterplot.jsp" flush="true">
					<jsp:param name="year" value="${param.year}" />
					<jsp:param name="maxRadius" value="6" />
					<jsp:param name="opacity" value=".5" />
					<jsp:param name="xLabel" value="Topic" />
					<jsp:param name="yLabel" value="Document" />
					<jsp:param name="click_action" value="ldaDisplay.jsp?document=" />
					<jsp:param name="click_continuation" value="&topic=" />
				</jsp:include>

<jsp:include page="../footer.jsp" flush="true" />
</div>
</div>
</body>
</html>
