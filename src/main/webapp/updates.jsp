<%@ page errorPage="/error/error.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Shakeosphere - Updates</title>
<style type="text/css" media="all">@import "resources/style.css";</style>
<style type="text/css">

#center {
width: 455px;
}

#footer {
float: bottom;
}

#rightbar {
width: 225px;
float: right;
}

</style>
</head>

<body>
<div id="body">
<jsp:include page="header.jsp" flush="true" />
<jsp:include page="menu.jsp" flush="true">
	<jsp:param name="caller" value="index" />
</jsp:include>
<div id="rightbar">
<h4>Social Media: </h4>
<!--Code for official Twitter widget-->
<a class="twitter-timeline" height="300" width="200" href="https://twitter.com/Shakeosphere" data-widget-id="440549870751862784">Tweets by @Shakeosphere</a>
<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>
</div>
<div id="center">
<h2> News and Updates:
</h2>
<p id="date">
March 5, 2014
</p>
<p>
Shakeosphere now has a Twitter feed! Please feel free to follow along as more information about the project becomes available.
</p>
</div>

<div id="footer">
</div>
</div>
</body>
</html>