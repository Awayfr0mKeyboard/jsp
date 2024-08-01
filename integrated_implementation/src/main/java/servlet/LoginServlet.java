package servlet;

import java.io.*;
import java.sql.*;
import jakarta.servlet.http.*;

import VO.MemberVO;
import jakarta.servlet.ServletException;


public class LoginServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		
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
			
			MemberVO member = null;
			sql = "SELECT * FROM tbl_member WHERE id = ? AND pass = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.setString(2, pass);
				
				rs = pstmt.executeQuery();
				
				if (rs.next()) {
					member = new MemberVO();
					member.setNum(rs.getInt("num"));
					member.setId(rs.getString("id"));
					member.setPass(rs.getString("pass"));
					member.setName(rs.getString("name"));
					member.setAddr(rs.getString("phone"));
					member.setPhone(rs.getString("phone"));
					
					System.out.println(member.toString());
					
					HttpSession session = request.getSession();
					session.setAttribute("member", member);
					
					out.println("<script>window.location='main.jsp';</script>");
				} else {
					out.println("<script>window.location='login.jsp';</script>");
				}
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
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
		
	}	
	
}
