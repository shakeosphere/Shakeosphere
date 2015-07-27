<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="estc" uri="http://icts.uiowa.edu/ESTCTagLib"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Shakeosphere</title>
<style type="text/css" media="all">
@import "../resources/style.css";
</style>
</head>
<body>
	<div id="body">
		<jsp:include page="../header.jsp" flush="true" />
		<jsp:include page="../menu.jsp" flush="true">
			<jsp:param name="caller" value="person" />
		</jsp:include>
		<div id="center">
			<c:forEach items="${paramValues.primary}" var="primaryString">
				<c:set var="primary" value="${primaryString}"/>
				<c:set var="primaryExists" value="${false}"/>
				<sql:query var="primaryCount" dataSource="jdbc/ESTCTagLib">
					select count(*) from navigation.person_authority where pid = ?::int;
					<sql:param>${primary}</sql:param>
				</sql:query>
				<c:forEach items="${primaryCount.rows}" var="primaryCountRow" varStatus="yrowCounter">
					<c:set var="primaryExists" value="${primaryCountRow.count > 0}"/>
				</c:forEach>
				<c:if test="${not primaryExists}">
					<sql:update dataSource="jdbc/ESTCTagLib">
						insert into navigation.person_authority values(?::int, ?::int, ?::int, now());
						<sql:param>${primary}</sql:param>
						<sql:param>${primary}</sql:param>
						<sql:param>${user_id}</sql:param>
					</sql:update>
				</c:if>
			</c:forEach>
			<c:forEach items="${paramValues.secondary}" var="secondaryString">
				<c:set var="secondary" value="${secondaryString}"/>
				<sql:update dataSource="jdbc/ESTCTagLib">
					insert into navigation.person_authority values(?::int, ?::int, ?::int, now());
					<sql:param>${primary}</sql:param>
					<sql:param>${secondary}</sql:param>
					<sql:param>${user_id}</sql:param>
				</sql:update>
			</c:forEach>
			
			<sql:query var="primaries" dataSource="jdbc/ESTCTagLib">
				select first_name,last_name from navigation.person where pid = ?::int;
				<sql:param>${primary}</sql:param>
			</sql:query>
			<c:forEach items="${primaries.rows}" var="row" varStatus="rowCounter">
				<h3>${row.last_name}, ${row.first_name} Authority Entry</h3>
			[<a href="surname_frequency.jsp">Full List</a>] [<a
				href="forename_frequency.jsp?surname=${row.last_name}">${row.last_name}
				List</a>]
			</c:forEach>
			
			<sql:query var="secondaries" dataSource="jdbc/ESTCTagLib">
				select first_name,last_name from navigation.person where pid in (select alias from navigation.person_aliases where pid = ?::int) order by first_name;
				<sql:param>${primary}</sql:param>
			</sql:query>
			<ul>
			<c:forEach items="${secondaries.rows}" var="row" varStatus="rowCounter">
				<li>${row.last_name}, ${row.first_name}</li>
			</c:forEach>
			</ul>
			
			<c:set var="min_year" value="${2000+0}" />
			<c:set var="max_year" value="${0+0}" />
			<c:set var="max_count" value="${0+0}" />
			<sql:query var="years" dataSource="jdbc/ESTCTagLib">
				select pubdate,count(*)
				from estc.pub_year,navigation.all_roles,navigation.person_effective
				where pub_year.id=estc_id and person_id=person_effective.effective_id and person_effective.pid=?::int
				group by pubdate order by pubdate;
				<sql:param>${primary}</sql:param>
			</sql:query>
						<script>
							var data1 = [
			<c:forEach items="${years.rows}" var="yrow" varStatus="yrowCounter">
				<c:if test="${min_year > yrow.pubdate }">
					<c:set var="min_year" value="${yrow.pubdate}" />
				</c:if>
				<c:if test="${max_year < yrow.pubdate }">
					<c:set var="max_year" value="${yrow.pubdate}" />
				</c:if>
				<c:if test="${max_count < yrow.count }">
					<c:set var="max_count" value="${yrow.count}" />
				</c:if>
				<c:out value="{"/>date : "${yrow.pubdate}-01-01", total : ${yrow.count}<c:out value="}"/>
				<c:if test="${!yrowCounter.last}">,</c:if>
			</c:forEach>
			];
							</script>
							<div id="graph1">
								<jsp:include page="../graphs/dateHistogram.jsp" flush="true">
									<jsp:param name="height" value="100" />
									<jsp:param name="div_id" value="graph1" />
									<jsp:param name="data_array" value="data1" />
									<jsp:param name="min_year" value="${min_year}-01-01" />
									<jsp:param name="max_year" value="${max_year}-01-01" />
								</jsp:include>
							</div>

			<jsp:include page="../footer.jsp" flush="true" />
		</div>
	</div>
</body>