<%@ page errorPage="/error/error.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Shakeosphere - About</title>
<style type="text/css" media="all">@import "resources/style.css";</style>
</head>
<body>

<div id="body">
<jsp:include page="header.jsp" flush="true" />
<jsp:include page="menu.jsp" flush="true">
	<jsp:param name="caller" value="about" />
</jsp:include>
<div id="center">
<h2> About Shakeosphere:
</h2>
<p >
Shakeosphere is a digital research and teaching tool that allows users to search, analyze, and contribute to a visualization 
of the early modern print and manuscript network. Read on to learn more about our goals, our data sources, and our 
technology.  
<br />
<br />
Goals:
Currently, students and researchers can search a database like the English Short Title Catalogue (ESTC) or Early Modern Letters Online (EMLO) 
for specific resources and authors. It is easy to find a play by Shakespeare or a letter by Samuel Hartlib, especially if the researcher already 
knows what they want to find. It remains impossible, though, to see how such a letter or play connects its author not simply to its immediate 
recipient or publisher but to a much broader communications network. For scholars interested in early modern information networks, this is a 
severe limitation, and Shakeosphere aims to act as a union catalogue to bring this data together, refine it, and make it possible to navigate 
and study in new ways. By creating tools to visualize and analyze this data as a network, we can offer an entirely new way of seeing and 
understanding the social world that gave us the works of Shakespeare and his contemporaries.
<br />
<br />
The implications for the study of literature and history are both profound and profoundly unrealized. In the field of literary study, authorship, 
influence, and context are all typically defined strictly in terms of the local and the synchronic. To learn about an author's work, the theory 
goes, you find out where she went to church, who lived in her neighborhood, and who were her most intimate friends and family members. The most 
prominent example of this form of fine-grained historical scholarship is perhaps Jim Shapiro's 1599: A Year in the Life of William Shakespeare. 
Network theory inverts this model completely. To understand where an author gets new ideas, and how he communicates those ideas powerfully and 
influentially, network theory suggests we need to understand not close personal attachments but weak ties - the distant, and sometimes fleeting 
connections we establish when we send a letter, hire a printer, or contract with a publisher. Shakeosphere will allow us to see those weak ties 
more clearly than ever before.
<br />
<br />
Data Sources:
Shakeosphere currently contains the metadata for the entire 487,000 records of the English Short Title Catalogue (ESTC), which records every book 
printed in England from 1473-1800 (with the exception of engraved books). Printed books, however, were only one small part of the way early modern 
people communicated and spread their ideas. Handwritten materials, from letters to elaborate manuscripts, also played an important role in early 
modern culture, and we will soon incorporate manuscript records from library catalogues at Harvard and Oxford's Bodleian library. Eventually we 
hope to expand our collaboration to include data collected from libraries around the world by the Oxford-based Early Modern Letters Online (EMLO). 
In a second phase of the project, we will include data mined from full-text sources, including Early English Books Online (EEBO). One of our first 
challenges is bringing together multiple catalogues that use a variety of different data formats and conventions, including so far, MARC, MARC-XML 
and RDF.
<br />
<br />
Technologies:
We are using the D3.js Javascript library to build an interface that will allow users to produce and manipulate visualizations. We use the 
relational database PostgreSQL as our primary data management tool. 
</p>
<jsp:include page="footer.jsp" flush="true" />
</div>
</div>
</body>
</html>