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
	<jsp:param name="caller" value="person" />
</jsp:include>
<div id="center">
<h2>Welcome to Shakeosphere's annotation interface!</h2>
<p> The people in the English Short Title Catalog are named in the data in a multitude of variant spellings, abbreviations -
you name it and someone probably appears that way! (Don't even get us started on VV and W...)  We have created an interface
for you our users to help us in teasing out who's who in all of this.  There are currently xxxx people identified in the publisher
field who have not been connected to an authority record.  Click on the "Identify People" link in the menu on the left to
create new authority records or bind names to an existing authority record.
</p>
<jsp:include page="footer.jsp" flush="true" />
</div>
</div>
</body>
