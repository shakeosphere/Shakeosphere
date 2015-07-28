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
<h2>Verified People in Shakeosphere</h2>
	<sql:query var="persons" dataSource="jdbc/ESTCTagLib">
		select distinct pid, first_name, last_name
		from navigation.person_aliased;
	</sql:query>
	<c:forEach items="${persons.rows}" var="row" varStatus="rowCounter">
		<c:if test="${rowCounter.first}">
			<ul>
		</c:if>
		<li><a href="../persons/person.jsp?pid=${row.pid}">${row.last_name}, ${row.first_name}</a>
		<c:if test="${rowCounter.last}">
			</ul>
		</c:if>
	</c:forEach>
<jsp:include page="../footer.jsp" flush="true" />
</div>
</div>
</body>
