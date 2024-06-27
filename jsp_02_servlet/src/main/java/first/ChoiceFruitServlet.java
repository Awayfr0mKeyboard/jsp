package first;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ChoiceFruitServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// ?fruits=apple.png&fruits=mango.png&fruits=rice.png
		// String fruit = request.getParameter("fruits");
		// 동일한 네임으로 전달된 파라미터 value 값을 문자열 배열로 반환
		String[] fruits = request.getParameterValues("fruits");
		System.out.println(Arrays.toString(fruits));
		
		response.setContentType("text/html;charset=UTF-8");
		// 파일 형식 지정은 출력하기 전에 지정
		
		// client 로 출력될 출력 스트림
		PrintWriter out = response.getWriter();
		
		if(fruits != null) {
			// 선택한 과일이 하나라도 존재할 때
			// fruits : [apple.png, mango.png]
			for(String fruit : fruits) {
				out.println("Choice Fruit : " + fruit + "<br/>");
				out.println("<img src='img/" + fruit + "'/> <br/>");
			}
		} else {
			// fruits 라는 name 으로 전달된 데이터가 존재하지 않음
			out.println("<script>");
			out.println("alert('선택된 과일이 없습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
		}
	}	// end doGet

}






