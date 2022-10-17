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
				<h4>회원 상세페이지</h4>
			</div>
			<div class="panel-body">
				<div class="col-sm-12">
					<table class="table table-hover">
					    <tbody>
					      <tr>
					        <td>아이디</td>
					        <td>${bean.id}</td>
					      </tr>
					      <tr>
					        <td>이름</td>
					        <td>${bean.name}</td>
					      </tr>
					      <tr>
					        <td>가입일자</td>
					        <td>${bean.hiredate}</td>
					      </tr>
					      <tr>
					        <td>적립 포인트</td>
					        <td>${bean.mpoint}</td>
					      </tr>
					      <tr>
					        <td>비고</td>
					        <td>${bean.remark}</td>
					      </tr>
					      
					    </tbody>
					  </table>
				</div>
			</div>
			<hr/>
			<div class="col-sm-offset-5 col-sm-4">
				<button type="button" class="btn btn-primary" onclick="history.back();">돌아가기</button>
			</div>
		</div>
	</div>
</body>
</html>