<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="estc" uri="http://icts.uiowa.edu/ESTCTagLib"%>

<estc:user ID="${param.uid}">
	<estc:userIsAdmin isAdmin="${not tag_user.isAdmin}"/>
</estc:user>
<c:redirect url="user.jsp">
	<c:param name="uid">${param.uid}</c:param>
</c:redirect>
