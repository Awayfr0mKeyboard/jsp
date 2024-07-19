<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!-- 게시글 작성 완료 페이지     -->
<!-- 게시글 작성 요청 처리 -->
<%
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		// 처리 결과를 저장할 변수
		String resultMsg = "";
		
		try {
			// Driver class load
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/digital_jsp",		// 연결할 DB Server Schema
				"digital",										// 권한있는 계정 ID
				"1234"											// 비밀번호
			);
			out.println("DB 연결 완료 " + conn);
			
			String sql = "INSERT INTO test_board (board_name, board_pass, board_title, board_content) VALUES(?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, password);
			pstmt.setString(3, title);
			pstmt.setString(4, content);
			
			int result = pstmt.executeUpdate();
			
			resultMsg = (result > 0) ? "게시물 등록 성공" : "게시물 등록 실패";
			
		} catch (ClassNotFoundException e) {
			out.println("Driver Class를 찾을 수 없음 <br />");
		} catch (SQLException e) {
			// e.printStackTrace();
			out.println("DB 연결 정보 오류 <br />");
		} finally {
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
%>


<!-- 게시글 작성 결과 처리 -->
	<h2><%= resultMsg %></h2>
	<a href="board_list.jsp">방명록 목록 보기</a>







