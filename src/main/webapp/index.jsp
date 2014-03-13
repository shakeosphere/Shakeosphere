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
<p>Research Networking involves both technical elements (the deployment of a platform to engage researchers and field information
regarding their research), </p>
<p>Research Networking (RN) is about using web-based tools to discover and use research and scholarly information about people and resources.
Research Networking tools (RN tools) serve as knowledge management systems for the research enterprise. RN tools connect
institution-level/enterprise systems, national research networks, publicly available research data (e.g., grants and publications), and
restricted/proprietary data by harvesting information from disparate sources into compiled expertise profiles for faculty, investigators,
scholars, clinicians, community partners, and facilities. RN tools facilitate the development of new collaborations and team science to
address new or existing research challenges through the rapid discovery and recommendation of researchers, expertise, and resources.</p>
<br />
<br />
<br />
<jsp:include page="footer.jsp" flush="true" />
</div>
</div>
</body>
</html>
