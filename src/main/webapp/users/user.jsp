<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="estc" uri="http://icts.uiowa.edu/ESTCTagLib"%>


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
			<estc:user ID="${param.uid}">
				<h2>
					User:
					<estc:userFirstName />
					<estc:userLastName />
				</h2>
				<table>
					<tbody>
						<tr>
							<th align=left>ID</th>
							<td><estc:userID /></td>
						</tr>
						<tr>
							<th align=left>User Name</th>
							<td><estc:userHandle /></td>
						</tr>
						<tr>
							<th align=left>First Name</th>
							<td><estc:userFirstName /></td>
						</tr>
						<tr>
							<th align=left>Last Name</th>
							<td><estc:userLastName /></td>
						</tr>
						<tr>
							<th align=left>Email</th>
							<td><estc:userEmail /></td>
						</tr>
						<tr>
							<th align=left>Is Approved</th>
							<td><estc:userIsApproved /></td>
							<td>[<a href="toggle_approved.jsp?uid=${param.uid}">toggle</a>]</td>
						</tr>
						<tr>
							<th align=left>Is Administrator</th>
							<td><estc:userIsAdmin /></td>
							<td>[<a href="toggle_admin.jsp?uid=${param.uid}">toggle</a>]</td>
						</tr>
						<tr>
							<th align=left>Date Created</th>
							<td><estc:userCreated /></td>
						</tr>
						<tr>
							<th align=left>Last Login Date</th>
							<td><estc:userLastLogin /></td>
						</tr>
					</tbody>
				</table>
				<h2>Sessions</h2>
				<table>
					<tr><th align=left>Start</th><th align=left>Finish</th></tr>
					<sql:query var="session" dataSource="jdbc/ESTCTagLib">
						select start,finish from admin.session where id= ?::int order by 1 desc;
						<sql:param>${param.uid}</sql:param>
					</sql:query>
					<c:forEach items="${session.rows}" var="row"
						varStatus="rowCounter">
						<tr>
							<td>${row.start}</td>
							<td>${row.finish}</td>
						</tr>
					</c:forEach>
				</table>
			</estc:user>
			<jsp:include page="../footer.jsp" flush="true" />
		</div>
	</div>
</body>