<style>
.node {
	stroke: #fff;
	stroke-width: 1.5px;
}

text {
	stroke: #000;
	stroke-width: 0.0px;
	font: 15px sans-serif;
	pointer-events: none;
}

.link {
	stroke: #999;
	stroke-opacity: .6;
}
</style>
<script src="http://d3js.org/d3.v3.min.js"></script>
<script>

var width = 700,
    height = 700,
    radius = 4;

var color = d3.scale.category20();

var force = d3.layout.force()
    .charge(-50)
    .linkDistance(${param.ld})
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
    .enter().append("g")
      .attr("class", "node")
		.on("dblclick", function(d) { window.open(d.url,"_self");})
       .call(force.drag);
  
  node.append("circle")
      .attr("r", function(d) { return d.score; })
	  .style("fill", function(d) { return color(d.group); });

  node.append("text")
	.attr("x", function(d) { return d.score + 5; })
	    .attr("dy", ".35em")
     .text(function(d) { return d.name; });

  force.on("tick", function() {
    link.attr("x1", function(d) { return d.source.x; })
        .attr("y1", function(d) { return d.source.y; })
        .attr("x2", function(d) { return d.target.x; })
        .attr("y2", function(d) { return d.target.y; });

    node.attr("cx", function(d) { return d.x = Math.max(radius, Math.min(width - d.score, d.x)); })
        .attr("cy", function(d) { return d.y = Math.max(radius, Math.min(height - d.score, d.y)); })
    .attr("transform", function(d) { return "translate(" + d.x + "," + d.y + ")"; });
  });
});

</script>