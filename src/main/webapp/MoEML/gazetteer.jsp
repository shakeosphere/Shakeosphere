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
	<jsp:param name="caller" value="gazetteer" />
</jsp:include>
<div id="center">
<h2>MoEML References in Shakeosphere</h2>
<estc:gazetteer moemlId="${param.id}">
<h2><a href="gazetteerClick.jsp?id=<estc:gazetteerMoemlId/>"><estc:gazetteerMoemlId/></a>: <estc:gazetteerTitle/></h2>

<ul>
<estc:foreachMatch var="x">
	<estc:match>
		<estc:publication ID="${tag_match.ID}">
			<c:if test="${tag_match.seqnum == 0}"><li><a href="../publications/publication.jsp?id=<estc:matchID/>"><estc:matchID/></a>: <estc:publicationTitle/> (<estc:publicationDate1/>)</c:if>
		</estc:publication>
	</estc:match>
</estc:foreachMatch>
</ul>

<h3>Variants:</h3>
<ul>
<estc:foreachVariant var="x">
	<estc:variant>
		<li><estc:variantVariant/>
<ul>
<estc:foreachMatch var="x">
	<estc:match>
		<estc:publication ID="${tag_match.ID}">
			<c:if test="${tag_variant.seqnum == tag_match.seqnum}"><li><a href="../publications/publication.jsp?id=<estc:matchID/>"><estc:matchID/></a>: <estc:publicationTitle/> (<estc:publicationDate1/>)</c:if>
		</estc:publication>
	</estc:match>
</estc:foreachMatch>
</ul>
	</estc:variant>
</estc:foreachVariant>
</ul>
</estc:gazetteer>
<jsp:include page="../footer.jsp" flush="true" />
</div>
</div>
</body>
