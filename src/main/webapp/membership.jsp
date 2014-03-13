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
<h1>Membership of the Research Networking Collaborative</h1>
<br />
<table>
	<tr><th>Person</th><th>Institution</th></tr>
	<tr><td>Barnett, William</td><td>Indiana University</td></tr>
	<tr><td>Bian, Jiang</td><td>University of Arkansas</td></tr>
	<tr><td>Conlon, Michael</td><td>University of Florida</td></tr>
	<tr><td>Eichmann, David</td><td>University of Iowa</td></tr>
	<tr><td>Falk-Krzesinski, Holly</td><td>Elsevier</td></tr>
	<tr><td>Haendel, Melissa</td><td>Oregon Health &amp; Science University</td></tr>
	<tr><td>Hill, Mary</td><td>University of Michigan</td></tr>
	<tr><td>Holmes, Kristi</td><td>Washington University</td></tr>
	<tr><td>Liu, Jing</td><td>University of Michigan</td></tr>
	<tr><td>Maclay, Michelle</td><td>University of North Carolina</td></tr>
	<tr><td>Meeks, Eric</td><td>University of California, San Francisco</td></tr>
	<tr><td>Obeid, Jihad</td><td>University of South Carolina</td></tr>
	<tr><td>Reuter, Katja</td><td>University of Southern California</td></tr>
	<tr><td>Shaffer, Christopher</td><td>Oregon Health &amp; Science University</td></tr>
	<tr><td>Steele, Scott</td><td>University of Rochester</td></tr>
	<tr><td>Taylor, Bradley</td><td>Medical College of Wisconsin</td></tr>
	<tr><td>Weber, Griffin</td><td>Harvard University</td></tr>
	<tr><td>Yuan, Leslie</td><td>University of California, San Francisco</td></tr>
</table>
<br />
<br />
<br />
<jsp:include page="footer.jsp" flush="true" />
</div>
</div>
</body>
</html>
