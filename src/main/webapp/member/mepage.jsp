<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../Home/common.jsp"%>
<%
// common.jsp로 이동시킴
// int twelve = 12; // 부트 스트랩 그리드 시스템
int myoffset = 2; // 옵셋
int mywidth = twelve - 2 * myoffset; // 센터 너비
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function updateForm(){
		location.href='<%=notWithFormTag%>meUpdate&id=${sessionScope.loginfo.id}';
	}
	function deleteForm(){
		location.href='<%=notWithFormTag%>meDelete&id=${sessionScope.loginfo.id}';
	}
</script>
</head>
<body>
	<div class="container col-sm-offset-<%=myoffset%> col-sm-<%=mywidth%>">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h4>회원 정보</h4>
				<button type="button" class="btn btn-default"
					onclick="updateForm();">회원 수정</button>
				<button type="button" class="btn btn-default"
					onclick="deleteForm();">회원 탈퇴</button>
			</div>
			<div class="panel-body">
				<div class="col-sm-12">
					<table class="table table-hover">
						<thead>
							<tr>
								<th>아이디</th>
								<th>이름</th>
								<th>가입 일자</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>${bean.id}</td>
								<td>${bean.name}</td>
								<td>${bean.hiredate}</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>