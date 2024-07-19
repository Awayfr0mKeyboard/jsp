<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String boardNum = request.getParameter("num");
	
		Connection conn = JDBCUtil.getConnection();
		
		String sql = "SELECT board_num, board_name, board_title, board_content, board_readcount FROM test_board WHERE board_num = ?";
	    PreparedStatement pstmt = conn.prepareStatement(sql);
	    pstmt.setInt(1, Integer.parseInt(boardNum));
	    ResultSet rs = pstmt.executeQuery();
	    
	    if (rs.next()) {
	    	int num = rs.getInt("board_num");
            String name = rs.getString("board_name");
            String title = rs.getString("board_title");
            String content = rs.getString("board_content");
	%>
	<h1>게시물 수정</h1>
	<form action="board_update_submit.jsp" method="post">
		<input type="hidden" name="num" value="<%= boardNum %>">
		<table>
			<tr>
				<td>작성자</td>
				<td><input type="text" name="name" value="<%= name %>" /></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pass" required/></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" value="<%= title %>" /></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea rows=10 cols=40 ><%= content %></textarea></td>
			</tr>
	<%
		}
	    JDBCUtil.close(rs, pstmt, conn);
	%>
			<tr>
				<td colspan=2><input type="submit" value="수정완료"/></td>
			</tr>
		</table>
	</form>
</body>
</html>