<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<c:if test="${empty uid}">
	<c:redirect url="index.jsp" />
</c:if>
<sql:update dataSource="jdbc/ESTCTagLib">
	update admin.session set finish=now() where (id,start) in (select id,last_login from admin.user where admin.user.id=?::int);
<sql:param>${user_id}</sql:param>
</sql:update>
<c:remove var="uid"/>
<c:remove var="user_id"/>
<c:remove var="is_admin"/>
<c:redirect url="index.jsp" />