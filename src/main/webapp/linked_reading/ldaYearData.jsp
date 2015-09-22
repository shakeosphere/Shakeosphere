<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

			<sql:query var="nodes" dataSource="jdbc/ESTCTagLib">
				select topic,document,max from linked_reading.lda_max where year=?::int order by 1,2;
				<sql:param>${param.year}</sql:param>
			</sql:query>
			[
			<c:forEach items="${nodes.rows}" var="nodeRow" varStatus="nodeCounter">
				[${nodeRow.topic}, ${nodeRow.document}, ${nodeRow.max} ]<c:if test="${!nodeCounter.last}">,</c:if>
			</c:forEach>
			]
