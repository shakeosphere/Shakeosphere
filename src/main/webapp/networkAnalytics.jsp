<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Shakeosphere</title>
<style>
body {
    font-weight: normal;
    font-size: 18px;
    margin: 0px;
    color: #222;
}

#shakeosphere_form {
    background-color: #FFE7D2;
    padding: 0px;
    border: none;
    float: left;
    width: 350px;
    height: 100%;
    /*display: table;*/
    font-family: "Gill Sans", "Gill Sans MT", Arial, sans-serif;
    overflow: auto;
}

#graph {
    font-family: "Gill Sans", "Gill Sans MT", Arial, sans-serif;
    font-size: 15px;
}

.updateButton{
    font-family: "Gill Sans", "Gill Sans MT", Arial, sans-serif;
    padding: 10px;
    background-color: #904D13;
    color: #fff;
    border-style: solid;
    border-color: #FFE7D2;
    font-weight: normal;
    font-size: 18px;
    margin: 10px 0px 10px 0px;
    -webkit-transition-duration: 0.2s; /* Safari */
    transition-duration: 0.2s;
}

.updateButton:hover {
    background-color: #DB8F60;
    border-color: #904D13;
    color: black;
    cursor: pointer;
}

.inputText, .select  {
    font-family: "Gill Sans", "Gill Sans MT", Arial, sans-serif;
    font-size: 16px;
    padding: 8px;
    border: solid;
    border-width: 1px;
}

.spacing {
    margin: 18px;
}

.formHeading {
    font-weight: normal;
    padding: 20px;
    margin: 0px;
    font-size: 25px;
}

.accordion{
    float:left;
    display:block;
    width:100%;
    box-sizing: border-box;
}

.accordionHeading{
    font-size: 20px;
    cursor: pointer;
    margin: 0px 0px 0px 0px;
    padding: 20px;
    background: #904D13;
    color: #ddd;
    width: 100%;
    box-sizing: border-box;
}

.panelHeading, .panelForm {
    margin: 0px 0px 10px 0px;
    font-weight: normal;
}

.close .panel{
    height:0px;
    transition:height 1s ease-out;
    -webkit-transform: scaleY(0);
	-o-transform: scaleY(0);
	-ms-transform: scaleY(0);
	transform: scaleY(0);
    float:left;
    display:block;   
}

.open .panel{
    padding: 20px;
    background-color: #FFE7D2;
    width: 100%;
    margin: 0px 0px 0px 0px;
    display:block;
    -webkit-transform: scaleY(1);
	-o-transform: scaleY(1);
	-ms-transform: scaleY(1);
	transform: scaleY(1);
    -webkit-transform-origin: top;
	-o-transform-origin: top;
	-ms-transform-origin: top;
	transform-origin: top;
	-webkit-transition: -webkit-transform 0.4s ease-out;
	-o-transition: -o-transform 0.4s ease;
	-ms-transition: -ms-transform 0.4s ease;
	transition: transform 0.4s ease;
    box-sizing: border-box;
}

.accordionHeading:hover{
    margin:0px 0px 0px 0px;
    background-color: #bdc3c7;
    color: #7f8c8d;
}
</style>
</head>
<body>

<div id="shakeosphere_form">
<img src="images/banner1.png" width="350" />
<p class="formHeading">Choose a visualization</p>

<div id="force" class="accordion close">
<p class="accordionHeading">Network map</p>
<div class="panel" id="forceIndivSearch" style="float:left; padding-right:40px;">
<p class="panelHeading">Enter a date range between 1473 and 1800</p>
<p style="font-size: 14px;">Warning: Networks for date ranges after 1600 and longer than a few years may be very large.</p>
<form class="panelForm">
    Start<br />
    <input class="inputText" type="text" name="startYear" id="startYearInput_force" onkeydown="if (event.keyCode === 13) update();"><br />
    End<br />
    <input class="inputText" type="text" name="endYear" id="endYearInput_force" onkeydown="if (event.keyCode === 13) update();"><br />
    <button type="button" class="updateButton" onclick="update();">Update</button>
