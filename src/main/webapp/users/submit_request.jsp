<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="estc" uri="http://icts.uiowa.edu/ESTCTagLib"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>
<%@ taglib prefix="mail" uri="http://slis.uiowa.edu/mailtaglib"%>
<c:choose>
	<c:when test="${empty param.submit}">
		<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
		<html>
		<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Shakeosphere</title>
		<style type="text/css" media="all">
		@import "../resources/style.css";
		</style>
		</head>
		<body>
			<div id="body">
				<jsp:include page="../header.jsp" flush="true" />
				<jsp:include page="../menu.jsp" flush="true">
					<jsp:param name="caller" value="admin" />
				</jsp:include>
				<div id="center">
					<form action="submit_request.jsp" method="post">
						<fieldset>
							<legend>Request a Login</legend>
							<label for="uid">User ID:</label><br /> <input type="text" name="uid" size="20" value=""><br />
							<label for="password">Password</label><br /> <input type="password" name="password" size="20" value=""><br />
							<label for="first_name">First Name:</label><br /> <input type="text" name="first_name" size="30" value=""><br />
							<label for="last_name">Last Name:</label><br /> <input type="text" name="last_name" size="30" value=""><br />
							<label for="email">Email:</label><br /> <input type="text" name="email" size="30" value=""><br />
							<input type="submit" name="submit" value=Submit>
							<input type="submit" name="submit" value="Cancel">
						</fieldset>
					</form>
					<jsp:include page="../footer.jsp" flush="true" />
				</div>
			</div>
		</body>
	</c:when>
	<c:when test="${param.submit == 'Cancel'}">
		<c:redirect url="<util:applicationRoot/>/annotation.jsp" />
	</c:when>
	<c:when test="${param.submit == 'Submit'}">
		<estc:user>
			<estc:userHandle handle="${param.uid}" />
			<estc:userPassword password="${param.password}" />
			<estc:userFirstName firstName="${param.first_name}" />
			<estc:userLastName lastName="${param.last_name}"  />
			<estc:userEmail email="${param.email}" />
			<estc:userCreatedToNow/>
			<estc:userIsAdmin isAdmin="${false}" />
			<estc:userIsApproved isApproved="${false}" />
		</estc:user>
		<mail:message host="ns-mx.uiowa.edu">
			<mail:fromAddress name="David Eichmann" address="david-eichmann@uiowa.edu"/>
			<mail:recipientAddress name="David Eichmann" address="david-eichmann@uiowa.edu"/>
			<mail:recipientAddress name="Blaine Greteman" address="blaine-greteman@uiowa.edu"/>
			<mail:subject>Shakeosphere user request: ${param.last_name}, ${param.first_name}</mail:subject>
			<mail:htmlBody>
				<h2>New User Request</h2>
				<table>
					<tr><th align=left>ID</th><td>${param.uid}</td></tr>
					<tr><th align=left>User Name</th><td>${param.last_name}, ${param.first_name}</td></tr>
					<tr><th align=left>Email</th><td>${param.email}</td></tr>
				</table>
			</mail:htmlBody>
		</mail:message>
		<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
		<html>
		<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Shakeosphere</title>
		<style type="text/css" media="all">
		@import "../resources/style.css";
		</style>
		</head>
		<body>
			<div id="body">
				<jsp:include page="../header.jsp" flush="true" />
				<jsp:include page="../menu.jsp" flush="true">
					<jsp:param name="caller" value="admin" />
				</jsp:include>
				<div id="center">
					Thank you for submitting an account request for Shakeosphere.  You will receive an email acknowledgement
					when your account has been activated.
					<jsp:include page="../footer.jsp" flush="true" />
				</div>
			</div>
		</body>
	</c:when>
	<c:otherwise>
		A task is required for this function.
	</c:otherwise>
</c:choose>


