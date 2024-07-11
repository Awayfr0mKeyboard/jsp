<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!-- index.jsp -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Action Tag include</title>
<style type="text/css">
	table{
		width:900px;
		margin:0 auto;
		text-align:center;
		border:1px solid black;
	}
	
	table tr td:first-child{
		border-right:1px solid gray;	
	}
</style>
</head>
<body>
	<table>
		<tr>
			<th colspan="2" height="150"> 
				<h1>HEADER</h1>
				<hr/>
			</th>
		</tr>
		<tr>
			<td>
				<aside>
					<ul>
						<li><a href="">HOME</a></li>
						<li><a href="">회사소개</a></li>
						<li><a href="">회원가입</a></li>
					</ul>
				</aside>
			</td>
			<td width="790">
				<!-- content -->
			</td>
		</tr>
		<tr>
			<th colspan="2" height="150"> 
				<hr/>
				<center>
					Copyright &copy; 2024.
				</center>
			</th>
		</tr>
	</table>
</body>
</html>




