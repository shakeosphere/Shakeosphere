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
		<script>
		var data1 = [{"date":"2012-03-20","total":3},{"date":"2012-03-21","total":8},{"date":"2012-03-23","total":10},{"date":"2012-03-24","total":3},{"date":"2012-03-26","total":12}];
		</script>
		<div id="center">
			<c:set var="initial" value="${fn:substring(param.forename, 0, 1)}" />
			<h1>${param.surname}, ${initial} Forename Histograms</h1>
			[<a href="surname_frequency.jsp">Surname List</a>]
			[<a href="forename_frequency.jsp?surname=${param.surname}">${param.surname} List</a>]
			<sql:query var="forenames" dataSource="jdbc/ESTCTagLib">
				select pid,first_name,count(*)
				from navigation.person,navigation.all_roles
				where last_name = ? and first_name ~ ? and person.pid=person_id
				  and not exists (select id from navigation.person_authority where person_authority.alias = person_id and person_authority.pid != person.pid)
				group by 1,2 order by 2;
				<sql:param>${param.surname}</sql:param>
				<sql:param>^${initial}</sql:param>
			</sql:query>
			<c:set var="min_year" value="${2000+0}" />
			<c:set var="max_year" value="${0+0}" />
			<c:set var="max_count" value="${0+0}" />
			<c:forEach items="${forenames.rows}" var="row" varStatus="rowCounter">
				<sql:query var="years" dataSource="jdbc/ESTCTagLib">
					select pubdate,count(*) from estc.pub_year,navigation.all_roles where pub_year.id=estc_id and person_id = ?::int group by pubdate order by pubdate;
					<sql:param>${row.pid}</sql:param>
				</sql:query>
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
				</c:forEach>
			</c:forEach>
			Min year: ${min_year}, Max year: ${max_year}, Max count: ${max_count}
				<form action="nameVariantBinding.jsp" method="post">
			<table>
				<thead>
					<tr>
						<th>P</th>
						<th>S</th>
						<th>Forename</th>
						<th>Frequency</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${forenames.rows}" var="row" varStatus="rowCounter">
						<c:set var="secondaryValid" value="${true}"/>
						<sql:query var="secondaries" dataSource="jdbc/ESTCTagLib">
							select count(*) from navigation.person_authority where pid = ?::int;
							<sql:param>${row.pid}</sql:param>
						</sql:query>
						<c:forEach items="${secondaries.rows}" var="srow" varStatus="yrowCounter">
							<c:set var="secondaryValid" value="${srow.count == 0}"/>
						</c:forEach>
						<sql:query var="years" dataSource="jdbc/ESTCTagLib">
							select pubdate,count(*)
							from estc.pub_year,navigation.all_roles,navigation.person_effective
							where pub_year.id=estc_id and person_id=person_effective.effective_id and person_effective.pid=?::int
							group by pubdate order by pubdate;
							<sql:param>${row.pid}</sql:param>
						</sql:query>
						<script>
							var data${row.pid} = [
							<c:forEach items="${years.rows}" var="yrow" varStatus="yrowCounter">
								<c:out value="{"/>date : "${yrow.pubdate}-01-01", total : ${yrow.count}<c:out value="}"/>
								<c:if test="${!yrowCounter.last}">,</c:if>
							</c:forEach>
							];
						</script>
						<tr>
							<td><input type="checkbox" name="primary" value="${row.pid}"/></td>
							<td><c:if test="${secondaryValid}"><input type="checkbox" name="secondary" value="${row.pid}"/></c:if></td>
							<td><a
								href="nameVariantSplit.jsp?primary=${row.pid}">${row.first_name}</a></td>
							<td id="graph${rowCounter.count}">
								<jsp:include page="../graphs/dateHistogram.jsp" flush="true">
									<jsp:param name="div_id" value="graph${rowCounter.count}" />
									<jsp:param name="data_array" value="data${row.pid}" />
									<jsp:param name="min_year" value="${min_year}-01-01" />
									<jsp:param name="max_year" value="${max_year}-01-01" />
								</jsp:include>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<input type="submit" name="submit" value="Save">
				</form>

			<c:forEach items="${forenames.rows}" var="row" varStatus="rowCounter">
				<hr/><h4>${param.surname}, ${row.first_name}</h4>
				<table>
					<thead>
						<tr>
							<th>Year</th>
							<th>Role</th>
							<th>Locational</th>
							<th>Location</th>
						</tr>
					</thead>
					<tbody>
						<sql:query var="yearly" dataSource="jdbc/ESTCTagLib">
							select distinct pubdate,role,locational,location
							from navigation.located,navigation.location,navigation.all_roles,estc.pub_year
							where pub_year.id=located.estc_id
							  and located.lid=location.lid
							  and located.pid=all_roles.person_id
							  and located.estc_id=all_roles.estc_id
							  and located.pid = ?::int
							order by 1,2;
							<sql:param>${row.pid}</sql:param>
						</sql:query>
						<c:forEach items="${yearly.rows}" var="yrow" varStatus="yrowCounter">
							<tr>
								<td>${yrow.pubdate}</td>
								<td>${yrow.role}</td>
								<td align=center>${yrow.locational}</td>
								<td>${yrow.location}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</c:forEach>
			<jsp:include page="../footer.jsp" flush="true" />
		</div>
	</div>
</body>