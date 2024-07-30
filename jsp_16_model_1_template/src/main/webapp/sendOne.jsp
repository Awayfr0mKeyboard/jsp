<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="net.nurigo.sdk.message.service.DefaultMessageService" %>
<%@ page import="net.nurigo.sdk.NurigoApp" %>
<%@ page import="net.nurigo.sdk.message.model.Message"%>
<%@ page import="net.nurigo.sdk.message.request.SingleMessageSendingRequest"%>
<%@ page import="net.nurigo.sdk.message.response.SingleMessageSentResponse"%>
	
<%
	String u_phone = request.getParameter("u_phone");
	
	// sendOne.jsp
	DefaultMessageService messageService;
	// 반드시 계정 내 등록된 유효한 API 키, API Secret Key를 입력해주셔야 합니다!
	messageService = NurigoApp.INSTANCE.initialize(
			"NCSC1I2YIH95TCHK", 					// API Key
			"3CYRUC2HRA5JCPHAG71P9SFFH8IDUMX9", 	// API Secret Key
			"https://api.coolsms.co.kr");
	
	Message message = new Message();
    // 발신번호 및 수신번호는 반드시 01012345678 형태로 입력되어야 합니다.
    message.setFrom("01072719301");
    if (u_phone == null || u_phone.equals("")) {
	    // test 용 전화번호 - 금액차감 X
	    message.setTo("01000000000");    
    } else {
    	// 파라미터로 전달된 전화번호가 존재하면
    	message.setTo(u_phone);
    }
    // message.setText("한글 45자, 영자 90자 이하 입력되면 자동으로 SMS타입의 메시지가 추가됩니다.");
	message.setText("ㅎㅇ");
    
    SingleMessageSentResponse res = messageService.sendOne(
    		new SingleMessageSendingRequest(message)
    );
    System.out.println(res);
    
    // response 응답 객체를 이용해서 처리 상태 코드 전달
    response.getWriter().write(res.getStatusCode());
%>














