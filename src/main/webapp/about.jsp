<%@ page errorPage="/error/error.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Research Networking Collaborative</title>
<style type="text/css" media="all">@import "resources/layout.css";</style>
</head>
<body>

<div id="roof" style="background-image: url(images/graph_small.png); height: 92px"><div> </div></div>
<div id="content">
<jsp:include page="header.jsp" flush="true" />


<c:if test="${empty guid}">
	<c:set var="guid" value="guest" scope="session" />
</c:if>
<jsp:include page="menu.jsp" flush="true">
	<jsp:param name="caller" value="index" />
</jsp:include>
<div id="centerCol">
<h1>The Research Networking Collaborative</h1>
<h2>Mission</h2>

Pioneering new technology, solutions and services for research networking and team science.

<h2>Overview</h2>

<p>The RNC was created in 2014, growing out of the Research Networking Affinity Group (RNAG),
an initiative of the Informatics Key Function Committee of the <a href="http://ctsacentral.org">Clinical and Translational Science Awards
(CTSA) Consortium</a>.  In the preceding 6 years, the RNAG was instrumental in promoting the advancement of
research networking and resource networking.  For the former, this group led to the funding of the VIVO project (<a href="http://vivoweb.org">vivoweb.org</a>)
to support research networking for the CTSA Consortium and translational research in general.  A parallel funding effort
sponsored the eagle-i initiative (<a href="http://eagle-i.net">eagle-i.net</a>) to promote research resource cataloging and discovery.</p>

<p>The scope of the RNC has expanded beyond the CTSA to include other fields of research and collaboration and beyond the existing
information frameworks and tools to include new technical partnerships and approaches.</p>

<p>We are just beginning this journey.  If you are interested in contributing to our effort, we welcome your participation.</p>

<h2>Leadership</h2>

<ul class="bulletedList">
	<li><a href="https://www.icts.uiowa.edu/Loki/research/browseResearch.jsp?browse=E&id=950712">David Eichmann</a> (University of Iowa): david-eichmann (at) uiowa.edu
	<li>Bill Barnett (Indiana University): barnettw (at) iu.edu
</ul>
<br />
<br />
<br />
<jsp:include page="footer.jsp" flush="true" />
</div>
</div>
</body>
</html>
