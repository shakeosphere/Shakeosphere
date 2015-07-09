<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
 .chart {
    font-family: Arial, sans-serif;
    font-size: 10px;
  }

  .axis path, .axis line {
    fill: none;
    stroke: #000;
    shape-rendering: crispEdges;
  }

  .bar {
    fill: steelblue;
  }
</style>
<script src="../resources/d3.v3.min.js"></script>
<script>

var data = ${param.data_array};

var margin = {top: 0, right: 12, bottom: 22, left:10},
    width = 550,
    height = 50;

<c:if test="${not empty param.height}">
	height = ${param.height};
</c:if>

var x = d3.time.scale()
    .domain([new Date("${param.min_year}"), d3.time.day.offset(new Date("${param.max_year}"), 1)])
    .rangeRound([0, width - margin.left - margin.right]);

var y = d3.scale.linear()
    .domain([0, d3.max(data, function(d) { return d.total; })])
    .range([height - margin.top - margin.bottom, 0]);

var xAxis = d3.svg.axis()
    .scale(x)
    .orient('bottom')
    .ticks(d3.time.years, 10)
    .tickFormat(d3.time.format('%Y'))
    .tickSize(5)
    .tickPadding(8);

var yAxis = d3.svg.axis()
    .scale(y)
    .orient('left')
    .tickPadding(8);

var svg = d3.select('#${param.div_id}').append('svg')
    .attr('class', 'chart')
    .attr('width', width)
    .attr('height', height)
  .append('g')
    .attr('transform', 'translate(' + margin.left + ', ' + margin.top + ')');
    
svg.selectAll('.chart')
    .data(data)
  .enter().append('rect')
    .attr('class', 'bar')
    .attr('x', function(d) { return x(new Date(d.date)); })
    .attr('y', function(d) { return height - margin.top - margin.bottom - (height - margin.top - margin.bottom - y(d.total)) })
    .attr('width', 10)
    .attr('height', function(d) { return height - margin.top - margin.bottom - y(d.total) });

svg.append('g')
    .attr('class', 'x axis')
    .attr('transform', 'translate(0, ' + (height - margin.top - margin.bottom) + ')')
    .call(xAxis);

svg.append('g')
  .attr('class', 'y axis')
  .call(yAxis);
 
<c:if test="${not empty param.click_action}">
	var rect = svg.append("rect").attr({
		"class" : "overlay",
		"width" : width,
		"height" : height
	}).attr('fill-opacity', 0.0)
	.on({
		"click" : function() {
			window.open("${param.click_action}"
					+ (new Date(x.invert(d3.mouse(this)[0]))).getFullYear(),
					"_self");
		}
	});
</c:if>
</script>
