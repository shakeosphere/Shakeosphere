<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
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

<sql:query var="primary" dataSource="jdbc/ESTCTagLib">
	select person_base.first_name,defined,handle
	from navigation.person_base,navigation.person_authority,navigation.user
	where person_authority.pid = ?::int
	  and person_authority.pid = person_authority.alias
	  and person_base.pid=person_authority.alias
	  and person_authority.id=navigation.user.id
	order by 1;
	<sql:param>${param.pid}</sql:param>
</sql:query>
<c:forEach items="${primary.rows}" var="row" varStatus="rowCounter">
	Validated: ${row.defined} <i>(${row.handle})</i>
</c:forEach>

<sql:query var="aliases" dataSource="jdbc/ESTCTagLib">
	select person_base.first_name,person_base.last_name,handle
	from navigation.person_base,navigation.person_authority,navigation.user
	where person_authority.pid = ?::int
	  and person_authority.pid != person_authority.alias
	  and person_base.pid=person_authority.alias
	  and person_authority.id=navigation.user.id
	order by 2,1;
	<sql:param>${param.pid}</sql:param>
</sql:query>
<c:forEach items="${aliases.rows}" var="row" varStatus="rowCounter">
	<c:if test="${rowCounter.first}">
		<h3>Aliases</h3>
		<ul>
	</c:if>
	<li>${row.first_name} ${row.last_name} <i>(${row.handle})</i>
	<c:if test="${rowCounter.last}">
		</ul>
	</c:if>
</c:forEach>


<c:if test="${empty param.year}">
	<h3>Active Years</h3>
</c:if>
<c:if test="${not empty param.year}">
	<a href="person.jsp?pid=<c:out value="${param.pid}"/>&year=<c:out value="${param.year - 1}"/>"><c:out value="${param.year - 1}"/></a> <a href="person.jsp?pid=<c:out value="${param.pid}"/>&year=<c:out value="${param.year + 1}"/>"><c:out value="${param.year + 1}"/></a>
	(<a href="person.jsp?pid=<c:out value="${param.pid}"/>">show all</a>)
	<h4>Activity for ${param.year}</h4>
</c:if>
<jsp:include page="../graphs/personHistogram.jsp" flush="true">
	<jsp:param name="id" value="${param.pid}" />
</jsp:include>

<c:if test="${estc:personHasPersonAtByYear(param.pid)}">
	<h3>Establishments over time</h3>
	(number of mentions in parentheses)
	<ul>
	<estc:foreachPersonAtByYear var="estID" sortCriteria="pubyear, count desc">
		<estc:personAtByYear>
			<li><estc:personAtByYearPubyear/> <estc:personAtByYearLocational/>: 
				<estc:establishment eid="${tag_personAtByYear.eid}">
					<a href="../establishments/establishment.jsp?lid=<estc:personAtByYearEid/>"><estc:establishmentEstablishment/></a>
				</estc:establishment>
				(<estc:personAtByYearCount/>)
				<jsp:include page="sublocations.jsp">
					<jsp:param name="person" value="${param.pid}"/>
					<jsp:param name="child" value="${tag_personAtByYear.eid}"/>
					<jsp:param name="year" value="${tag_personAtByYear.pubyear}"/>
				</jsp:include>
		</estc:personAtByYear>
	</estc:foreachPersonAtByYear>
	</ul>
</c:if>

<c:if test="${estc:personHasPersonInByYear(param.pid)}">
	<h3>Locations over time</h3>
	(number of mentions in parentheses)
	<ul>
	<estc:foreachPersonInByYear var="locID" sortCriteria="pubyear, count desc">
		<estc:personInByYear>
			<li><estc:personInByYearPubyear/> <estc:personInByYearLocational/>: 
				<estc:location lid="${tag_personInByYear.lid}">
					<a href="../locations/location.jsp?lid=<estc:personInByYearLid/>"><estc:locationLocation/></a>
				</estc:location>
				(<estc:personInByYearCount/>)
				<jsp:include page="sublocations.jsp">
					<jsp:param name="person" value="${param.pid}"/>
					<jsp:param name="child" value="${tag_personInByYear.lid}"/>
					<jsp:param name="year" value="${tag_personInByYear.pubyear}"/>
				</jsp:include>
		</estc:personInByYear>
	</estc:foreachPersonInByYear>
	</ul>
</c:if>

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
