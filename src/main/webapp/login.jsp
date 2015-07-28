<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="estc" uri="http://icts.uiowa.edu/ESTCTagLib"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:choose>
	<c:when test="${(empty uid or uid eq 'guest') and empty param.submit}">
		<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
		<html>
			<head>
			<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
			<title>Shakeosphere</title>
			<style type="text/css" media="all">
			@import "resources/style.css";
			</style>
			</head>
			<body>
				<div id="body">
					<jsp:include page="header.jsp" flush="true" />
					<jsp:include page="menu.jsp" flush="true">
						<jsp:param name="caller" value="person" />
					</jsp:include>
					<div id="center">
						<form action="login.jsp" method="post">
							<fieldset>
								<legend>Login</legend>
								<label for="uid">User ID:</label><br /> <input type="text"
									name="uid" size="20" value=""><br /> <label
									for="password">Password</label><br /> <input type="password"
									name="password" size="20" value=""><br /> <input
									type="submit" name="submit" value="Login"> <input
									type="submit" name="submit" value="Cancel">
							</fieldset>
						</form>
			
						<jsp:include page="footer.jsp" flush="true" />
					</div>
				</div>
			</body>
		</html>
	</c:when>
	<c:when test="${param.submit eq 'Cancel' }">
		<c:redirect url="index.jsp" />
	</c:when>
	<c:when test="${param.submit eq 'Login' }">
		<sql:query var="refresh" dataSource="jdbc/ESTCTagLib">
			select * from admin.user where handle = ? and password = ? and is_approved;
			<sql:param value="${param.uid}" />
			<sql:param value="${param.password}" />
		</sql:query>
		<c:forEach items="${refresh.rows}" var="row">
			<c:set var="uid" scope="session" value="${row.handle}" />
			<c:set var="user_id" scope="session" value="${row.id}" />
			<c:set var="is_admin" scope="session" value="${row.is_admin}" />
		</c:forEach>
		<c:if test="${empty uid }">
			<c:redirect url="login.jsp" />
		</c:if>
		<sql:update dataSource="jdbc/ESTCTagLib">
			update admin.user set last_login=now() where id=?::int;
			<sql:param>${user_id}</sql:param>
		</sql:update>
		<sql:update dataSource="jdbc/ESTCTagLib">
			insert into admin.session(id,start) select id,last_login from admin.user where id=?::int;
			<sql:param>${user_id}</sql:param>
		</sql:update>
		<c:redirect url="index.jsp" />
	</c:when>
	<c:otherwise>
		<c:redirect url="index.jsp" />
	</c:otherwise>
</c:choose>

