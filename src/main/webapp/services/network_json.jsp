<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

{
	<sql:query var="publications" dataSource="jdbc/ESTCTagLib">
		select publication.id,title,pubdate from estc.publication,estc.pub_year where publication.id=pub_year.id;
	</sql:query>

  "publications":[
	<c:forEach items="${publications.rows}" var="row" varStatus="rowCounter">
		    {"id":"${row.id}","title":"${row.title}","pubdate":"${row.pubdate}"}<c:if test="${ rowCounter.count < publications.rowCount }">,</c:if>
	</c:forEach>
  ],

	<sql:query var="persons" dataSource="jdbc/ESTCTagLib">
		select id,first_name,last_name from extraction.person where id in (select person_id from extraction.place) order by last_name,first_name;
	</sql:query>

  "persons":[
	<c:forEach items="${persons.rows}" var="row" varStatus="rowCounter">
		    {"id":"${row.id}","first_name":"${row.first_name}","last_name":"${row.last_name}"}<c:if test="${ rowCounter.count < persons.rowCount }">,</c:if>
	</c:forEach>
  ],

	<sql:query var="roles" dataSource="jdbc/ESTCTagLib">
		select estc_id,person_id,role from extraction.role;
	</sql:query>

  "roles":[
	<c:forEach items="${roles.rows}" var="row" varStatus="rowCounter">
		    {"estc_id":"${row.estc_id}","person_id":"${row.person_id}","role":"${row.role}"}<c:if test="${ rowCounter.count < roles.rowCount }">,</c:if>
	</c:forEach>
  ],

	<sql:query var="locations" dataSource="jdbc/ESTCTagLib">
		select id,location from extraction.location order by location;
	</sql:query>

  "locations":[
	<c:forEach items="${locations.rows}" var="row" varStatus="rowCounter">
		    {"id":"${row.id}","location":"${row.location}"}<c:if test="${ rowCounter.count < locations.rowCount }">,</c:if>
	</c:forEach>
  ],

	<sql:query var="places" dataSource="jdbc/ESTCTagLib">
		select distinct estc_id,person_id,locational,location_id,pubdate from extraction.place,estc.pub_year where place.estc_id=pub_year.id;
	</sql:query>

  "places":[
	<c:forEach items="${places.rows}" var="row" varStatus="rowCounter">
		    {"estc_id":"${row.estc_id}","person_id":"${row.person_id}","locational":"${row.locational}","location_id":"${row.location_id}","pubdate":"${row.pubdate}"}<c:if test="${ rowCounter.count < places.rowCount }">,</c:if>
	</c:forEach>
  ],

	<sql:query var="sublocations" dataSource="jdbc/ESTCTagLib">
		select distinct estc_id,parent_id,locational,location_id from extraction.sublocation order by parent_id,estc_id;
	</sql:query>

  "sublocations":[
	<c:forEach items="${sublocations.rows}" var="row" varStatus="rowCounter">
		    {"estc_id":"${row.estc_id}","parent_id":"${row.parent_id}","locational":"${row.locational}","location_id":"${row.location_id}"}<c:if test="${ rowCounter.count < sublocations.rowCount }">,</c:if>
	</c:forEach>
  ]
}
