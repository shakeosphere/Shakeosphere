<%@ page errorPage="/error/error.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="estc" uri="http://icts.uiowa.edu/ESTCTagLib"%>


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
<p> Facebook and the blogosphere have made us increasingly aware of the power of social networks. But as long as we've had 
societies, we've had networks and communication technologies to hold them together. Shakeosphere allows users to visualize, 
map, and explore these social networks in Shakespeare's England and beyond, from 1473-1800. Our goal is to make it easy 
and intuitive to see and search the ways that books, letters, and other documents connected readers, writers, printers, 
publishers, and booksellers around the globe.
</p>
<p> Information about early publishers, printers, authors, and the manuscript records they left behind has long been 
available, but only in far-flung scholarly articles and library catalogues. Shakeosphere brings this data together in one 
place for the first time. You can create and search visualizations you can create by following the link to "Explore the 
Data," then selecting a year or date range. Each "node" on the resulting network map represents a person, and the lines, 
or "edges" represent the printed or manuscript works connecting the nodes. Users can then curate and query this data to 
understand the way information travelled in Shakespeare's world and to learn more about individual authors and texts. In 
coming updates, we'll be linking each of these nodes to Wiki pages where users can learn more or upload their own images 
and text.
</p>
<p> In the meantime, see the "Updates" section for samples of the way we've been using our visualizations to rethink the 
early modern social network and to learn more about our tools and processes. 
</p>
<jsp:include page="footer.jsp" flush="true" />
</div>
</div>
</body>
