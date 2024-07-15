<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
<s:setDataSource var="conn"
	driver="com.mysql.cj.jdbc.Driver" 
	url="jdbc:mysql://localhost:3306/digital_jsp"
	user="digital"
	password="1234" />

<s:query var="rs" dataSource="${conn}"
		sql = "SELECT * FROM test_member ORDER BY num DESC"/>
		
<%--
<s:query var="rs" dataSource="${conn}">
		"SELECT * FROM test_member ORDER BY num DESC"
</s:query>
--%>

<!-- rs.rowCount : 검색된 행의 개수 -->
<c:choose>
	<c:when test="${rs.rowCount > 0}">
		<h2>등록된 회원정보가 존재함 - ${rs.rowCount}</h2>
	</c:when>
	<c:otherwise>
		<h2>검색된 정보가 없습니다.</h2>
	</c:otherwise>
</c:choose>

</body>
</html>