<%@ page errorPage="/error/error.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Shakeosphere - Contact</title>
<style type="text/css" media="all">@import "resources/style.css";</style>
</head>
<body>
<div id="body">
<jsp:include page="header.jsp" flush="true" />
<jsp:include page="menu.jsp" flush="true">
	<jsp:param name="caller" value="index" />
</jsp:include>
<div id="center">
<h2>Contact</h2>
<p>
<a href="mailto:blaine-greteman@uiowa.edu" target="_top">blaine-greteman@uiowa.edu</a> or tweet to us <a href="https://twitter.com/shakeosphere">@Shakeosphere</a>
</p>
<jsp:include page="footer.jsp" flush="true" />
</div>
</div>
</body>
</html>