<%@ page errorPage="/error/error.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Shakeosphere - Grants</title>
<style type="text/css" media="all">@import "resources/style.css";</style>
</head>
<body>
<div id="body">
<jsp:include page="header.jsp" flush="true" />
<jsp:include page="menu.jsp" flush="true">
	<jsp:param name="caller" value="index" />
</jsp:include>
<div id="center">
<h2>Grants</h2>
<p>
Shakeosphere has received funding  from the University of Iowa, Office of the Vice President for Research and Economic 
Development and the <a href="http://thestudio.uiowa.edu/wp">Digital Studio for the Public Humanities</a>
</p>
<img src="images/Studio_websitelogo.png" />
<jsp:include page="footer.jsp" flush="true" />
</div>
</div>
</body>
</html>