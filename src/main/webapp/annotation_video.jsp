<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="estc" uri="http://icts.uiowa.edu/ESTCTagLib"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Shakeosphere</title>
<style type="text/css" media="all">
@import "resources/style.css";
</style>
</head>
<body>
	<div id="body">
		<jsp:include page="header.jsp" flush="true" />
		<jsp:include page="menu.jsp" flush="true">
			<jsp:param name="caller" value="person" />
		</jsp:include>
		<div id="center">
			<h2>Welcome to Shakeosphere's annotation interface!</h2>

			<sql:query var="available" dataSource="jdbc/ESTCTagLib">
				select count(*) from navigation.person where not exists (select id from navigation.person_authority where person_authority.pid=person.pid);
			</sql:query>
			<c:forEach items="${available.rows}" var="row" varStatus="rowCounter">
				<c:set var="available" value="${row.count}" />
			</c:forEach>

			<iframe width="560" height="315" src="https://www.youtube.com/embed/aM5SC2oHNjI" frameborder="0" allowfullscreen></iframe>

			<c:if test="${not empty uid}">
				<p>Click on the "Identify People" link in the menu on the left
					to create new authority records or bind names to an existing
					authority record.</p>
			</c:if>

			<c:if test="${empty uid}">
				<p>Click on the "Request an Account" link in the menu on the
					left to submit a request to be added as a Shakeosphere annotator.
					All annotations are publicly credited to their creators - your
					chance at crowdsourcing fame and glory!</p>
			</c:if>
			
			<h2>Our Leaderboard</h2>
			<sql:query var="leader" dataSource="jdbc/ESTCTagLib">
				select handle,count(*),max(defined)
				from navigation.user natural join navigation.person_authority
				group by 1 order by 2 desc, 3 desc;
			</sql:query>
			<table>
			<tr><th>User</th><th>Total Annotations</th><th>Last Annotation At</th></tr>
			<c:forEach items="${leader.rows}" var="lrow" varStatus="lrowCounter">
				<tr><td>${lrow.handle}</td><td>${lrow.count}</td><td>${lrow.max}</td></tr>
			</c:forEach>
			</table>
			<jsp:include page="footer.jsp" flush="true" />
		</div>
	</div>
</body>