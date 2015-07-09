<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="estc" uri="http://icts.uiowa.edu/ESTCTagLib"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:if test="${not empty param.min_year}">
	<c:set var="min_year" value="${param.min_year}"/>
	<c:set var="max_year" value="${param.max_year}"/>
</c:if>
<c:if test="${empty param.min_year}">
	<c:set var="min_year" value="${2000+0}" />
	<c:set var="max_year" value="${0+0}" />
	<c:set var="max_count" value="${0+0}" />
	<sql:query var="years" dataSource="jdbc/ESTCTagLib">
		select pubdate,count(*)
		from estc.pub_year,extraction.role
		where pub_year.id=estc_id and person_id in (select alias from extraction.authority_binding where id = ?::int union select ?::int)
		group by pubdate order by pubdate;
		<sql:param>${param.id}</sql:param>
		<sql:param>${param.id}</sql:param>
	</sql:query>
	<c:forEach items="${years.rows}" var="row" varStatus="rowCounter">
		<c:if test="${min_year > row.pubdate }">
			<c:set var="min_year" value="${row.pubdate}" />
		</c:if>
		<c:if test="${max_year < row.pubdate }">
			<c:set var="max_year" value="${row.pubdate}" />
		</c:if>
		<c:if test="${max_count < row.count }">
			<c:set var="max_count" value="${row.count}" />
		</c:if>
	</c:forEach>
	Min year: ${min_year}, Max year: ${max_year}, Max count: ${max_count}
</c:if>

<sql:query var="years" dataSource="jdbc/ESTCTagLib">
	select pubdate,count(*)
	from estc.pub_year,extraction.role
	where pub_year.id=estc_id and person_id in (select alias from extraction.authority_binding where id = ?::int union select ?::int)
	group by pubdate order by pubdate;
	<sql:param>${param.id}</sql:param>
	<sql:param>${param.id}</sql:param>
</sql:query>
<script>
	var data${param.id} = [
	<c:forEach items="${years.rows}" var="row" varStatus="rowCounter">
		<c:out value="{"/>date : "${row.pubdate}-01-01", total : ${row.count}<c:out value="}"/>
		<c:if test="${!rowCounter.last}">,</c:if>
	</c:forEach>
	];
</script>
<div id="graph${param.id}">
	<jsp:include page="../graphs/dateHistogram.jsp" flush="true">
		<jsp:param name="div_id" value="graph${param.id}" />
		<jsp:param name="data_array" value="data${param.id}" />
		<jsp:param name="min_year" value="${min_year}-01-01" />
		<jsp:param name="max_year" value="${max_year}-01-01" />
	</jsp:include>
</div>

