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
	<jsp:param name="caller" value="location" />
</jsp:include>
<div id="center">
<estc:establishment eid="${param.eid}">
<h2><estc:establishmentEstablishment/></h2>

<c:if test="${estc:establishmentHasPersonAt(param.eid)}">
	<h3>Persons mentioned at this establishment</h3>
	<table>
	<sql:query var="persons" dataSource="jdbc/ESTCTagLib">
		select person.pid,last_name,first_name,min(pubyear),max(pubyear),sum(count)
		from navigation.person_at_by_year, navigation.person
		where eid = ?::int and person_at_by_year.pid=person.pid
		group by 1,2,3
		order by min,last_name,first_name;
		<sql:param>${param.eid}</sql:param>
	</sql:query>
	<c:forEach items="${persons.rows}" var="row" varStatus="rowCounter">
		<tr>
			<td>${row.min}</td>
			<td>${row.max}</td>
			<td><a href="../persons/person.jsp?pid=${row.pid}">${row.last_name}, ${row.first_name}</a></td>
		</tr>
	</c:forEach>
	</table>
</c:if>
</estc:establishment>
<jsp:include page="../footer.jsp" flush="true" />
</div>
</div>
</body>
