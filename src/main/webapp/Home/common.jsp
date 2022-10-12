<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%	
	//공용 변수 정의 contextPath, mappingName, withFormTag, notWithFormTag
	
	String contextPath = request.getContextPath();
	String mappingName = "/market" ;//in FrontController.java file
	
	String withFormTag = contextPath + mappingName;
	String notWithFormTag = contextPath + mappingName + "?command=";
	
	
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- 로그인이되었다면 session 영역에 loginfo 라는 이름으로 바인딩되어있다 -->
<!-- whologin : 0(미로그인) ,1(일반 사용자) ,2(관리자) -->
<c:set var="whologin" value="0"/>
<c:if test="${not empty sessionScope.loginfo}">
	<c:if test="${sessionScope.loginfo.id == 'admin'}">
		<c:set var="whologin" value="2"/>
	</c:if>
	<c:if test="${sessionScope.loginfo.id != 'admin'}">
		<c:set var="whologin" value="1"/>
	</c:if>
</c:if>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	${applicationScope.uploadedPath}
<%-- 	${requestScope.lists} --%>
	<nav class="navbar navbar-inverse">
	  <div class="container-fluid">
	    <div class="navbar-header">
	      <a class="navbar-brand" href="#">아시다시피</a>
	    </div>
	    <ul class="nav navbar-nav">
	      <li class="active"><a href="<%=notWithFormTag%>home">Home</a></li>
	      
	      <li>
		      <a href="#" class="d">
		      	<font color="white">
		      		<c:if test="${whologin == 0}">
		        		미로그인
		        	</c:if>
		        	<c:if test="${whologin != 0}">
		        		${sessionScope.loginfo.name}(${sessionScope.loginfo.id})님
		        	</c:if>
		      	</font>
		      </a>
	      </li>
	      
	      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">회원<span class="caret"></span></a>
	        <ul class="dropdown-menu">
	        	<c:if test="${whologin == 0}">
	        		<li><a href="<%=notWithFormTag%>melogin">로그인</a></li>
	        		<li><a href="<%=notWithFormTag%>meinsert">회원가입</a></li>
	        	</c:if>
	        	<c:if test="${whologin != 0}">
	        		<li><a href="<%=notWithFormTag%>melogout">로그아웃</a></li>
	        		<li><a href="<%=notWithFormTag%>meupdate&id=${sessionScope.loginfo.id}">회원정보수정</a></li>
	        	</c:if>
	        	<c:if test="${whologin == 1}">
	        		<li><a href="<%=notWithFormTag%>medelete&id=${sessionScope.loginfo.id}">회원탈퇴</a></li>
	        		<li><a href="<%=notWithFormTag%>medetail&id=${sessionScope.loginfo.id}">상세보기</a></li>
	        	</c:if>
	        	<c:if test="${whologin == 2}">
	        		<li><a href="<%=notWithFormTag%>melist">목록보기</a></li>
	        	</c:if>
	        </ul>
	      </li>
	      <!-- 게시물 세션 -->
	      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">게시물<span class="caret"></span></a>
	        <ul class="dropdown-menu">
	        	<c:if test="${whologin != 0}">
	        		<li><a href="<%=notWithFormTag%>boinsert">게시물 등록</a></li>
	        		<li><a href="<%=notWithFormTag%>bolist">목록보기</a></li>
	        	</c:if>
	        </ul>
	      </li>
	      <!-- 상품 세션 -->
	      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">상품<span class="caret"></span></a>
	        <ul class="dropdown-menu">
	        	<c:if test="${whologin == 2}">
	        		<li><a href="<%=notWithFormTag%>prinsert">상품 등록</a></li>
	        	</c:if>
	        	<li><a href="<%=notWithFormTag%>prlist">목록보기</a></li>
	        </ul>
	      </li>
	      <!-- 쇼핑몰 세션 -->
	      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">쇼핑몰<span class="caret"></span></a>
	        <ul class="dropdown-menu">
	        	<c:if test="${whologin != 0}">
	        		<li><a href="<%=notWithFormTag%>malist">장바구니 내역</a></li>
	        	</c:if>
	        	<c:if test="${whologin != 0}">
	        		<li><a href="<%=notWithFormTag%>mahistory">나의 쇼핑 내역</a></li>
	        	</c:if>
	        </ul>
	      </li>
	      <!-- 뷰 세션 -->
	      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">데이터 보기<span class="caret"></span></a>
	        <ul class="dropdown-menu">
	        		<li><a href="<%=notWithFormTag%>vwList">목록보기</a></li>
	        </ul>
	      </li>
	      <!--  -->		     
	    </ul>
	    <ul class="nav navbar-nav navbar-right">
	    	<c:if test="${whologin == 0}">
	        	<li><a href="<%=notWithFormTag%>meinsert"><span class="glyphicon glyphicon-user"></span>회원가입</a></li>
	        	<li><a href="<%=notWithFormTag%>melogin"><span class="glyphicon glyphicon-log-in"></span>로그인</a></li>
	        </c:if>
	        <c:if test="${whologin != 0}">
	        	<li><a href="<%=notWithFormTag%>melogout"><span class="glyphicon glyphicon-log-out"></span>로그아웃</a></li>
	        	<li><a href="<%=notWithFormTag%>meupdate&id=${sessionScope.loginfo.id}">회원정보수정</a>
	        </c:if>
	    </ul>
	  </div>
	</nav>
	<c:if test="${not empty requestScope.alertMsg}">
		<div class="alert alert-danger alert-dismissible">
			<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
			<strong>${requestScope.alertMsg}</strong>
		</div>
		<% request.removeAttribute("alertMsg"); %>
	</c:if>
</body>
</html>
