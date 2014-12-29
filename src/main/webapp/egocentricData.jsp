<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>
<%@ taglib prefix="graph" uri="http://slis.uiowa.edu/graphtaglib"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<graph:graph>
	<sql:query var="authors" dataSource="jdbc/ESTCTagLib">
		select person.pid,first_name,last_name,count(*) from navigation.author natural join navigation.person where author.id in (select id from navigation.all_roles where last_name=? and first_name=?) group by 1,2,3;
		<sql:param value="${param.surname}"/>
		<sql:param value="${param.forename}"/>
	</sql:query>
	<c:forEach items="${authors.rows}" var="row" varStatus="rowCounter">
		<graph:node uri="${row.pid}" label="${row.first_name} ${row.last_name}"  group="1"  score="${row.count}" />
	</c:forEach>

	<sql:query var="printers" dataSource="jdbc/ESTCTagLib">
		select person.pid,first_name,last_name,count(*) from navigation.printer natural join navigation.person where printer.id in (select id from navigation.all_roles where last_name=? and first_name=?) group by 1,2,3;
		<sql:param value="${param.surname}"/>
		<sql:param value="${param.forename}"/>
	</sql:query>
	<c:forEach items="${printers.rows}" var="row" varStatus="rowCounter">
		<graph:node uri="${row.pid}" label="${row.first_name} ${row.last_name}"  group="2"  score="${row.count}" />
	</c:forEach>

	<sql:query var="publishers" dataSource="jdbc/ESTCTagLib">
		select person.pid,first_name,last_name,count(*) from navigation.publisher natural join navigation.person where publisher.id in (select id from navigation.all_roles where last_name=? and first_name=?) group by 1,2,3;
		<sql:param value="${param.surname}"/>
		<sql:param value="${param.forename}"/>
	</sql:query>
	<c:forEach items="${publishers.rows}" var="row" varStatus="rowCounter">
		<graph:node uri="${row.pid}" label="${row.first_name} ${row.last_name}"  group="3"  score="${row.count}" />
	</c:forEach>

	<sql:query var="sellers" dataSource="jdbc/ESTCTagLib">
		select person.pid,first_name,last_name,count(*) from navigation.bookseller natural join navigation.person where bookseller.id in (select id from navigation.all_roles where last_name=? and first_name=?) group by 1,2,3;
		<sql:param value="${param.surname}"/>
		<sql:param value="${param.forename}"/>
	</sql:query>
	<c:forEach items="${sellers.rows}" var="row" varStatus="rowCounter">
		<graph:node uri="${row.pid}" label="${row.first_name} ${row.last_name}"  group="4"  score="${row.count}" />
	</c:forEach>

	<sql:query var="authorPrinter" dataSource="jdbc/ESTCTagLib">
		select author.pid as author,printer.pid as printer,count(*) from navigation.author,navigation.printer where author.id=printer.id and author.id in (select id from navigation.all_roles where last_name=? and first_name=?) group by 1,2;
		<sql:param value="${param.surname}"/>
		<sql:param value="${param.forename}"/>
	</sql:query>
	<c:forEach items="${authorPrinter.rows}" var="row" varStatus="rowCounter">
		<graph:edge source="${row.author}" target="${row.printer}"  weight="${row.count}" />
	</c:forEach>

	<sql:query var="authorPublisher" dataSource="jdbc/ESTCTagLib">
		select author.pid as author,publisher.pid as publisher,count(*) from navigation.author,navigation.publisher where author.id=publisher.id and author.id in (select id from navigation.all_roles where last_name=? and first_name=?) group by 1,2;
		<sql:param value="${param.surname}"/>
		<sql:param value="${param.forename}"/>
	</sql:query>
	<c:forEach items="${authorPublisher.rows}" var="row" varStatus="rowCounter">
		<graph:edge source="${row.author}" target="${row.publisher}"  weight="${row.count}" />
	</c:forEach>

	<sql:query var="authorSeller" dataSource="jdbc/ESTCTagLib">
		select author.pid as author,bookseller.pid as bookseller,count(*) from navigation.author,navigation.bookseller where author.id=bookseller.id and author.id in (select id from navigation.all_roles where last_name=? and first_name=?) group by 1,2;
		<sql:param value="${param.surname}"/>
		<sql:param value="${param.forename}"/>
	</sql:query>
	<c:forEach items="${authorSeller.rows}" var="row" varStatus="rowCounter">
		<graph:edge source="${row.author}" target="${row.bookseller}"  weight="${row.count}" />
	</c:forEach>

	<sql:query var="printerPublisher" dataSource="jdbc/ESTCTagLib">
		select printer.pid as printer,publisher.pid as publisher,count(*) from navigation.printer,navigation.publisher where printer.id=publisher.id and printer.id in (select id from navigation.all_roles where last_name=? and first_name=?) group by 1,2;
		<sql:param value="${param.surname}"/>
		<sql:param value="${param.forename}"/>
	</sql:query>
	<c:forEach items="${printerPublisher.rows}" var="row" varStatus="rowCounter">
		<graph:edge source="${row.printer}" target="${row.publisher}"  weight="${row.count}" />
	</c:forEach>

	<sql:query var="printerSeller" dataSource="jdbc/ESTCTagLib">
		select printer.pid as printer,bookseller.pid as bookseller,count(*) from navigation.printer,navigation.bookseller where printer.id=bookseller.id and printer.id in (select id from navigation.all_roles where last_name=? and first_name=?) group by 1,2;
		<sql:param value="${param.surname}"/>
		<sql:param value="${param.forename}"/>
	</sql:query>
	<c:forEach items="${printerSeller.rows}" var="row" varStatus="rowCounter">
		<graph:edge source="${row.printer}" target="${row.bookseller}"  weight="${row.count}" />
	</c:forEach>

	<sql:query var="publisherSeller" dataSource="jdbc/ESTCTagLib">
		select publisher.pid as publisher,bookseller.pid as bookseller,count(*) from navigation.publisher,navigation.bookseller where publisher.id=bookseller.id and publisher.id in (select id from navigation.all_roles where last_name=? and first_name=?) group by 1,2;
		<sql:param value="${param.surname}"/>
		<sql:param value="${param.forename}"/>
	</sql:query>
	<c:forEach items="${publisherSeller.rows}" var="row" varStatus="rowCounter">
		<graph:edge source="${row.publisher}" target="${row.bookseller}"  weight="${row.count}" />
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
