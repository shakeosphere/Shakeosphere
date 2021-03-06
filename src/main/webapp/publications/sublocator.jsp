<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="estc" uri="http://icts.uiowa.edu/ESTCTagLib"%>

	<sql:query var="locations" dataSource="jdbc/ESTCTagLib">
		select locational,sublocation_id,location,count
		from navigation.sublocator
		where id = ?::int and location_id = ?::int ;
		<sql:param>${param.id}</sql:param>
		<sql:param>${param.parent}</sql:param>
	</sql:query>
	<c:forEach items="${locations.rows}" var="row" varStatus="rowCounter">
		<c:if test="${rowCounter.first}">
			<ul>
		</c:if>
		<li>${row.locational}: <a href="../locations/location.jsp?lid=${row.location_id}">${row.location}</a> (${row.count})
				<jsp:include page="sublocator.jsp">
					<jsp:param name="id" value="${param.id}"/>
					<jsp:param name="parent" value="${row.location_id}"/>
				</jsp:include>
		<c:if test="${rowCounter.last}">
			</ul>
		</c:if>
	</c:forEach>
