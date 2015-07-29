<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="estc" uri="http://icts.uiowa.edu/ESTCTagLib"%>

<<sql:update dataSource="jdbc/ESTCTagLib">
	update navigation.person_base set gender_female = not gender_female where first_name=?;
	<sql:param>${param.first_name}</sql:param>
</sql:update>
<c:redirect url="female_persons.jsp">
</c:redirect>
