<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<sql:setDataSource var="jdbc" driver="org.postgresql.Driver"
     url="jdbc:postgresql://localhost/estc"
     user="estc"  password="Shakeo"/>

<sql:query var="nodes" dataSource="${jdbc}">
		select forename,surname,count(*) as count from estc.person group by 1,2 order by 3 desc;
</sql:query>
<ul>
	<c:forEach items="${nodes.rows}" var="row" varStatus="rowCounter">
	    <li><c:out value="${row.surname}"/>, <c:out value="${row.forename}"/> (<c:out value="${row.count}"/>)</li>
	</c:forEach>
</ul>