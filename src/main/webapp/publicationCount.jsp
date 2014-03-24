<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Shakeosphere</title>
<style type="text/css" media="all">@import "resources/style.css";</style>
</head>
<body>
<div id="body">
<jsp:include page="header.jsp" flush="true" />
<jsp:include page="menu.jsp" flush="true">
	<jsp:param name="caller" value="visualization" />
</jsp:include>
<div id="center">
<c:if test="${empty param.decade }">
	<h1>Number of Publications by Decade</h1>
</c:if>
<c:if test="${not empty param.decade }">
	<h1>Number of Publications for <c:out value="${param.decade }"/>s</h1>
</c:if>
	<div id="chart"></div>
<c:if test="${not empty param.decade }">
	<br/>
	<a href="publicationCount.jsp">Back to full list.</a>
</c:if>

<jsp:include page="footer.jsp" flush="true" />
</div>
</div>
	<script src="http://d3js.org/d3.v2.min.js"></script>
	<script>
function renderChart() {

var data = d3.csv.parse(d3.select('#csv').text());
var valueLabelWidth = 50; // space reserved for value labels (right)
var barHeight = 20; // height of one bar
var barLabelWidth = 100; // space reserved for bar labels
var barLabelPadding = 5; // padding between bar and bar labels (left)
var gridLabelHeight = 18; // space reserved for gridline labels
var gridChartOffset = 3; // space between start of grid and first bar
var maxBarWidth = 420; // width of the bar with the max value
 
// accessor functions 
var barLabel = function(d) { return d.Name; };
var barValue = function(d) { return parseInt(d.Count); };
 
// scales
var yScale = d3.scale.ordinal().domain(d3.range(0, data.length)).rangeBands([0, data.length * barHeight]);
var y = function(d, i) { return yScale(i); };
var yText = function(d, i) { return y(d, i) + yScale.rangeBand() / 2; };
var x = d3.scale.linear().domain([0, d3.max(data, barValue)]).range([0, maxBarWidth]);
// svg container element
var chart = d3.select('#chart').append("svg")
  .attr('width', maxBarWidth + barLabelWidth + valueLabelWidth)
  .attr('height', gridLabelHeight + gridChartOffset + data.length * barHeight);
// grid line labels
var gridContainer = chart.append('g')
  .attr('transform', 'translate(' + barLabelWidth + ',' + gridLabelHeight + ')'); 
gridContainer.selectAll("text").data(x.ticks(10)).enter().append("text")
  .attr("x", x)
  .attr("dy", -3)
  .attr("text-anchor", "middle")
  .text(String);
// vertical grid lines
gridContainer.selectAll("line").data(x.ticks(10)).enter().append("line")
  .attr("x1", x)
  .attr("x2", x)
  .attr("y1", 0)
  .attr("y2", yScale.rangeExtent()[1] + gridChartOffset)
  .style("stroke", "#ccc");
// bar labels
var labelsContainer = chart.append('g')
  .attr('transform', 'translate(' + (barLabelWidth - barLabelPadding) + ',' + (gridLabelHeight + gridChartOffset) + ')'); 
labelsContainer.selectAll('text').data(data).enter().append('text')
		.on("click", function(d) { window.open("publicationCount.jsp?decade="+d.Name,"_self");})
  .attr('y', yText)
  .attr('stroke', 'none')
  .attr('fill', 'black')
  .attr("dy", ".35em") // vertical-align: middle
  .attr('text-anchor', 'end')
  .text(barLabel);
// bars
var barsContainer = chart.append('g')
  .attr('transform', 'translate(' + barLabelWidth + ',' + (gridLabelHeight + gridChartOffset) + ')'); 
barsContainer.selectAll("rect").data(data).enter().append("rect")
		.on("click", function(d) { window.open("publicationYear.jsp?year="+d.Name+"&count="+barValue(d),"_self");})
  .attr('y', y)
  .attr('height', yScale.rangeBand())
  .attr('width', function(d) { return x(barValue(d)); })
  .attr('stroke', 'white')
  .attr('fill', 'steelblue');
// bar value labels
barsContainer.selectAll("text").data(data).enter().append("text")
  .attr("x", function(d) { return x(barValue(d)); })
  .attr("y", yText)
  .attr("dx", 3) // padding-left
  .attr("dy", ".35em") // vertical-align: middle
  .attr("text-anchor", "start") // text-align: right
  .attr("fill", "black")
  .attr("stroke", "none")
  .text(function(d) { return d3.round(barValue(d), 2); });
// start line
barsContainer.append("line")
  .attr("y1", -gridChartOffset)
  .attr("y2", yScale.rangeExtent()[1] + gridChartOffset)
  .style("stroke", "#000");

}
    </script>
    
    <sql:setDataSource var="jdbc" driver="org.postgresql.Driver"
     url="jdbc:postgresql://localhost/estc"
     user="estc"  password="Shakeo"/>

<c:if test="${empty param.decade }">
<sql:query var="nodes" dataSource="${jdbc}">
		select (pubdate/10)*10 as name,count(*) from estc.pub_year group by 1 order by 1;
</sql:query>
</c:if>
<c:if test="${not empty param.decade }">
<sql:query var="nodes" dataSource="${jdbc}">
		select pubdate as name,count(*) from estc.pub_year where (pubdate/10)*10 = ?::int group by 1 order by 1;
		<sql:param value="${param.decade }"/>
</sql:query>
</c:if>
    
	<script id="csv" type="text/csv">Name,Count<c:forEach items="${nodes.rows}" var="row" varStatus="rowCounter"><% out.print("\n"); %>${row.name},${row.count}</c:forEach></script>
	<script>renderChart();</script>
</body>
</html>
