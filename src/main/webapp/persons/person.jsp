<%@ page errorPage="../error/error.jsp" %>
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

<c:if test="${estc:personHasAuthor(tag_person.pid)}">
	<h3>As Author</h3>
	<ul>
	<estc:foreachAuthor var="x">
		<estc:author>
			<estc:publication ID="${tag_author.ID}">
				<li><estc:publicationDate1/>: <a href="../publications/publication.jsp?id=<estc:publicationID/>"><estc:publicationTitle/></a>
			</estc:publication>
		</estc:author>
	</estc:foreachAuthor>
	</ul>
</c:if>

<c:if test="${estc:personHasPublisher(tag_person.pid)}">
	<h3>As Publisher</h3>
	<ul>
	<estc:foreachPublisher var="x">
		<estc:publisher>
			<estc:publication ID="${tag_publisher.ID}">
				<li><estc:publicationDate1/>: <a href="../publications/publication.jsp?id=<estc:publicationID/>"><estc:publicationTitle/></a>
			</estc:publication>
		</estc:publisher>
	</estc:foreachPublisher>
	</ul>
</c:if>

<c:if test="${estc:personHasPrinter(tag_person.pid)}">
	<h3>As Printer</h3>
	<ul>
	<estc:foreachPrinter var="x">
		<estc:printer>
			<estc:publication ID="${tag_printer.ID}">
				<li><estc:publicationDate1/>: <a href="../publications/publication.jsp?id=<estc:publicationID/>"><estc:publicationTitle/></a>
			</estc:publication>
		</estc:printer>
	</estc:foreachPrinter>
	</ul>
</c:if>

<c:if test="${estc:personHasBookseller(tag_person.pid)}">
	<h3>As Bookseller</h3>
	<ul>
	<estc:foreachBookseller var="x">
		<estc:bookseller>
			<estc:publication ID="${tag_bookseller.ID}">
				<li><estc:publicationDate1/>: <a href="../publications/publication.jsp?id=<estc:publicationID/>"><estc:publicationTitle/></a>
			</estc:publication>
		</estc:bookseller>
	</estc:foreachBookseller>
	</ul>
</c:if>

</estc:person>
<jsp:include page="../footer.jsp" flush="true" />
</div>
</div>
</body>
