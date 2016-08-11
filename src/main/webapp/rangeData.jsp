<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>
<%@ taglib prefix="graph" uri="http://slis.uiowa.edu/graphtaglib"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<graph:graph>
	<sql:query var="authors" dataSource="jdbc/ESTCTagLib">
		select person.pid, first_name, last_name, count(*)
		from estc.pub_year, navigation.person, navigation.person_effective, navigation.author
		where pubdate >= ?::int
          and pubdate <= ?::int
		  and pub_year.id = author.id
		  and author.pid = person_effective.effective_id
		  and person_effective.pid=person.pid
		group by 1,2,3;
		<sql:param value="${param.startYear}"/>
        <sql:param value="${param.endyear}"/>
	</sql:query>
	<c:forEach items="${authors.rows}" var="row" varStatus="rowCounter">
		<graph:node uri="${row.pid}" label="${row.first_name} ${row.last_name}"  group="1"  score="${row.count}" />
	</c:forEach>

	<sql:query var="printers" dataSource="jdbc/ESTCTagLib">
		select person.pid, first_name, last_name, count(*)
		from estc.pub_year, navigation.person, navigation.person_effective, navigation.printer
		where pubdate >= ?::int
          and pubdate <= ?::int
		  and pub_year.id=printer.id
		  and printer.pid = person_effective.effective_id
		  and person_effective.pid=person.pid
		group by 1,2,3;
		<sql:param value="${param.startYear}"/>
        <sql:param value="${param.endyear}"/>
	</sql:query>
	<c:forEach items="${printers.rows}" var="row" varStatus="rowCounter">
		<graph:node uri="${row.pid}" label="${row.first_name} ${row.last_name}"  group="2"  score="${row.count}" />
	</c:forEach>

	<sql:query var="publishers" dataSource="jdbc/ESTCTagLib">
		select person.pid, first_name, last_name, count(*)
		from estc.pub_year, navigation.person, navigation.person_effective, navigation.publisher
		where pubdate >= ?::int
          and pubdate <= ?::int
		  and pub_year.id=publisher.id
		  and publisher.pid = person_effective.effective_id
		  and person_effective.pid=person.pid
		group by 1,2,3;
		<sql:param value="${param.startYear}"/>
        <sql:param value="${param.endyear}"/>
	</sql:query>
	<c:forEach items="${publishers.rows}" var="row" varStatus="rowCounter">
		<graph:node uri="${row.pid}" label="${row.first_name} ${row.last_name}"  group="3"  score="${row.count}" />
	</c:forEach>

	<sql:query var="sellers" dataSource="jdbc/ESTCTagLib">
		select person.pid, first_name, last_name, count(*)
		from estc.pub_year, navigation.person, navigation.person_effective, navigation.bookseller
		where pubdate >= ?::int
          and pubdate <= ?::int
		  and pub_year.id=bookseller.id
		  and bookseller.pid = person_effective.effective_id
		  and person_effective.pid=person.pid
		group by 1,2,3;
		<sql:param value="${param.startYear}"/>
        <sql:param value="${param.endyear}"/>
	</sql:query>
	<c:forEach items="${sellers.rows}" var="row" varStatus="rowCounter">
		<graph:node uri="${row.pid}" label="${row.first_name} ${row.last_name}"  group="4"  score="${row.count}" />
	</c:forEach>

	<sql:query var="authorPrinter" dataSource="jdbc/ESTCTagLib">
		select author.pid as author,printer.pid as printer,count(*)
		from navigation.author,navigation.printer,estc.pub_year
		where exists (select person.pid from navigation.person where person.pid=author.pid)
		  and exists (select person.pid from navigation.person where person.pid=printer.pid)
		  and author.id=printer.id
		  and author.id=pub_year.id
		  and pubdate >= ?::int
          and pubdate <= ?::int
		group by 1,2;
		<sql:param value="${param.startYear}"/>
        <sql:param value="${param.endyear}"/>
	</sql:query>
	<c:forEach items="${authorPrinter.rows}" var="row" varStatus="rowCounter">
		<graph:edge source="${row.author}" target="${row.printer}"  weight="${row.count}" />
	</c:forEach>

	<sql:query var="authorPublisher" dataSource="jdbc/ESTCTagLib">
		select author.pid as author,publisher.pid as publisher,count(*)
		from navigation.author,navigation.publisher,estc.pub_year
		where exists (select person.pid from navigation.person where person.pid=author.pid)
		  and exists (select person.pid from navigation.person where person.pid=publisher.pid)
		  and author.id=publisher.id
		  and author.id=pub_year.id
		  and pubdate >= ?::int
          and pubdate <= ?::int
		group by 1,2;
		<sql:param value="${param.startYear}"/>
        <sql:param value="${param.endyear}"/>
	</sql:query>
	<c:forEach items="${authorPublisher.rows}" var="row" varStatus="rowCounter">
		<graph:edge source="${row.author}" target="${row.publisher}"  weight="${row.count}" />
	</c:forEach>

	<sql:query var="authorSeller" dataSource="jdbc/ESTCTagLib">
		select author.pid as author,bookseller.pid as bookseller,count(*)
		from navigation.author,navigation.bookseller,estc.pub_year
		where exists (select person.pid from navigation.person where person.pid=author.pid)
		  and exists (select person.pid from navigation.person where person.pid=bookseller.pid)
		  and author.id=bookseller.id
		  and author.id=pub_year.id
		  and pubdate >= ?::int
          and pubdate <= ?::int
		group by 1,2;
		<sql:param value="${param.startYear}"/>
        <sql:param value="${param.endyear}"/>
	</sql:query>
	<c:forEach items="${authorSeller.rows}" var="row" varStatus="rowCounter">
		<graph:edge source="${row.author}" target="${row.bookseller}"  weight="${row.count}" />
	</c:forEach>

	<sql:query var="printerPublisher" dataSource="jdbc/ESTCTagLib">
		select printer.pid as printer,publisher.pid as publisher,count(*)
		from navigation.printer,navigation.publisher,estc.pub_year
		where exists (select person.pid from navigation.person where person.pid=printer.pid)
		  and exists (select person.pid from navigation.person where person.pid=publisher.pid)
		  and printer.id=publisher.id
		  and printer.id=pub_year.id
		  and pubdate >= ?::int
          and pubdate <= ?::int
		group by 1,2;
		<sql:param value="${param.startYear}"/>
        <sql:param value="${param.endyear}"/>
	</sql:query>
	<c:forEach items="${printerPublisher.rows}" var="row" varStatus="rowCounter">
		<graph:edge source="${row.printer}" target="${row.publisher}"  weight="${row.count}" />
	</c:forEach>

	<sql:query var="printerSeller" dataSource="jdbc/ESTCTagLib">
		select printer.pid as printer,bookseller.pid as bookseller,count(*)
		from navigation.printer,navigation.bookseller,estc.pub_year
		where exists (select person.pid from navigation.person where person.pid=printer.pid)
		  and exists (select person.pid from navigation.person where person.pid=bookseller.pid)
		  and printer.id=bookseller.id
		  and printer.id=pub_year.id
		  and pubdate >= ?::int
          and pubdate <= ?::int
		group by 1,2;
		<sql:param value="${param.startYear}"/>
        <sql:param value="${param.endyear}"/>
	</sql:query>
	<c:forEach items="${printerSeller.rows}" var="row" varStatus="rowCounter">
		<graph:edge source="${row.printer}" target="${row.bookseller}"  weight="${row.count}" />
	</c:forEach>

	<sql:query var="publisherSeller" dataSource="jdbc/ESTCTagLib">
		select publisher.pid as publisher,bookseller.pid as bookseller,count(*)
		from navigation.publisher,navigation.bookseller,estc.pub_year
		where exists (select person.pid from navigation.person where person.pid=publisher.pid)
		  and exists (select person.pid from navigation.person where person.pid=bookseller.pid)
		  and publisher.id=bookseller.id
		  and publisher.id=pub_year.id
		  and pubdate >= ?::int
          and pubdate <= ?::int
		group by 1,2;
		<sql:param value="${param.startYear}"/>
        <sql:param value="${param.endyear}"/>
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
