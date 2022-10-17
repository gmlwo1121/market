<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="./../Home/common.jsp"%>
<%
int myoffset = 2;// 옵셋
int mywidth = twelve - 2 * myoffset;//센터의 넓이

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
				<h4>회원 목록</h4>
			</div>
			<div class="panel-body">
				<div class="col-sm-12">
					<table class="table table-hover">
						<thead>
							<tr>
								<th>아이디</th>
								<th>이름</th>
								<th>가입일자</th>
								<th>적립 포인트</th>
								<th>비고</th>
							</tr>
						</thead>
					    <tbody>
					    	<c:forEach var="bean" items="${requestScope.lists}"></c:forEach>
					      	<tr>
						        <td>${bean.id}</td>
						        <td>${bean.name}</td>
						        <td>${bean.hiredate}</td>
						        <td>${bean.mpoint}</td>
						        <td>${bean.remark}</td>
					    	</tr>
					    </tbody>
					  </table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>