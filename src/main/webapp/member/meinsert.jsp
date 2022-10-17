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
<style type="text/css">
	#idcheck {
		margin-left: -20px;
	}
</style>
<script type="text/javascript">
	function setFalseChecked() {
		$('#isCheck').val(false);//사용자가 아이디변경을 시도함.따라서  중복체크를 다시함
	}
	function ValidCheck() {
		var isCheck = $('#isCheck').val();
		is(isCheck == 'false'){
			alert('아이디 종복 체크를 우선 해주세요.');
			return false;
		}
		
		$('err').each(function() {
			$(this).text('');
		});
		
		var name = $('#name').val();/*읽기*/
		if(name.length < 2 || name.lenth >10){
			$('#errname').text('아이디는 4글자이상 10글자 이하여야함니다')/*읽기*/
			$('#name').focus();/*누구누구에게 폭커스를 준다*/
			return false;//이벤트 방지
		}
		
		var password = $('#password').val();
		if(password.length < 5 || password.lenth >30){
			$('#errpassword').text('비번은는 5글자이상 30글자 이하여야함니다')/*읽기*/
			$('#password').focus();/*누구누구에게 폭커스를 준다*/
			return false;//이벤트 방지
		}
		return true;
	
	}
	
	$(document).ready(function(){
		$("#idcheck").click(function(){
			var id = $("#id").val();
			if(id.length < 4){
				alert('아이디는 최소 4자리 이상이여햐함니다');
				$('#id').focus();
				return false;
			}else{
				$.ajax({
					url: "<%=notWithFormTag%>meIdcheck",
					data: "id="+id,
					type: "post",
					dataType: "jason",
					success: function(result){
					   	$("#isCheck").val(result.isCheck);
					   	
					   	/*중복 체크 결과를 보여주는 태그*/
					   	$(".idCheckResult").html(result.message);
					}
				});
			}
		});
	});
</script>
</head>
<body>
	<div class="container col-sm-offset-<%=myoffset%> col-sm-<%=mywidth%>">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h4>회원 가입</h4>
			</div>
			<div class="panel-body">

				<form class="form-horizontal" action="<%=withFormTag%>"
					method="post">
					
					<input type="hidden" name="command" value="meInsert"> <input
						type="text" name="isCheck" id="isCheck" value="false">

					<div class="form-group">
						<label class="control-label col-sm-<%=formleft%>" for="id">Id
							:</label>
						<!-- for 는 밑의 아이디와 연관 -->
						<div class="col-sm-<%=formright - 2%>">
							<input type="text" class="form-control" id="id"
								placeholder="아이디 입력" name="id" data-toggle="tooltip"
								title="아이디는 4글자이상 10글자이하로 입력"> 
								<span class="idCheckResult"></span>
						</div>
						<div class=" col-sm-<%=1%>">
							<button type="button" id="idcheck" class="btn btn-primary">중복체크</button>
						</div>
					</div>

					<div class="form-group">
						<label class="control-label col-sm-<%=formleft%>" for="id">name
							:</label>
						<div class="col-sm-<%=formright%>">
							<input type="text" class="form-control" id="name"
								placeholder="이름 입력" name="name"> <span class="err" id="errname"></span>
						</div>
					</div>

					<div class="form-group">
						<label class="control-label col-sm-<%=formleft%>" for="pwd">Password
							:</label>
						<div class="col-sm-<%=formright%>">
							<input type="password" class="form-control" id="password"
								placeholder="비밀번호 입력" name="password"> <span class="err"
								id="errpassword"></span>
						</div>
					</div>

					<div class="form-group">
						<div class="col-sm-offset-3 col-sm-9">
							<button type="submit" class="btn btn-primary"
								onclick="return ValidCheck()">회원가입</button>
							&nbsp;&nbsp;&nbsp;
							<button type="button" class="btn btn-default"
								onclick="history.back();">취소</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>