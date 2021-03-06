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
	<jsp:param name="caller" value="publication" />
</jsp:include>
<div id="center">
<h2>Publications in Shakeosphere</h2>
<ul>
<estc:foreachPublication var="x" sortCriteria="date1,title">
	<estc:publication>
		<li><a href="publication.jsp?id=<estc:publicationID/>"><estc:publicationDate1/>: <estc:publicationTitle/></a>
	</estc:publication>
</estc:foreachPublication>
</ul>
<jsp:include page="../footer.jsp" flush="true" />
</div>
</div>
</body>
