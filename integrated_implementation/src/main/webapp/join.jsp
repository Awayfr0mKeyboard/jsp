<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="common/header.jsp" %>
<section>
	<form name="joinForm" action="${pageContext.request.contextPath}/JoinServlet" method="post">
		<table class="join">
			<tr>
				<th colspan="2"><h1>회원가입</h1></th>
			</tr>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="id" alt="아이디"/></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pass" alt="비밀번호"/></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" alt="이름"/></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="addr" alt="주소" /></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input type="text" name="phone" alt="전화번호" /></td>
			</tr>
			<tr>
				<td colspan=2><input type="submit" id="acceptBtn" value="회원가입" /></td>
			</tr>
		</table>
	</form>
</section>
<%@ include file="common/footer.jsp" %>


<script>
	document.querySelector("#acceptBtn").onclick = function () {
		if(document.querySelector('input[type="text"]').value == "" || document.querySelector('input[type="password"]').value == "") {
			alert("빈 칸을 입력해주세요.");
		}
	};
</script>