<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, util.*" %>
<!-- 게시글 수정 처리 -->



<!-- 게시글 수정 결과 처리 -->
		String boardNum = request.getParameter("num");
		String mPw = request.getParameter("pass");
		Connection conn = JDBCUtil.getConnection();
		
		String sql = "SELECT board_pass FROM test_board WHERE board_num = ?";
	    PreparedStatement pstmt = conn.prepareStatement(sql);
	    pstmt.setInt(1, Integer.parseInt(boardNum));
	    ResultSet rs = pstmt.executeQuery();

		JDBCUtil.close(rs, pstmt, conn);
	    
	    if (rs.next()) {
            String pass = rs.getString("board_pass");

            if (!mPw.equals(pass)) {
                out.println("<script>alert('비밀번호가 일치하지 않습니다.'); history.back();</script>");
                return;
            }
        }
	    
	    JDBCUtil.close(rs, pstmt, conn);
	





