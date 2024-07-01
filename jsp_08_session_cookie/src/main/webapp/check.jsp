<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!-- check.jsp -->

<%
	// 브라우저에서는 요청을 전달할 때마다 해당 사이트에 등록된 쿠기 정보(목록)을 전달
	// 쿠키는 요청 정보인 request에 가공처리되어서 전달됨.
	
	Cookie[] cookies = request.getCookies();
	if(cookies != null) {
		
		for(Cookie c : cookies) {
			String name = c.getName();			// Key
			String value = c.getValue();		// Value
			out.println(name + " : " + value + "<br/>");
		}
	} else {
		out.println("<h2>등록된 쿠키가 없습니다.</h2>");
	}
	
%>