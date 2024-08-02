package controller;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.MemberService;
import service.MemberServiceImpl;
import service.NoticeService;
import service.NoticeServiceImpl;

@WebServlet("*.do")
public class NoticeController extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length());
		System.out.println("command : " + command);
		
		String nextPage = null;
		
		boolean isSuccess = false;
		
		// 요청 처리 성공시 보여줄 화면
		String suc = "/board/notice/notice_success.jsp";
		// 요청 처리 실패 시 보여줄 화면
		String fail = "/board/notice/notice_fail.jsp";
		
		if(command.equals("/notice.do")) {
			nextPage = "board/notice/notice_list.jsp";
		}
		
		if(command.equals("/noticeWriteForm.do")) {
			nextPage = "board/notice/notice_write.jsp";
		}
		
		// 페이지 이동 Dispatcher
		if(nextPage != null) {
			RequestDispatcher rd = request.getRequestDispatcher(nextPage);
			rd.forward(request, response);
		}
		

		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	}
}
