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
<p>"<a href="http://mapoflondon.uvic.ca">The Map of Early Modern London</a> is comprised of four distinct, interoperable projects:
a digital Map and gazetteer based on the 1560s Agas woodcut map of London; an Encyclopedia of London people, places, topics, and
terms; a Library of marked-up texts rich in London toponyms; and a versioned edition of John Stow's Survey of London."</p>

<ul>
<estc:foreachGazetteer var="x">
	<estc:gazetteer>
		<c:if test="${estc:gazetteerHasMatch(tag_gazetteer.moemlId)}">
			<li><a href="gazetteer.jsp?id=<estc:gazetteerMoemlId/>"><estc:gazetteerMoemlId/>: <estc:gazetteerTitle/></a>
		</c:if>
	</estc:gazetteer>
</estc:foreachGazetteer>
</ul>
<jsp:include page="../footer.jsp" flush="true" />
</div>
</div>
</body>
