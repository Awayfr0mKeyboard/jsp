<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.sql.*, util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>게시글 목록</h1>
	<a href="${path}/board/board_write.jsp">게시글 작성하러 가기</a>
	<table border=1>
		<tr>
			<th>글번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성시간</th>
			<th>조회수</th>
		</tr>
		<!-- 게시글 목록 -->
		<%
			Connection conn = JDBCUtil.getConnection();

            String sql = "SELECT board_num, board_title, board_name, board_date, board_readcount FROM test_board";
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				int num = rs.getInt("board_num");
				String title = rs.getString("board_title");
				String name = rs.getString("board_name");
				String date = rs.getString("board_date");
				int readCount = rs.getInt("board_readcount");
		%>
		<tr>
			<td> <%= num %> </td>
			<td> <a href="board_detail.jsp?num=<%=num%>"> <%= title %> </a></td>
			<td> <%= name %> </td>
			<td> <%= date %> </td>
			<td> <%= readCount %> </td>		
		</tr>
		<%
			}
			JDBCUtil.close(rs, stmt, conn);
		%>
		<tr>
		<%
			int pageCount = 10;
			int currentPage = 1;
			String paramPage = request.getParameter("page");
			if (paramPage != null) {
				currentPage = Integer.parseInt(paramPage);
			}
			int startRow = (currentPage - 1) * pageCount;
			
			conn = JDBCUtil.getConnection();
			
			sql = "SELECT board_num, board_title, board_name, board_date, board_readcount FROM test_board ORDER BY board_num DESC LIMIT ?, ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, pageCount);
			rs = pstmt.executeQuery();
			
			JDBCUtil.close(rs,pstmt,conn);
		%>
		<%
			// guestBook table 에 등록된 전체 행(게시물)의 개수
			sql = "SELECT count(*) FROM test_board";
			conn = JDBCUtil.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			// 전체 게시물 개수를 저장할 변수
			int totalCount = 0;
			if (rs.next()) {
				totalCount = rs.getInt(1);
			}
			JDBCUtil.close(rs, stmt, conn);
			
			int maxPage = (totalCount - 1) / pageCount + 1;		// 최대 페이지
			maxPage = (int)Math.ceil((double)totalCount / pageCount);
			
			int startPage = 0;		// 현재 요청 페이지에서 보여줄 시작 페이지 번호
			int endPage = 0;		// 현재 요청 페이지에서 보여줄 마지막 페이지 번호
			int displayPageNum = 5;	// 한 번에 보여줄 페이지 번호 개수
			
			startPage = (currentPage - 1) / displayPageNum * displayPageNum + 1; // 시작 페이지 
			endPage = startPage + (displayPageNum - 1); // 출력할 마지막 페이지 번호
			
			// endPage 가 maxPage 보다 크면 이동할 수 없는 페이지 번호가 출력
			if (endPage > maxPage) {
				endPage = maxPage;
			}
		%>
			<th>
				<!-- 사용자가 요청한 출력된 현재 페이지가 1페이지가 아니면 출력 -->
				<%if (currentPage != 1) { %>
					<a href="board_list.jsp?page=1">[처음]</a>
				<%} %>
				
				<%if (startPage != 1) { %>
					<a href="board_list.jsp?page=<%= startPage - 1%>">[이전]</a>
				<%} %>
				
				<!-- 이동 가능한 페이지 번호 출력 -->
				<%for (int i = startPage; i <= endPage; i++) { %>
					<a href="board_list.jsp?page=<%=i%>">[<%= i %>]</a>
				<%} %>
				
				<%if (endPage < maxPage) { %>
					<a href="board_list.jsp?page=<%= endPage + 1%>">[다음]</a>
				<%} %>
				
				<!-- 마지막 페이지 이동 -->
				<%if (currentPage < maxPage) { %>
					<a href="board_list.jsp?page=<%= maxPage%>">[마지막]</a>
				<%} %>
			</th>
		</tr>
	</table>
	<!-- 페이징 블럭 작성  -->
</body>
</html>