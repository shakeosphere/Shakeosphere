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
<estc:publication ID="${param.id}">
	<h2><estc:publicationTitle/></h2>
	<table>
		<tr><th>Publication&nbsp;Date</th><td><estc:publicationDate1/></td></tr>
		<tr><th>Remainder</th><td><estc:publicationRemainder/></td></tr>
		<tr><th>Extent</th><td><estc:publicationExtent/></td></tr>
		<tr><th>Location</th><td><estc:publicationPubLocation/></td></tr>
		<tr><th>Publisher</th><td><estc:publicationPublisher/></td></tr>
	</table>
	<hr>
	
	<c:if test="${estc:recordHasAuthor(param.id)}">
		<h4>Author(s)</h4>
		<estc:record ID="${param.id}">
		<ul>
		<estc:foreachAuthor var="x">
			<estc:author>
				<estc:person pid="${tag_author.pid}">
					<li><a href="../persons/person.jsp?pid=<estc:personPid/>"><estc:personFirstName/> <estc:personLastName/></a>
				</estc:person>
			</estc:author>
		</estc:foreachAuthor>
		</ul>
		</estc:record>
	</c:if>
	
	<c:if test="${estc:recordHasPublisher(param.id)}">
		<h4>Publisher(s)</h4>
		<estc:record ID="${param.id}">
		<ul>
		<estc:foreachPublisher var="x">
			<estc:publisher>
				<estc:person pid="${tag_publisher.pid}">
					<li><a href="../persons/person.jsp?pid=<estc:personPid/>"><estc:personFirstName/> <estc:personLastName/></a>
				</estc:person>
			</estc:publisher>
		</estc:foreachPublisher>
		</ul>
		</estc:record>
	</c:if>
	
	<c:if test="${estc:recordHasPrinter(param.id)}">
		<h4>Printer(s)</h4>
		<estc:record ID="${param.id}">
		<ul>
		<estc:foreachPrinter var="x">
			<estc:printer>
				<estc:person pid="${tag_printer.pid}">
					<li><a href="../persons/person.jsp?pid=<estc:personPid/>"><estc:personFirstName/> <estc:personLastName/></a>
				</estc:person>
			</estc:printer>
		</estc:foreachPrinter>
		</ul>
		</estc:record>
	</c:if>
	
	<c:if test="${estc:recordHasBookseller(param.id)}">
		<h4>Bookseller(s)</h4>
		<estc:record ID="${param.id}">
		<ul>
		<estc:foreachBookseller var="x">
			<estc:bookseller>
				<estc:person pid="${tag_bookseller.pid}">
					<li><a href="../persons/person.jsp?pid=<estc:personPid/>"><estc:personFirstName/> <estc:personLastName/></a>
				</estc:person>
			</estc:bookseller>
		</estc:foreachBookseller>
		</ul>
		</estc:record>
	</c:if>
</estc:publication>
<jsp:include page="../footer.jsp" flush="true" />
</div>
</div>
</body>