</form>
<p class="spacing" />
<p class="panelHeading">Search for one or two individuals</p>
<form class="panelForm">
    Individual 1<br />
    <input class="inputText" type="text" name="indiv1" id="indiv1Input" onkeydown="if (event.keyCode === 13) updateSearchIndivs();"><br />
    Individual 2<br />
    <input class="inputText" type="text" name="indiv2" id="indiv2Input" onkeydown="if (event.keyCode === 13) updateSearchIndivs();"><br />
    <button type="button" class="updateButton" onclick="updateSearchIndivs();">Search</button> 
</form>
</div>
</div>

<div id="line" class="accordion close">
<p class="accordionHeading">Statistics over time</p>
<div class="panel" id="chooseLineType">
<p class="panelHeading">Enter a date range between 1473 and 1800</p>
<form class="panelForm">
    Start<br />
    <input class="inputText" type="text" name="startYear" id="startYearInput_line" onkeydown="if (event.keyCode === 13) update();"><br />
    End<br />
    <input class="inputText" type="text" name="endYear" id="endYearInput_line" onkeydown="if (event.keyCode === 13) update();"><br />
    <button type="button" class="updateButton" onclick="update();">Update</button> 
</form>
<p class="panelHeading">Choose a statistic</p>
<select class="select" id="lineTypeInput" onchange="update();">
    <option value="">---</option>
    <option value="GCC Percentage">GCC percentage</option>
    <option value="Degree">Individual degree</option>
    <option value="Betweenness">Individual betweenness</option>
</select>
<div id="lineTypeIndivSearch" style="display: none;">
<p class="spacing" />
<p class="panelHeading">Choose up to four individuals</p>
<form class="panelForm">
    Individual 1<br />
    <input class="inputText" type="text" name="indiv1" id="indivLine1Input" onkeydown="if (event.keyCode === 13) update();"><br />
    Individual 2<br />
    <input class="inputText" type="text" name="indiv2" id="indivLine2Input" onkeydown="if (event.keyCode === 13) update();"><br />
    Individual 3<br />
    <input class="inputText" type="text" name="indiv2" id="indivLine3Input" onkeydown="if (event.keyCode === 13) update();"><br />
    Individual 4<br />
    <input class="inputText" type="text" name="indiv2" id="indivLine4Input" onkeydown="if (event.keyCode === 13) update();"><br />
    <button type="button" class="updateButton" onclick="update();">Update</button> 
</form>
</div>
</div>
</div>
</div>

<div id="graph" style="float:left;"></div>

<script src="resources/jsnetworkx.js"></script>
<script src="resources/d3.v3.min.js"></script>
<script src="resources/force_graph.js"></script>
<script src="resources/line_chart.js"></script>
<script src="resources/spin.min.js"></script>
<script src="resources/d3.legend.js"></script>

<script>
var startYear = 0,
    endYear = 0;
var FORCE = 'force',
    LINE = 'line',
    BAR = 'bar';
var GCC = 'GCC Percentage',
    INDIV_DEGREE = "Degree",
    INDIV_BETWEENNESS = "Betweenness";    
    
var G = null;
var svg_graph = null;
var svg_line_gcc = null;

var accItem = document.getElementsByClassName('accordion');
var accHD = document.getElementsByClassName('accordionHeading');
for (var i = 0; i < accHD.length; i++) {
    accHD[i].addEventListener('click', toggleItem, false);
}
function toggleItem() {
    var itemClass = this.parentNode.className;
    for (var i = 0; i < accItem.length; i++) {
        accItem[i].className = 'accordion close';
    }
    if (itemClass === 'accordion close') {
        this.parentNode.className = 'accordion open';
        clearDate();
        update();
    }
}
 
