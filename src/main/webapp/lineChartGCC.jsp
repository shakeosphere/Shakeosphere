<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>
<%@ taglib prefix="graph" uri="http://slis.uiowa.edu/graphtaglib"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<sql:query var="yearlyStats" dataSource="jdbc/ESTCTagLib">
    select year, gcc_percentage as value
    from analytics.yearly_individuals
    where (year between ?::int and ?::int)
    order by year;
    <sql:param value="${param.startYear}"/>
    <sql:param value="${param.endYear}"/>
</sql:query>

[
    <c:forEach items="${yearlyStats.rows}" var="row" varStatus="rowStatus">
    {
        "year": <c:out value="${row.year}" />,
        "value": <c:out value="${row.value}" />
    }<c:if test="${not rowStatus.last }">,</c:if>
    </c:forEach>
]