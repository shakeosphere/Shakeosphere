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
			<sql:query var="primaries" dataSource="jdbc/ESTCTagLib">
				select first_name,last_name from extraction.person where id = ?::int;
				<sql:param>${param.primary}</sql:param>
			</sql:query>
			<c:forEach items="${primaries.rows}" var="row" varStatus="rowCounter">
				<c:set var="forename" value="${row.first_name}" />
				<c:set var="surname" value="${row.last_name}" />
				<h3>Name Variant Split: ${row.last_name}, ${row.first_name}</h3>
			[<a href="surname_frequency.jsp">Full List</a>] [<a
					href="forename_frequency.jsp?surname=${row.last_name}">${row.last_name}
					List</a>]
			</c:forEach>
			<c:if test="${empty param.year and empty param.confirm}">
				<h4>
					Splitting name variant
					- <a
						href="forename_histograms.jsp?surname=${surname}&forename=${forename}">Cancel</a>
				</h4>
				<p>Click anywhere in the graph to split it into two at that point in time.</p>

				<c:set var="min_year" value="${2000+0}" />
				<c:set var="max_year" value="${0+0}" />
				<c:set var="max_count" value="${0+0}" />
				<sql:query var="years" dataSource="jdbc/ESTCTagLib">
				select pubdate,count(*)
				from estc.pub_year,extraction.role
				where pub_year.id=estc_id and person_id = ?::int
				group by pubdate order by pubdate;
				<sql:param>${param.primary}</sql:param>
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
						<jsp:param name="click_action" value="nameVariantSplit.jsp?primary=${param.primary}&year=" />
						<jsp:param name="min_year" value="${min_year}-01-01" />
						<jsp:param name="max_year" value="${max_year}-01-01" />
					</jsp:include>
				</div>
				<table>
					<thead>
						<tr>
							<th>Year</th>
							<th>Locational</th>
							<th>Location</th>
						</tr>
					</thead>
					<tbody>
						<sql:query var="yearly" dataSource="jdbc/ESTCTagLib">
							select distinct pubdate,locational,location from extraction.place,extraction.location,estc.pub_year where pub_year.id=place.estc_id and place.location_id=location.id and person_id = ?::int order by 1;
							<sql:param>${param.primary}</sql:param>
						</sql:query>
						<c:forEach items="${yearly.rows}" var="yrow"
							varStatus="yrowCounter">
							<tr>
								<td>${yrow.pubdate}</td>
								<td>${yrow.locational}</td>
								<td>${yrow.location}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</c:if>
			<c:if test="${not empty param.year and empty param.confirm}">
				<h4>
					Splitting name variant at ${param.year} - <a
						href="nameVariantSplit.jsp?primary=${param.primary}&year=${param.year}&confirm=yes">Confirm</a>
					- <a
						href="forename_histograms.jsp?surname=${surname}&forename=${forename}">Cancel</a>
				</h4>

				<c:set var="min_year" value="${2000+0}" />
				<c:set var="max_year" value="${0+0}" />
				<c:set var="max_count" value="${0+0}" />
				<sql:query var="years" dataSource="jdbc/ESTCTagLib">
				select pubdate,count(*)
				from estc.pub_year,extraction.role
				where pub_year.id=estc_id and person_id = ?::int
				group by pubdate order by pubdate;
				<sql:param>${param.primary}</sql:param>
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
				<table>
					<thead>
						<tr>
							<th>Year</th>
							<th>Locational</th>
							<th>Location</th>
						</tr>
					</thead>
					<tbody>
						<sql:query var="yearly" dataSource="jdbc/ESTCTagLib">
							select distinct pubdate,locational,location from extraction.place,extraction.location,estc.pub_year where pub_year.id=place.estc_id and place.location_id=location.id and person_id = ?::int order by 1;
							<sql:param>${param.primary}</sql:param>
						</sql:query>
						<c:forEach items="${yearly.rows}" var="yrow"
							varStatus="yrowCounter">
							<tr>
								<td>${yrow.pubdate}</td>
								<td>${yrow.locational}</td>
								<td>${yrow.location}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

			</c:if>
			<c:if test="${not empty param.confirm}">
				<c:set var="min_year" value="${2000+0}" />
				<c:set var="max_year" value="${0+0}" />
				<c:set var="max_count" value="${0+0}" />
				<sql:query var="years" dataSource="jdbc/ESTCTagLib">
				select pubdate,count(*)
				from estc.pub_year,extraction.role
				where pub_year.id=estc_id and person_id = ?::int
				group by pubdate order by pubdate;
				<sql:param>${param.primary}</sql:param>
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
				<sql:query var="secondaries" dataSource="jdbc/ESTCTagLib">
				select nextval('extraction.person_id_seq');
			</sql:query>
				<c:forEach items="${secondaries.rows}" var="srow">
					<c:set var="secondary" value="${srow.nextval}" />
				</c:forEach>
			[<a
					href="forename_histograms.jsp?surname=${surname}&forename=${forename}">Back
					to histograms</a>]

				<sql:update dataSource="jdbc/ESTCTagLib">
				insert into extraction.person values(?::int, ?, ?);
				<sql:param>${secondary}</sql:param>
					<sql:param>${forename}</sql:param>
					<sql:param>${surname}</sql:param>
				</sql:update>
				<sql:update dataSource="jdbc/ESTCTagLib">
				update extraction.role set person_id=?::int where person_id=?::int and estc_id in (select id from estc.pub_year where pub_year.id=estc_id and pubdate >?::int);
				<sql:param>${secondary}</sql:param>
					<sql:param>${param.primary}</sql:param>
					<sql:param>${param.year}</sql:param>
				</sql:update>


				<table>
					<thead>
						<tr>
							<th>ID</th>
							<th>New Histograms</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>${param.primary}(old)</td>
							<td><sql:query var="yearsPrimary"
									dataSource="jdbc/ESTCTagLib">
				select pubdate,count(*)
				from estc.pub_year,extraction.role
				where pub_year.id=estc_id and person_id = ?::int
				group by pubdate order by pubdate;
				<sql:param>${param.primary}</sql:param>
								</sql:query> <script>
							var dataPrimary = [
			<c:forEach items="${yearsPrimary.rows}" var="yrow" varStatus="yrowCounter">
				<c:out value="{"/>date : "${yrow.pubdate}-01-01", total : ${yrow.count}<c:out value="}"/>
				<c:if test="${!yrowCounter.last}">,</c:if>
			</c:forEach>
			];
							</script>
								<div id="graphPrimary">
									<jsp:include page="../graphs/dateHistogram.jsp" flush="true">
										<jsp:param name="height" value="100" />
										<jsp:param name="div_id" value="graphPrimary" />
										<jsp:param name="data_array" value="dataPrimary" />
										<jsp:param name="min_year" value="${min_year}-01-01" />
										<jsp:param name="max_year" value="${max_year}-01-01" />
									</jsp:include>
								</div></td>
						</tr>
						<tr>
							<td>${secondary}(new)</td>
							<td><sql:query var="yearsSecondary"
									dataSource="jdbc/ESTCTagLib">
				select pubdate,count(*)
				from estc.pub_year,extraction.role
				where pub_year.id=estc_id and person_id = ?::int
				group by pubdate order by pubdate;
				<sql:param>${secondary}</sql:param>
								</sql:query> <script>
							var dataSecondary = [
			<c:forEach items="${yearsSecondary.rows}" var="zrow" varStatus="zrowCounter">
				<c:out value="{"/>date : "${zrow.pubdate}-01-01", total : ${zrow.count}<c:out value="}"/>
				<c:if test="${!zrowCounter.last}">,</c:if>
			</c:forEach>
			];
							</script>
								<div id="graphSecondary">
									<jsp:include page="../graphs/dateHistogram.jsp" flush="true">
										<jsp:param name="height" value="100" />
										<jsp:param name="div_id" value="graphSecondary" />
										<jsp:param name="data_array" value="dataSecondary" />
										<jsp:param name="min_year" value="${min_year}-01-01" />
										<jsp:param name="max_year" value="${max_year}-01-01" />
									</jsp:include>
								</div></td>
						</tr>
					</tbody>
				</table>


			</c:if>
			<jsp:include page="../footer.jsp" flush="true" />
		</div>
	</div>
</body>