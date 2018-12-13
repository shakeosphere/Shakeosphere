<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="estc" uri="http://icts.uiowa.edu/ESTCTagLib"%>

	<sql:query var="locations" dataSource="jdbc/ESTCTagLib">
		select locational,parent_id,location.location,count
		from navigation.location_in_by_year,navigation.location
		where person_id = ?::int and pubyear = ?::int and location_id = ?::int  and location_in_by_year.parent_id=location.lid;
		<sql:param>${param.person}</sql:param>
		<sql:param>${param.year}</sql:param>
		<sql:param>${param.child}</sql:param>
	</sql:query>
	<ul>
	<c:forEach items="${locations.rows}" var="row" varStatus="rowCounter">
		<li>${row.locational}: <a href="../locations/location.jsp?lid=${row.parent_id}">${row.location}</a> (${row.count})
				<jsp:include page="sublocations.jsp">
					<jsp:param name="person" value="${param.pid}"/>
					<jsp:param name="child" value="${row.parent_id}"/>
					<jsp:param name="year" value="${param.year}"/>
				</jsp:include>
	</c:forEach>
	</ul>
