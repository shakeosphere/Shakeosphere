<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<c:if test="${empty guid}">
	<c:set var="guid" value="guest" scope="session" />
</c:if>

<div id="leftCol"><br />
<h3><a href="index.jsp">Home</a></h3>
	<ul>
		<li><a href="about.jsp">About the Collaborative</a>
		<li><a href="membership.jsp">Membership</a>
	</ul>
<h3>Federated Search Systems</h3>
<ul>
	<li><a href="http://research.icts.uiowa.edu/polyglot">CTSAsearch</a>
	<li><a href="http://direct2experts.org">DIRECT2Experts</a>
</ul>
<h3>Profiling Systems</h3>
<ul>
	<li><a href="http://icts.uiowa.edu/Loki">Loki</a>
	<li><a href="http://profiles.catalyst.harvard.edu">Profiles</a>
	<li><a href="http://info.scival.com/pure/merge">SciVal Experts</a>
	<li><a href="http://vivoweb.org">VIVO</a>
</ul>
<h3>Admin</h3>
<ul>
	<li><a href="login.jsp">Login</a>
</ul>
</div>
<c:set var="menu.displayed">true</c:set>
