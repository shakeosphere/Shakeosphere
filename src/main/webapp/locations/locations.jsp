<%@ page errorPage="../error/error.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="estc" uri="http://icts.uiowa.edu/ESTCTagLib"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Shakeosphere</title>
<style type="text/css" media="all">@import "../resources/style.css";</style>
</head>
<body>
<div id="body">
<jsp:include page="../header.jsp" flush="true" />
<jsp:include page="../menu.jsp" flush="true">
	<jsp:param name="caller" value="location" />
</jsp:include>
<div id="center">
<h2>Identified Locations in Shakeosphere</h2>
<ul>
<estc:foreachLocation var="x" sortCriteria="regexp_replace(regexp_replace(regexp_replace(regexp_replace(label, '^The ', ''), '^the ', ''), '^ye ', ''), '^a ', '')">
	<estc:location>
		<li><a href="location.jsp?lid=<estc:locationLid/>"><estc:locationLabel/></a>
	</estc:location>
</estc:foreachLocation>
</ul>
<jsp:include page="../footer.jsp" flush="true" />
</div>
</div>
</body>