function currVisualization() {
    for (var i = 0; i < accHD.length; i++) {
        if (accItem[i].className === 'accordion open') {
            return accItem[i].id;
        }
    }
    return "";
}

function currLineType() {
    var e = document.getElementById("lineTypeInput");
    return e.options[e.selectedIndex].value;
}

function clearChart() {
    document.getElementById("graph").innerHTML = "";
}

function clearDate() {
    var viz = currVisualization();
    document.getElementById("startYearInput_" + viz).value = "";
    document.getElementById("endYearInput_" + viz).value = "";
}

function update() {
    var success = updateDate();
    if (!success) {
        return;
    }
    updateForm();
    updateVisualization(startYear, endYear);
}

function updateDate() {
    var viz = currVisualization();
    var startYearStr = document.getElementById("startYearInput_" + viz).value;
    var endYearStr = document.getElementById("endYearInput_" + viz).value;
    startYear = parseInt(startYearStr);
    endYear = parseInt(endYearStr);
    
    if (startYearStr === "" && endYearStr === "") {
        clearChart();
        return false;
    } 
    
    if (isNaN(startYearStr) || startYear < 1473) {
        alert("Invalid start year.");
        return false;
    } else if (isNaN(endYearStr) || startYear < 1473 || endYear > 1800) {
        alert("Invalid end year.");
        return false;
    } else if (startYearStr === "" || endYearStr === "") {
        alert("Please enter a date range.");
        return false;
    } else if (startYear > endYear) {
        alert("The end year must come after the start year.");
        return false;
    }
    return true;
}

function updateVisualization(startYear, endYear) {
    clearChart();
    
    var target = document.getElementById('graph')
    var spinner = new Spinner().spin(target);
    
    if (currVisualization() === FORCE) {
        shake_graph(startYear, endYear);
        return;
    } else if (currVisualization() === LINE) {
        var lineType = currLineType();
        if (lineType === GCC) {
            shake_line_gcc(startYear, endYear);
            return;
        } else if (lineType === INDIV_DEGREE) {
            var indivs = updateLineIndivs();
            if (indivs !== null && indivs.length !== 0) {
                shake_line_indiv(startYear, endYear, indivs, 'Degree');
                return;
            }
        } else if (lineType === INDIV_BETWEENNESS) {
            var indivs = updateLineIndivs();
            if (indivs !== null && indivs.length !== 0) {
                shake_line_indiv(startYear, endYear, indivs, 'Betweenness');
                return;
            }
        }
    } else if (currVisualization() === BAR) {
        // TODO: Not yet implemented.
        // return;
    }
    clearChart();
}

function updateForm() {
    if (currVisualization() === LINE) {
        var lineType = currLineType();
        if (lineType === INDIV_DEGREE || lineType === INDIV_BETWEENNESS) {
            document.getElementById('lineTypeIndivSearch').style.display = 'block';
        } else {
            document.getElementById('lineTypeIndivSearch').style.display = 'none';
        }
    }
}

String.prototype.trim=function(){return this.replace(/^\s+|\s+$/g, '');};

function updateSearchIndivs() {
    if (currVisualization() !== FORCE) {
        return;
    }
    var indiv1Str = document.getElementById("indiv1Input").value.trim();
    var indiv2Str = document.getElementById("indiv2Input").value.trim();
    if (indiv1Str === "" && indiv2Str === "") {
        graph_reset(svg_graph);
        return;
    }
    if (indiv1Str === "" && indiv2Str !== "") {
        indiv1Str = indiv2Str;
        indiv2Str = "";
    }
    if (indiv2Str === "") {
        search_name(indiv1Str, G, svg_graph);
    } else {
        shortest_path(indiv1Str, indiv2Str, G, svg_graph);
    } 
}

