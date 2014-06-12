<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<c:if test="${empty guid}">
	<c:set var="guid" value="guest" scope="session" />
</c:if>

<div id="sidebar">
<ul>
<li> <a href="<util:applicationRoot/>/index.jsp">Home</a></li>
<li> <a href="<util:applicationRoot/>/publicationCount.jsp">Explore the Data</a>
<c:if test="${param.caller == 'visualization'}">
	<ul>
		<li> <a href="<util:applicationRoot/>/publicationCount.jsp">Publication Frequency</a>
	</ul>
</c:if>
<c:if test="${param.caller == 'person'}">
	<ul>
		<li> <a href="<util:applicationRoot/>/persons/persons.jsp">Full Person List (big)</a>
	</ul>
</c:if>
<c:if test="${param.caller == 'publication'}">
	<ul>
		<li> <a href="<util:applicationRoot/>/publications/publications.jsp">Full Publication List (really big)</a>
	</ul>
</c:if>
</li>
<li> <a href="<util:applicationRoot/>/about.jsp">About</a></li>
<li> <a href="<util:applicationRoot/>/updates.jsp">Updates</a></li>
<li> <a href="<util:applicationRoot/>/grants.jsp">Grants and Support</a></li>
<li> <a href="<util:applicationRoot/>/people.jsp">People</a></li>
<li> <a href="<util:applicationRoot/>/projects.jsp">Related Projects</a></li>
<li> <a href="<util:applicationRoot/>/contact.jsp">Contact</a></li>
</ul>
<c:if test="${param.caller == 'visualization'}">
<div id="explanation">
<p><em>To explore the data further:</em></p>
<p>Click on a decade for a list of years within that decade, or click on a 
bar to see a graph of the data from that year.
</p>
</div>
</c:if>
<script src="http://d3js.org/d3.v2.min.js"></script>
<script>
function drawColorKey() {
	var w = 500;
	var h = 500;
	var colors = d3.scale.category10();
	var legendtext = ["Author", "Publisher", "Printer", "Bookseller"];
	var k = 0;
	
	var svg3 = d3.select("#legend")
		.append("svg")
		.attr("width", w)
		.attr("height", h);
	
	svg3.selectAll("rect")
		.data(legendtext)
		.enter()
		.append("rect")
		.attr("width", 15)
		.attr("height", 15)
		.attr("x", 10)
		.attr("y", function(d,k) {
			if (k <= d.length) {
				return 10+(25*k);
				k++;
			}
		} )
		.attr("fill", function (d) {
			return colors(d);
		});
		
	svg3.selectAll("text")
		.data(legendtext)
		.enter()
		.append("text")
		.text (function (d) {
			return d;
		})
		.attr("x", 30)
		.attr("y", function(d, k) {
			if (k <= d.length) {
				return 23+(25*k);
				k++;
			}
		} );
}
</script>
<c:if test="${param.caller == 'pubyear' }">
<p id="legendtitle"><em>Color Key:</em></p>
<div id="legend">	
</div>
<script>drawColorKey();</script>
</c:if>
</div>

<c:set var="menu.displayed">true</c:set>
