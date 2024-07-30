<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
	<button id="balance">get-balance</button>
	<button id="sendOne">send-one</button>
	<input type="text" id="phone" />
</div>
<script>
	document.querySelector("#balance").onclick = function() {
		location.href = "getBalance.jsp";
	};
	
	document.querySelector("#sendOne").onclick = function() {
		let u_phone = document.querySelector("#phone").value;
		
		// fetch("요청 URL",{optional});
		// {method : 전송 방식, body : 전달 파라미터}
		// new URLSearchParams();
		// 매개변수로 전달된 자바스크립트 Object 를 URL 파라미터 형식으로 변경
		// ex) ?u_phone=01072719301
		
		fetch("sendOne.jsp",{
			method : "POST",
			body : new URLSearchParams({u_phone : u_phone})
		// }).then(res => res.json())  밑에게 풀어 쓴 형식임
		}).then(function(res){
			return res.json();
		})
		// .then(data => console.log(data))
		.then(function(data) {
			if(data == 2000) {
				alert("메세지 발신 요청 완료");
			} else {
				alert("메세지 발신 요청 실패");
			}
		})
		.catch(error => {
			console.log(error);
			alert("메세지 발신에 오류가 있습니다.");
		});
		
	};
</script>
</body>
</html>










