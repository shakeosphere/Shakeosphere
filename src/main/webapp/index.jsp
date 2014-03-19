<%@ page errorPage="/error/error.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Shakeosphere</title>
<style type="text/css" media="all">@import "resources/style.css";</style>
</head>
<body>
<div id="body">
<jsp:include page="header.jsp" flush="true" />
<jsp:include page="menu.jsp" flush="true">
	<jsp:param name="caller" value="index" />
</jsp:include>
<div id="center">
<h2>Welcome to Shakeosphere</h2>
<p> "Shakeosphere" is a digital tool that will allow users around the globe to visualize, map, and explore early modern social networks. 
Information about early publishers, printers, authors, and the manuscript records they left behind has long been available,
but only in far-flung scholarly articles and library catalogues. "Shakeosphere" will bring this data together in one place for the first time.
</p>
<p> Users can then curate and query this data to understand the way information travelled in Shakespeare's world and to learn more about
individual authors and texts. Once the tool is fully functional, each "node" representing a person or work will be linked to bibliographic
and biographical information - and we will encourage users to become collaborators by uploading their own images and text. In the meantime,
see the "Updates" section for samples of our preliminary visualizations and to learn more about our tools and processes.
</p>
</div>
</div>
</body>
