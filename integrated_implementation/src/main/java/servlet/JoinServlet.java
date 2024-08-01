package servlet;

import VO.MemberVO;
import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.sql.*;

public class JoinServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		String name = request.getParameter("name");
		String addr = request.getParameter("addr");
		String phone = request.getParameter("phone");
		
		MemberVO member = new MemberVO();
		member.setId(id);
		member.setPass(pass);
		member.setName(name);
		member.setAddr(addr);
		member.setPhone(phone);
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			conn = DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/digital_jsp",
				"digital",
				"1234"
			);
			
			sql = "SELECT * FROM tbl_member WHERE id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getId());
	
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
                out.println("<script>alert('이미 존재하는 사용자 아이디입니다!'); window.location='main.jsp';</script>");
            } else {
                rs.close();
                pstmt.close();
                
                sql = "INSERT INTO tbl_member (num, id, pass, name, addr, phone) VALUES (NULL, ?, ?, ?, ?, ?)";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, member.getId());
                pstmt.setString(2, member.getPass());
                pstmt.setString(3, member.getName());
                pstmt.setString(4, member.getAddr());
                pstmt.setString(5, member.getPhone());
                pstmt.executeUpdate();
                
                out.println("<script>alert('회원가입 완료!'); window.location='main.jsp';</script>");
            }
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            } 
            
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
		
		System.out.println(member.toString());
	}

}
