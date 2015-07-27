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
<h1>Surname Frequencies</h1>
<table>
	<sql:query var="surnames" dataSource="jdbc/ESTCTagLib">
		select last_name,count(*) from navigation.person group by 1 order by 2 desc,1;
	</sql:query>
	<thead><tr><th>Surname</th><th>Frequency</th></tr></thead>
	<tbody>
	<c:forEach items="${surnames.rows}" var="row" varStatus="rowCounter">
		<tr><td><a href="forename_frequency.jsp?surname=${row.last_name}">${row.last_name}</a></td><td>${row.count}</td></tr>
	</c:forEach>
	</tbody>
</table>

<jsp:include page="../footer.jsp" flush="true" />
</div>
</div>
</body>
