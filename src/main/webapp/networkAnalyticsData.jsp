<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>
<%@ taglib prefix="graph" uri="http://slis.uiowa.edu/graphtaglib"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<graph:graph>
	<sql:query var="authors" dataSource="jdbc/ESTCTagLib">
		select pid, first_name, last_name, sum(count) as count
		from visualization.author
		where (pubdate between ?::int and ?::int)
		group by 1,2,3
		<sql:param value="${param.startYear}"/>
        <sql:param value="${param.endYear}"/>
	</sql:query>
	<c:forEach items="${authors.rows}" var="row" varStatus="rowCounter">
		<graph:node uri="${row.pid}" label="${row.first_name} ${row.last_name}"  group="1"  score="${row.count}" />
	</c:forEach>

	<sql:query var="printers" dataSource="jdbc/ESTCTagLib">
		select pid, first_name, last_name, sum(count) as count
		from visualization.printer
		where (pubdate between ?::int and ?::int)
        group by 1,2,3
		<sql:param value="${param.startYear}"/>
        <sql:param value="${param.endYear}"/>
	</sql:query>
	<c:forEach items="${printers.rows}" var="row" varStatus="rowCounter">
		<graph:node uri="${row.pid}" label="${row.first_name} ${row.last_name}"  group="2"  score="${row.count}" />
	</c:forEach>

	<sql:query var="publishers" dataSource="jdbc/ESTCTagLib">
		select pid, first_name, last_name, sum(count) as count
		from visualization.publisher
		where (pubdate between ?::int and ?::int)
        group by 1,2,3
		<sql:param value="${param.startYear}"/>
        <sql:param value="${param.endYear}"/>
	</sql:query>
	<c:forEach items="${publishers.rows}" var="row" varStatus="rowCounter">
		<graph:node uri="${row.pid}" label="${row.first_name} ${row.last_name}"  group="3"  score="${row.count}" />
	</c:forEach>

	<sql:query var="sellers" dataSource="jdbc/ESTCTagLib">
		select pid, first_name, last_name, sum(count) as count
		from visualization.bookseller
		where (pubdate between ?::int and ?::int)
        group by 1,2,3
		<sql:param value="${param.startYear}"/>
        <sql:param value="${param.endYear}"/>
	</sql:query>
	<c:forEach items="${sellers.rows}" var="row" varStatus="rowCounter">
		<graph:node uri="${row.pid}" label="${row.first_name} ${row.last_name}"  group="4"  score="${row.count}" />
	</c:forEach>

	<sql:query var="authorPrinter" dataSource="jdbc/ESTCTagLib">
		select author, printer, sum(count) as count
		from visualization.author_printer
		where (pubdate between ?::int and ?::int)
        group by 1,2
		<sql:param value="${param.startYear}"/>
        <sql:param value="${param.endYear}"/>
	</sql:query>
	<c:forEach items="${authorPrinter.rows}" var="row" varStatus="rowCounter">
		<graph:edge source="${row.author}" target="${row.printer}"  weight="${row.count}" />
	</c:forEach>

	<sql:query var="authorPublisher" dataSource="jdbc/ESTCTagLib">
		select author, publisher, sum(count) as count
		from visualization.author_publisher
		where (pubdate between ?::int and ?::int)
        group by 1,2
		<sql:param value="${param.startYear}"/>
        <sql:param value="${param.endYear}"/>
	</sql:query>
	<c:forEach items="${authorPublisher.rows}" var="row" varStatus="rowCounter">
		<graph:edge source="${row.author}" target="${row.publisher}"  weight="${row.count}" />
	</c:forEach>

	<sql:query var="authorSeller" dataSource="jdbc/ESTCTagLib">
		select author, bookseller, sum(count) as count
		from visualization.author_bookseller
		where (pubdate between ?::int and ?::int)
        group by 1,2
		<sql:param value="${param.startYear}"/>
        <sql:param value="${param.endYear}"/>
	</sql:query>
	<c:forEach items="${authorSeller.rows}" var="row" varStatus="rowCounter">
		<graph:edge source="${row.author}" target="${row.bookseller}"  weight="${row.count}" />
	</c:forEach>

	<sql:query var="printerPublisher" dataSource="jdbc/ESTCTagLib">
		select printer, publisher, sum(count) as count
		from visualization.printer_publisher
		where (pubdate between ?::int and ?::int)
        group by 1,2
		<sql:param value="${param.startYear}"/>
        <sql:param value="${param.endYear}"/>
	</sql:query>
	<c:forEach items="${printerPublisher.rows}" var="row" varStatus="rowCounter">
		<graph:edge source="${row.printer}" target="${row.publisher}"  weight="${row.count}" />
	</c:forEach>

	<sql:query var="printerSeller" dataSource="jdbc/ESTCTagLib">
		select printer, bookseller, sum(count) as count
		from visualization.printer_bookseller
		where (pubdate between ?::int and ?::int)
        group by 1,2
		<sql:param value="${param.startYear}"/>
        <sql:param value="${param.endYear}"/>
	</sql:query>
	<c:forEach items="${printerSeller.rows}" var="row" varStatus="rowCounter">
		<graph:edge source="${row.printer}" target="${row.bookseller}"  weight="${row.count}" />
	</c:forEach>

	<sql:query var="publisherSeller" dataSource="jdbc/ESTCTagLib">
		select publisher, bookseller, sum(count) as count
		from visualization.publisher_bookseller
		where (pubdate between ?::int and ?::int)
        group by 1,2
		<sql:param value="${param.startYear}"/>
        <sql:param value="${param.endYear}"/>
	</sql:query>
	<c:forEach items="${publisherSeller.rows}" var="row" varStatus="rowCounter">
		<graph:edge source="${row.publisher}" target="${row.bookseller}"  weight="${row.count}" />
	</c:forEach>

{
  "nodes":[
	<graph:foreachNode pruneOrphanThreshold="50">
		<graph:node>
		    {"id":<graph:nodeUri/>,"name":"<graph:nodeLabel/>","role":<graph:nodeGroup/>,"score":<graph:nodeScore/>}<c:if test="${ ! isLastNode }">,</c:if>
		</graph:node>
	</graph:foreachNode>
  ],
  "links":[
  	<graph:foreachEdge>
  		<graph:edge>
		    {"source":<graph:edgeSource/>,"target":<graph:edgeTarget/>,"value":<graph:edgeWeight/>}<c:if test="${ ! isLastEdge }">,</c:if>
  		</graph:edge>
  	</graph:foreachEdge>
  ]
}

</graph:graph>
