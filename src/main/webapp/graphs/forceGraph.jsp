<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
.node {
	stroke: #fff;
	stroke-width: 1.5px;
}

.link {
	stroke: #999;
	stroke-opacity: .6;
}
</style>
<script src="http://d3js.org/d3.v3.min.js"></script>
<script>

var width = 600,
    height = 600,
    radius = 4,
    charge = -50,
    linkDistance = 30;
    
<c:if test="${not empty param.charge}">
	charge = -${param.charge};
</c:if>
<c:if test="${not empty param.linkDistance}">
	linkDistance = ${param.linkDistance};
</c:if>

var color = d3.scale.category10();

var force = d3.layout.force()
	.charge(charge)
	.linkDistance(linkDistance)
    .size([width, height]);

var svg = d3.select("#graph").append("svg")
	.attr("xmlns","http://www.w3.org/2000/svg")
    .attr("width", width)
    .attr("height", height);

d3.json("${param.data_page}", function(error, graph) {
  force
      .nodes(graph.nodes)
      .links(graph.links)
      .start();

  var link = svg.selectAll(".link")
      .data(graph.links)
    .enter().append("line")
      .attr("class", "link")
      .style("stroke-width", function(d) { return Math.sqrt(d.value); });

  var node = svg.selectAll(".node")
      .data(graph.nodes)
    .enter().append("circle")
      .attr("class", "node")
      .attr("r", function(d) { return d.score; })
      .style("fill", function(d) { return color(d.group); })
		.on("dblclick", function(d) { window.open("/Shakeosphere/persons/person.jsp?pid="+d.url,"_self");})
       .call(force.drag);

  node.append("title")
      .text(function(d) { return d.name; });

  force.on("tick", function() {
    link.attr("x1", function(d) { return d.source.x; })
        .attr("y1", function(d) { return d.source.y; })
        .attr("x2", function(d) { return d.target.x; })
        .attr("y2", function(d) { return d.target.y; });

    node.attr("cx", function(d) { return d.x = Math.max(radius, Math.min(width - d.score, d.x)); })
        .attr("cy", function(d) { return d.y = Math.max(radius, Math.min(height - d.score, d.y)); });
  });
});

</script>