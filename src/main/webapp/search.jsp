<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="estc" uri="http://icts.uiowa.edu/ESTCTagLib"%>
<%@ taglib prefix="lucene" uri="http://icts.uiowa.edu/lucene"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


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
	<h2>Search Shakeosphere</h2>
	<form method='POST' action='search.jsp'>
		<input name="query" value="${param.query}" size=50> <input type=submit name=submitButton value=Search>
	</form>
	The operators &amp; and | are available for logical <i>and</i> and <i>or</i> constraints,
	as are parentheses for logical grouping.  For example, <i>Shakespeare &amp; Oxlade</i> requires
	both names to occur in a result.
	<br/>
	<c:if test="${not empty param.query}">
		<c:set var="rewrittenQuery" value="${fn:replace(param.query,'(', ' ( ')}"/>
		<c:set var="rewrittenQuery" value="${fn:replace(rewrittenQuery,')', ' ) ')}"/>
		<c:set var="rewrittenQuery" value="${fn:replace(rewrittenQuery,'&', ' & ')}"/>
		<c:set var="rewrittenQuery" value="${fn:replace(rewrittenQuery,'|', ' | ')}"/>
		<c:set var="rewrittenQuery" value="${fn:replace(rewrittenQuery,'!', ' ! ')}"/>
		<h3>Search Results:	<c:out value="${rewrittenQuery}" /></h3>
		<lucene:search lucenePath="/Users/eichmann/estc/pubIndex" label="content" queryParserName="boolean" queryString="${rewrittenQuery}">
			<p>
				Result Count:
				<lucene:count />
			</p>
			<table>
				<tr>
					<th>ID</th>
					<th>Title</th>
					<th>Score</th>
				</tr>
				<lucene:searchIterator>
					<tr>
						<td><a href="publications/publication.jsp?id=<lucene:hit label="id"/>"><lucene:hit label="id" /></a></td>
						<td><lucene:hit label="title" /></td>
						<td align=right><fmt:formatNumber type="number" pattern="0.00"><lucene:hit label="score"></lucene:hit></fmt:formatNumber></td>
					</tr>
				</lucene:searchIterator>
			</table>
		</lucene:search>
	</c:if>
<jsp:include page="footer.jsp" flush="true" />
</div>
</div>
</body>
