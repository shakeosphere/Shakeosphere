<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="estc" uri="http://icts.uiowa.edu/ESTCTagLib"%>
<%@ taglib prefix="mail" uri="http://slis.uiowa.edu/mailtaglib"%>

<estc:user ID="${param.uid}">
	<estc:userIsApproved isApproved="${not tag_user.isApproved}" />
</estc:user>
<estc:user ID="${param.uid}">
	<mail:message host="ns-mx.uiowa.edu">
		<mail:fromAddress name="David Eichmann"	address="david-eichmann@uiowa.edu" />
		<mail:recipientAddress address="${tag_user.email}" />
		<mail:ccAddress name="Blaine Greteman"	address="blaine-greteman@uiowa.edu" />
		<mail:bccAddress name="David Eichmann"	address="david-eichmann@uiowa.edu" />
		<mail:subject>Shakeosphere user <c:choose><c:when test="${tag_user.isApproved}">enabled</c:when><c:otherwise>disabled</c:otherwise></c:choose>: ${tag_user.handle}</mail:subject>
		<mail:htmlBody>
			<c:choose>
				<c:when test="${tag_user.isApproved}">
					<p>Congratulations!  Your <a href="http://shakeosphere.lib.uiowa.edu"></a>Shakeosphere</a> account had been enabled and is ready for use.</p>
				</c:when>
				<c:otherwise>
					<p>Your <a href="http://shakeosphere.lib.uiowa.edu"></a>Shakeosphere</a> account has been disabled.</p>
				</c:otherwise>
			</c:choose>
			<table>
				<tr><th align=left>User ID</th><td>${tag_user.handle}</td></tr>
				<tr><th align=left>User Name</th><td>${tag_user.lastName}, ${tag_user.firstName}</td></tr>
				<tr><th align=left>Email</th><td>${tag_user.email}</td></tr>
			</table>
		</mail:htmlBody>
	</mail:message>
</estc:user>
<c:redirect url="user.jsp">
	<c:param name="uid">${param.uid}</c:param>
</c:redirect>
