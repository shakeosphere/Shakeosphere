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
<h1>${param.surname} Forename Frequencies</h1>
[<a href="surname_frequency.jsp">Surname List</a>]
<table>
	<sql:query var="forenames" dataSource="jdbc/ESTCTagLib">
		select first_name,count(*)
		from navigation.person,navigation.person_effective,navigation.all_roles
		where navigation.levenshtein(last_name,?)<3
		  and navigation.difference(last_name,?)>2
		  and person.pid=person_effective.pid
		  and person_effective.effective_id=person_id
		group by 1 order by 1;
		<sql:param>${param.surname}</sql:param>
		<sql:param>${param.surname}</sql:param>
	</sql:query>
	<thead><tr><th>Forename</th><th>Frequency</th></tr></thead>
	<tbody>
	<c:forEach items="${forenames.rows}" var="row" varStatus="rowCounter">
		<tr><td><a href="forename_histograms.jsp?surname=${param.surname}&forename=${row.first_name}">${row.first_name}</a></td><td>${row.count}</td></tr>
	</c:forEach>
	</tbody>
</table>

<jsp:include page="../footer.jsp" flush="true" />
</div>
</div>
</body>
