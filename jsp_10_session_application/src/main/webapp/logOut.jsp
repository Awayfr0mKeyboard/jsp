<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<% 
	session.removeAttribute("loginMember");
	// session.invalidate();
%>
<script>
	alert("로그아웃 완료");
	location.href='main.jsp';
</script>