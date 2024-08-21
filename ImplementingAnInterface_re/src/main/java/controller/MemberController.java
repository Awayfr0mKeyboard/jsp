package controller;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(".mc")
public class MemberController extends HttpServlet{

	private static final long serialVersionUID = 7807099506362753862L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length() + 1);
		
		String nextPage = null;
		
		if (command.equals("login.mc")) {
			nextPage = "/member/login.jsp";
		} else if (command.equals("join.mc")) {
			nextPage = "/member/join.jsp";
		}
		
		if (nextPage != null) {
			RequestDispatcher rd = request.getRequestDispatcher(nextPage);
			rd.forward(request, response);
		}
	}

}
