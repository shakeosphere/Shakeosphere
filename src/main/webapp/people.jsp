<%@ page errorPage="/error/error.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Shakeosphere - People</title>
<style type="text/css" media="all">@import "resources/style.css";</style>
<style type="text/css">
	strong {
		font-style: italic;
	}
</style>
</head>

<body>
<div id="body">
<jsp:include page="header.jsp" flush="true" />
<jsp:include page="menu.jsp" flush="true">
	<jsp:param name="caller" value="index" />
</jsp:include>
<div id="center">
<h2> People:
</h2>
<h4> Blaine Greteman
</h4>
<p>
Blaine Greteman an assistant professor of English at the University of Iowa. He specializes in the literature and culture of Shakespeare's England, 
and his research explores questions of subjectivity and agency, especially the way those questions are shaped by literature and the material production 
and transmission of texts.
<br />
<br />
Greteman has graduate degrees from the University of Oxford and the University of California, Berkeley. He contributes regularly to publications 
including <strong>TIME magazine</strong>, <strong>The New Republic</strong>, <strong>Times Higher Education</strong>, and <strong>The Optimist</strong>. 
His book, <strong>The Poetics and Politics of Youth in Milton's England</strong>, was published by Cambridge University Press in 2013.
</p>
<h4> David Eichmann
</h4>
<p>
David Eichmann is an associate professor and Director of the School of Library and Information Science at the University of Iowa. His research 
addresses a range of data-intensive issues, from named-entity extraction in the biomedical literature to video search and retrieval. Much of this 
work has required the engineering of information architectures to function on large-scale clusters backed by high-performance database engines.
<br />
<br />
Eichmann received his Ph.D. in Computer Science from The University of Iowa in 1989, with a dissertation in database theory. He has been on the 
faculty at Seattle University, West Virginia University and most recently at the University of Houston - Clear Lake, where he chaired the Software 
Engineering program and was Director of Research and Development for the NASA-funded Repository Based Software Engineering project. MORE, one of 
the systems developed as part of RBSE, received a NASA Group Achievement Award in 1998 from Johnson Space Center and was nominated in 1998 by JSC 
for the NASA Software of the Year Award.
</p>
</div>

<div id="footer">
</div>
</div>
</body>
</html>