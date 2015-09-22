<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<sql:query var="decades" dataSource="jdbc/ESTCTagLib">
	select distinct year from linked_reading.lda_max order by 1;
</sql:query>
{
  "decades":[
	<c:forEach items="${decades.rows}" var="decadeRow" varStatus="decadeCounter">
	    { decade:${decadeRow.year},
			<sql:query var="nodes" dataSource="${jdbc}">
				select topic,document,max from linked_reading.lda_max where year=?::int order by 1,2;
				<sql:param>${decadeRow.year}</sql:param>
			</sql:query>
			nodes:[
			<c:forEach items="${nodes.rows}" var="nodeRow" varStatus="nodeCounter">
				{ topic:${nodeRow.topic}, document:${nodeRow.document}, score:${nodeRow.max} }<c:if test="${!nodeCounter.last}">,</c:if>
			</c:forEach>
			]
	    }<c:if test="${!decadeCounter.last}">,</c:if>
	</c:forEach>
  ]
}