function updateLineIndivs() {
    if (currVisualization() !== LINE ||
       (currLineType() !== INDIV_DEGREE && currLineType() !== INDIV_BETWEENNESS)) {
        return null;
    }
    var indivStrs = [];
    for (var i = 1; i <= 4; i++) {
        indivStrs.push(document.getElementById("indivLine" + i + "Input").value.trim());
    }
    return indivStrs.filter(function(e) { return e !== ""; });
}

d3.selection.prototype.moveToFront = function() {
  return this.each(function(){
    this.parentNode.appendChild(this);
  });
};

var xmlhttp = new XMLHttpRequest();

function shake_graph(startYear, endYear) {
    xmlhttp.onreadystatechange = function() {
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
            var graph_json = JSON.parse(xmlhttp.responseText);
            G = new jsnx.Graph();
            for (var n in graph_json.nodes) {
                var node = graph_json.nodes[n];
                G.addNode(node.id, { 'name':node.name, 'role':node.role, 'score':node.score });
            }
            for (var e in graph_json.links) {
                var edge = graph_json.links[e];
                var source = graph_json.nodes[edge.source];
                var target = graph_json.nodes[edge.target];
                G.addEdge(source.id, target.id);
            }
            clearChart();
            svg_graph = draw_force_graph(graph_json);
        }
    };
    xmlhttp.open("GET", "networkAnalyticsData.jsp?startYear=" + startYear + "&endYear=" + endYear, true);
    xmlhttp.send();
}

function shake_line_gcc(startYear, endYear) {
    xmlhttp.onreadystatechange = function() {
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
            var yearly_data = JSON.parse(xmlhttp.responseText);
            clearChart();
            svg_line = draw_line_chart([ yearly_data ], "GCC %");
            addLine(yearly_data, "#226666", svg_line, "");
        }
    };
    xmlhttp.open("GET", "lineChartGCC.jsp?startYear=" + startYear + "&endYear=" + endYear, true);
    xmlhttp.send();
}

function toTitleCase(str)
{
    return str.replace(/\w\S*/g, function(txt){return txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase();});
}

function fill_missing_years(json, startYear, endYear) {
    var filledJson = [];
    var currYear = startYear;
    while (json.length > 0) {
        var currElem = json.shift();
        while (currYear < currElem.year) {
            filledJson.push({ year:currYear, value:0 });
            currYear++;
        }
        filledJson.push(currElem);
        currYear++;
    }
    while (currYear <= endYear) {
        filledJson.push({ year:currYear, value:0 });
        currYear++;
    }
    return filledJson;
}

function shake_line_indiv(startYear, endYear, indiv_names, metric) {
    clearChart();
    var jsons = [];
    var colors = [ "#AA3939", "#226666", "#7A9F35", "#440026" ];
    shake_line_indiv_recur(startYear, endYear, indiv_names, 0, metric, jsons, colors);
}

function shake_line_indiv_recur(startYear, endYear, indiv_names, indiv_pos,
                                metric, jsons, colors) {
    var name = toTitleCase(indiv_names[indiv_pos]);
    xmlhttp.onreadystatechange = function() {
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
            var json = JSON.parse(xmlhttp.responseText);
            if (json.length === 0) {
                alert("Could not find " + name + " in the date range you specifed.");
            }
            jsons.push(fill_missing_years(json, startYear, endYear));
            if (indiv_names.length - 1 === indiv_pos) {
                svg_line = draw_line_chart(jsons, metric);
                for (var j in jsons) {
                    addLine(jsons[j], colors[j % colors.length], svg_line, toTitleCase(indiv_names[j]));
                }
                add_legend(svg_line);
            } else {
                shake_line_indiv_recur(startYear, endYear, indiv_names, indiv_pos + 1, metric, jsons, colors);
            }
        }
    };
    xmlhttp.open("GET", "lineChartIndiv" + metric + ".jsp?startYear=" + startYear + "&endYear=" + endYear + "&name=" + name, true);
    xmlhttp.send(); 
}

</script>
</body>
</html>
