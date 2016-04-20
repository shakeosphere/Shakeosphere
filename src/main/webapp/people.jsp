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
	<jsp:param name="caller" value="people" />
</jsp:include>
<div id="center">
<h2> People:
</h2>
<h4> Blaine Greteman
</h4>
<p>
Blaine Greteman is an assistant professor of English at the University of Iowa. He specializes in the literature and culture of Shakespeare's England, 
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
David Eichmann is Director and Associate Professor in the School of Library and Information Science at the University of Iowa and
Interim Director of Information Science in the Iowa Graduate Program in Informatics.  He co-chairs the Research Networking Collaborative
(previously known as the Research Networking Affinity Group in the Clinical and Translational Science Award Consortium).  He was Director
of Biomedical Informatics in the Institute for Clinical and Translational Science from 2006 to 2012.  Prior to returning to Iowa, he chaired
the Software Engineering Program at the University of Houston - Clear Lake, where he was also Director of Research and Development for the
NASA-funded Repository-Based Software Engineering project. His RBSE team developed the MORE repository system, which received a NASA Group
Achievement Award in 1998 from Johnson Space Center and was nominated in 1998 by JSC for the NASA Software of the Year Award. His current
research interests involve exploring the boundaries between traditional approaches to research data warehousing, information retrieval and
extraction, and semantic web technologies.
</p>
<br>
<hr>
<h2>Project Alums</h2>
<h4> Charisse Madlock-Brown </h4>
<p>Charisse Madlock-Brown is a PhD candidate in Health Informatics, with a background in library and information science. Her research area
is scientometrics with a focus on bio-medicine. As a teen she attended the Educational Center for the Arts in New Haven, CT, studying creative
writing, and planned to peruse a career as a writer. At Bard College at Simon's Rock she studied inter-cultural relations drawing upon political
science and anthropology. Having long since resigned to the fact that her passion and talents reside in analytics and not the arts, she is very
excited to be a part of Shakeosphere. 
</p>
<h4> Christine M. Vivian </h4>
<p>Christine M. Vivian was a graduate student in the School of Library and Information Science. She first learned to program 
as a young child, an interest that was rekindled in graduate school, where she gained familiarity with several computer 
languages. With a B.A. in English from Augustana College and her graduate work in Library and Information Science, she feels 
at home in the digital humanities where she can combine her interests to help facilitate the creation of new knowledge and 
new understandings. Her research focuses on conceptions of literacy and learning and the role of digital humanities in that 
process.
</p>
<h4>Katie E. Wetzel</h4>
<p>Katie E. Wetzel is a PhD candidate in the Iowa Department of English. She received her BA and MA at the University of Kansas.
She studies the relationship between Victorian reform movements and the history of science, and her dissertation explores
displacement narratives in the late-Victorian metropole. Katie began her work on Shakeosphere during its initial phase;
she spent most of her time buried in letters and entering publication and correspondence data into spreadsheets.
Seeing this project move from bound collections and manuscripts to metadata inspired Katie to pursue various digital humanities
projects to enhance both her teaching and her research.
</p>
<jsp:include page="footer.jsp" flush="true" />
</div>
</div>
</body>
</html>