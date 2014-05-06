<%@ page errorPage="/error/error.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Shakeosphere - Projects</title>
<style type="text/css" media="all">@import "resources/style.css";</style>
</head>
<body>
<div id="body">
<img src="images/banner1.png" id="topbannerlogo" />
<jsp:include page="menu.jsp" flush="true">
	<jsp:param name="caller" value="projects" />
</jsp:include>
<div id="center">
<h2>Related Projects</h2>
<p>
Shakeosphere has collaborated with and learned from the following partners, all of which are working in their own ways to 
map, visualize, and analyze early modern social networks. Please visit their sites to learn more: 
</p>
<p>
<a href="http://mapoflondon.uvic.ca/">The Map of Early Modern London, University of Victoria</a><br />
<a href="http://sixdegreesoffrancisbacon.com/">Six Degrees of Francis Bacon, Carnegie Mellon University and Georgetown</a><br />
<a href="https://www.grinnell.edu/users/leejamesj">The Global Renaissance</a><br />
</p>
<jsp:include page="footer.jsp" flush="true" />
</div>
</div>
</body>
</html>