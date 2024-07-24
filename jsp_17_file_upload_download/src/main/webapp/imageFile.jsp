<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	String id = request.getParameter("id");

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	conn = DriverManager.getConnection(
		"jdbc:mysql://localhost:3306/digital_jsp",
		"digital",
		"1234"
	);
	
	String sql = "SELECT * FROM test_image WHERE id = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	rs = pstmt.executeQuery();
	if(rs.next()) {
		String contentType = rs.getString("imageType");
		byte[] imageFile = rs.getBytes("imageFile");
		response.setContentType(contentType);
		response.getOutputStream().write(imageFile);
	}
	
%>