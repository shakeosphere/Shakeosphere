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
<div id="header">
<img src="images/banner1.png" id="topbannerlogo" />
</div>
<jsp:include page="menu.jsp" flush="true">
	<jsp:param name="caller" value="projects" />
</jsp:include>
<h2>Projects</h2>
<p>
Links to related projects coming soon.
</p>
</body>
</html>