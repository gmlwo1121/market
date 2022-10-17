<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="./../Home/common.jsp"%>
<%
int myoffset = 3;// 옵셋
int mywidth = twelve - 2 * myoffset;//센터의 넓이
int formleft = 3; //왼족 라벨의 넓이
int formright = twelve - formleft;//오른쪽 입력란 넓이

//적은 수의 코딩은 하드코딩이 편하지만 양이많다면 변수로코딩하는게 차후 변경시에 편리
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container col-sm-offset-<%=myoffset%> col-sm-<%=mywidth%>">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h4>로그인</h4>
			</div>
			<div class="panel-body">

				<form class="form-horizontal" action="<%=notWithFormTag%>meLogin"
					method="post">
					<input type="hidden" name="command" value="melogin">
					<div class="form-group">
						<label class="control-label col-sm-<%=formleft%>" for="id">Id :</label>
						<!-- for 는 밑의 아이디와 연관 -->
						<div class="col-sm-<%=formright%>">
							<input type="text" class="form-control" id="id"
								placeholder="아이디 입력" name="id"
								data-toggle="tooltip" title="아이디는 4글자이상 10글자이하로 입력">
							<span class="err" id="errid"></span>
						</div>
					</div>

					<div class="form-group">
						<label class="control-label col-sm-<%=formleft%>" for="pwd">Password :</label>
						<div class="col-sm-<%=formright%>">
							<input type="password" class="form-control" id="password"
								placeholder="비밀번호 입력" name="password">
							<span class="err" id="errpassword"></span>
						</div>
					</div>

					<div class="form-group">
						<div class="col-sm-offset-3 col-sm-9">
							<button type="submit" class="btn btn-primary" onclick="return ValidCheck();">로그인</button>
							<a href="<%=notWithFormTag%>meInsert">회원가입</a>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script>
		$(document).ready(function() {
			$('[data-toggle="tooltip"]').tooltip({placement: "bottom"}); 
			//선택자 속성중에서 data-toggle 이가 tooltip인것 찾고.tooltip()함수 적용
		});
	</script>
</body>
</html>