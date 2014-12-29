<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="estc" uri="http://icts.uiowa.edu/ESTCTagLib"%>


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
	<jsp:param name="caller" value="person" />
</jsp:include>
<div id="center">
<estc:person pid="${param.pid}">
<h2><estc:personFirstName/> <estc:personLastName/></h2>


<c:if test="${not empty param.year}">
	<a href="person.jsp?pid=<c:out value="${param.pid}"/>&year=<c:out value="${param.year - 1}"/>"><c:out value="${param.year - 1}"/></a> <a href="person.jsp?pid=<c:out value="${param.pid}"/>&year=<c:out value="${param.year + 1}"/>"><c:out value="${param.year + 1}"/></a>
	(<a href="person.jsp?pid=<c:out value="${param.pid}"/>">show all</a>)
	<h4>Activity for ${param.year}</h4>
</c:if>

<a href="../egocentric.jsp?forename=<estc:personFirstName/>&surname=<estc:personLastName/>">Show relationships for this person.</a>

<c:if test="${estc:personHasAuthorByYear(tag_person.pid, param.year)}">
	<h3>As Author</h3>
	<ul>
	<estc:foreachAuthorByYear var="pubID" year="${param.year}">
		<estc:publication ID="${pubID}">
			<li><estc:publicationDate1/>: <a href="../publications/publication.jsp?id=<estc:publicationID/>"><estc:publicationTitle/></a>
		</estc:publication>
	</estc:foreachAuthorByYear>
	</ul>
</c:if>

<c:if test="${estc:personHasPublisherByYear(tag_person.pid, param.year)}">
	<h3>As Publisher</h3>
	<ul>
	<estc:foreachPublisherByYear var="pubID" year="${param.year}">
		<estc:publication ID="${pubID}">
			<li><estc:publicationDate1/>: <a href="../publications/publication.jsp?id=<estc:publicationID/>"><estc:publicationTitle/></a>
		</estc:publication>
	</estc:foreachPublisherByYear>
	</ul>
</c:if>

<c:if test="${estc:personHasPrinterByYear(tag_person.pid, param.year)}">
	<h3>As Printer</h3>
	<ul>
	<estc:foreachPrinterByYear var="pubID" year="${param.year}">
		<estc:publication ID="${pubID}">
			<li><estc:publicationDate1/>: <a href="../publications/publication.jsp?id=<estc:publicationID/>"><estc:publicationTitle/></a>
		</estc:publication>
	</estc:foreachPrinterByYear>
	</ul>
</c:if>

<c:if test="${estc:personHasBooksellerByYear(tag_person.pid, param.year)}">
	<h3>As Bookseller</h3>
	<ul>
	<estc:foreachBooksellerByYear var="pubID" year="${param.year}">
		<estc:publication ID="${pubID}">
			<li><estc:publicationDate1/>: <a href="../publications/publication.jsp?id=<estc:publicationID/>"><estc:publicationTitle/></a>
		</estc:publication>
	</estc:foreachBooksellerByYear>
	</ul>
</c:if>

</estc:person>
<jsp:include page="../footer.jsp" flush="true" />
</div>
</div>
</body>
