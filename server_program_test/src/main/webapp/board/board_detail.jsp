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
	    
	    String update = "UPDATE test_board SET board_readcount = board_readcount + 1 WHERE board_num = ?";
	    pstmt = conn.prepareStatement(update);
	    pstmt.setInt(1, Integer.parseInt(boardNum));
	    pstmt.executeUpdate();
	    
		if (rs.next()) {
	        int num = rs.getInt("board_num");
	        String name = rs.getString("board_name");
	        String title = rs.getString("board_title");
	        String content = rs.getString("board_content");
	%>
	<h1>게시물 상세내용</h1>
	<table>
		<tr>
			<td>작성자</td>
			<td><%= name %></td>
		</tr>
		<tr>
			<td>제목</td>
			<td><%= title %></td>
		</tr>
		<tr>
			<td>내용</td>
			<td>
				<textarea readonly cols=40 rows=10><%= content %></textarea>
			</td>
		</tr>
		<tr>
			<td colspan=2>
				<a href="board_update.jsp?num=<%=num%>">[수정]</a>
				<a href="board_delete.jsp">[삭제]</a>
				<a href="board_list.jsp">[목록]</a>
			</td>
		</tr>
	</table>
		<%
		}
		JDBCUtil.close(rs, pstmt, conn);	
		%>
</body>
</html>