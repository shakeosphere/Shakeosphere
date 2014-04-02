<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>
<%@ taglib prefix="graph" uri="http://slis.uiowa.edu/graphtaglib"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<graph:graph>
	<sql:query var="authors" dataSource="jdbc/Shakeosphere">
		select forename,surname,count(*) from network.author natural join estc.pub_year where pubdate = ?::int group by 1,2;
		<sql:param value="${param.year}"/>
	</sql:query>
	<c:forEach items="${authors.rows}" var="row" varStatus="rowCounter">
		<graph:node uri="${row.forename}|${row.surname}" label="${row.forename} ${row.surname}"  group="1"  score="${row.count}" />
	</c:forEach>

	<sql:query var="printers" dataSource="jdbc/Shakeosphere">
		select forename,surname,count(*) from network.printer natural join estc.pub_year where pubdate = ?::int group by 1,2;
		<sql:param value="${param.year}"/>
	</sql:query>
	<c:forEach items="${printers.rows}" var="row" varStatus="rowCounter">
		<graph:node uri="${row.forename}|${row.surname}" label="${row.forename} ${row.surname}"  group="2"  score="${row.count}" />
	</c:forEach>

	<sql:query var="publishers" dataSource="jdbc/Shakeosphere">
		select forename,surname,count(*) from network.publisher natural join estc.pub_year where pubdate = ?::int group by 1,2;
		<sql:param value="${param.year}"/>
	</sql:query>
	<c:forEach items="${publishers.rows}" var="row" varStatus="rowCounter">
		<graph:node uri="${row.forename}|${row.surname}" label="${row.forename} ${row.surname}"  group="3"  score="${row.count}" />
	</c:forEach>

	<sql:query var="sellers" dataSource="jdbc/Shakeosphere">
		select forename,surname,count(*) from network.seller natural join estc.pub_year where pubdate = ?::int group by 1,2;
		<sql:param value="${param.year}"/>
	</sql:query>
	<c:forEach items="${sellers.rows}" var="row" varStatus="rowCounter">
		<graph:node uri="${row.forename}|${row.surname}" label="${row.forename} ${row.surname}"  group="4"  score="${row.count}" />
	</c:forEach>

	<sql:query var="authorPrinter" dataSource="jdbc/Shakeosphere">
		select author.forename as sfname,author.surname as ssname,printer.forename as tfname,printer.surname as tsname,count(*) from network.author,network.printer,estc.pub_year where author.id=printer.id and author.id=pub_year.id and pubdate = ?::int group by 1,2,3,4;
		<sql:param value="${param.year}"/>
	</sql:query>
	<c:forEach items="${authorPrinter.rows}" var="row" varStatus="rowCounter">
		<graph:edge source="${row.sfname}|${row.ssname}" target="${row.tfname}|${row.tsname}"  weight="${row.count}" />
	</c:forEach>

	<sql:query var="authorPublisher" dataSource="jdbc/Shakeosphere">
		select author.forename as sfname,author.surname as ssname,publisher.forename as tfname,publisher.surname as tsname,count(*) from network.author,network.publisher,estc.pub_year where author.id=publisher.id and author.id=pub_year.id and pubdate = ?::int group by 1,2,3,4;
		<sql:param value="${param.year}"/>
	</sql:query>
	<c:forEach items="${authorPublisher.rows}" var="row" varStatus="rowCounter">
		<graph:edge source="${row.sfname}|${row.ssname}" target="${row.tfname}|${row.tsname}"  weight="${row.count}" />
	</c:forEach>

	<sql:query var="authorSeller" dataSource="jdbc/Shakeosphere">
		select author.forename as sfname,author.surname as ssname,seller.forename as tfname,seller.surname as tsname,count(*) from network.author,network.seller,estc.pub_year where author.id=seller.id and author.id=pub_year.id and pubdate = ?::int group by 1,2,3,4;
		<sql:param value="${param.year}"/>
	</sql:query>
	<c:forEach items="${authorSeller.rows}" var="row" varStatus="rowCounter">
		<graph:edge source="${row.sfname}|${row.ssname}" target="${row.tfname}|${row.tsname}"  weight="${row.count}" />
	</c:forEach>

	<sql:query var="printerPublisher" dataSource="jdbc/Shakeosphere">
		select printer.forename as sfname,printer.surname as ssname,publisher.forename as tfname,publisher.surname as tsname,count(*) from network.printer,network.publisher,estc.pub_year where printer.id=publisher.id and printer.id=pub_year.id and pubdate = ?::int group by 1,2,3,4;
		<sql:param value="${param.year}"/>
	</sql:query>
	<c:forEach items="${printerPublisher.rows}" var="row" varStatus="rowCounter">
		<graph:edge source="${row.sfname}|${row.ssname}" target="${row.tfname}|${row.tsname}"  weight="${row.count}" />
	</c:forEach>

	<sql:query var="printerSeller" dataSource="jdbc/Shakeosphere">
		select printer.forename as sfname,printer.surname as ssname,seller.forename as tfname,seller.surname as tsname,count(*) from network.printer,network.seller,estc.pub_year where printer.id=seller.id and printer.id=pub_year.id and pubdate = ?::int group by 1,2,3,4;
		<sql:param value="${param.year}"/>
	</sql:query>
	<c:forEach items="${printerSeller.rows}" var="row" varStatus="rowCounter">
		<graph:edge source="${row.sfname}|${row.ssname}" target="${row.tfname}|${row.tsname}"  weight="${row.count}" />
	</c:forEach>

	<sql:query var="publisherSeller" dataSource="jdbc/Shakeosphere">
		select publisher.forename as sfname,publisher.surname as ssname,seller.forename as tfname,seller.surname as tsname,count(*) from network.publisher,network.seller,estc.pub_year where publisher.id=seller.id and publisher.id=pub_year.id and pubdate = ?::int group by 1,2,3,4;
		<sql:param value="${param.year}"/>
	</sql:query>
	<c:forEach items="${publisherSeller.rows}" var="row" varStatus="rowCounter">
		<graph:edge source="${row.sfname}|${row.ssname}" target="${row.tfname}|${row.tsname}"  weight="${row.count}" />
	</c:forEach>

{
  "nodes":[
	<graph:foreachNode pruneOrphanThreshold="50">
		<graph:node>
		    {"url":"<graph:nodeUri/>","name":"<graph:nodeLabel/>","group":<graph:nodeGroup/>,"score":<graph:nodeScore/>}<c:if test="${ ! isLastNode }">,</c:if>
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
