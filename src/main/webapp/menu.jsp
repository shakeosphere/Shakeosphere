<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<c:if test="${empty guid}">
	<c:set var="guid" value="guest" scope="session" />
</c:if>

<div id="sidebar">
<ul>
<li> <a href="index.jsp">Home</a></li>
<li> <a href="publicationCount.jsp">Explore the Data</a>
<c:if test="${param.caller == 'visualization'}">
	<ul>
		<li> <a href="publicationCount.jsp">Publication Frequency</a>
	</ul>
</c:if></li>
<li> <a href="about.jsp">About</a></li>
<li> <a href="updates.jsp">Updates</a></li>
<li> <a href="grants.jsp">Grants and Support</a></li>
<li> <a href="people.jsp">People</a></li>
<li> <a href="projects.jsp">Related Projects</a></li>
</ul>
</div>

<c:set var="menu.displayed">true</c:set>
