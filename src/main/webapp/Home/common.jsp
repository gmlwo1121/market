<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%	
	//공용 변수 정의 contextPath, mappingName, withFormTag, notWithFormTag
	
	String contextPath = request.getContextPath();
	String mappingName = "/market" ;//in FrontController.java file
	
	String withFormTag = contextPath + mappingName;
	String notWithFormTag = contextPath + mappingName + "?command=";
	
	int twelve = 12;
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
<%-- 	${applicationScope.uploadedPath} --%>

<nav class="navbar navbar-inverse">
	<div class="container-fluid">
	    <ul class="nav navbar-nav">
	   		<c:if test="${whologin == 0}">
				<li><a href="<%=notWithFormTag%>meLogin"><span>로그인</span></a></li>/
				<li><a href="<%=notWithFormTag%>meInsert"><span>회원가입</span></a></li>
			</c:if>
			<c:if test="${whologin != 0}">
				<li class="dropdown">
	        		<a class="dropdown-toggle" data-toggle="dropdown"  href="<%=notWithFormTag%>mepage&id=${sessionScope.loginfo.id}"><span>
	        		${sessionScope.loginfo.name}(${sessionScope.loginfo.id})님</span></a>
	        		<ul class="dropdown-menu">
	        			<li><a href="<%=notWithFormTag%>mepage&id=${sessionScope.loginfo.id}">마이페이지</a></li>
						<li><a href="<%=notWithFormTag%>###">위시리스트</a></li>
						<li><a href="<%=notWithFormTag%>###">마일리지</a></li>
						<li><a href="<%=notWithFormTag%>mahistory">결재내역</a></li>
						<li><a href="<%=notWithFormTag%>meUpdate&id=${sessionScope.loginfo.id}">회원정보수정</a>
						<li><a href="<%=notWithFormTag%>meLogout">Logout</a></li>
					</ul>
				</li>
				<li><a href="<%=notWithFormTag%>malist">장바구니</a></li>
	        </c:if>
			<li><a href="<%=notWithFormTag%>culist"><span>고객센터</span></a></li>
		</ul>
	</div>
</nav>

<div id="page-wrapper">
		<!-- Header -->
		<section id="header">
			<div class="container">
			<!-- Logo -->
				<div id="logo"><a href="<%=notWithFormTag%>home">대충 로고자리</a></div>
				<!-- nav -->
				<div class="navbody">
					<nav class="navbar navbar-inverse">
						<div class="container-fluid">
						    <ul class="nav navbar-nav">
								<li id="dropmew"><a href="#"><span>다이어리/플래너</span></a>
									<ul class="dropmew-rec">
										<li><a href="<%=notWithFormTag%>koRecipeList">다이어리</a></li>
										<li><a href="<%=notWithFormTag%>chiRecipeList">오거나이저</a></li>
										<li><a href="<%=notWithFormTag%>japRecipeList">스캐줄러</a></li>
										<li><a href="<%=notWithFormTag%>engRecipeList">달력</a></li>
									</ul></li>
								<li id="dropmew"><a href="#"><span>노트/메모지</span></a>
									<ul class="dropmew-des">
										<li><a href="<%=notWithFormTag%>desRecipeList">베이직 노트</a></li>
										<li><a href="<%=notWithFormTag%>driRecipeList">스프링 노트</a></li>
										<li><a href="<%=notWithFormTag%>desRecipeList">미니노트</a></li>
										<li><a href="<%=notWithFormTag%>driRecipeList">단어장</a></li>
									</ul>
								</li>
								<li id="dropmew"><a href="#"><span>데코레이션</span></a>
									<ul class="dropmew-rec">
										<li><a href="<%=notWithFormTag%>koRecipeList">스탬프</a></li>
										<li><a href="<%=notWithFormTag%>chiRecipeList">스티커</a></li>
										<li><a href="<%=notWithFormTag%>japRecipeList">포스터</a></li>
										<li><a href="<%=notWithFormTag%>engRecipeList">테이프</a></li>
									</ul></li>
								<li id="dropmew"><a href="#"><span>레코드북</span></a>
									<ul class="dropmew-des">
										<li><a href="<%=notWithFormTag%>koRecipeList">앨범</a></li>
										<li><a href="<%=notWithFormTag%>chiRecipeList">포토박스</a></li>
										<li><a href="<%=notWithFormTag%>japRecipeList">티켓북</a></li>
										<li><a href="<%=notWithFormTag%>engRecipeList">스크랩북</a></li>
									</ul>
								</li>
								<li id="dropmew"><a href="#"><span>필기류</span></a>
									<ul class="dropmew-des">
										<li><a href="<%=notWithFormTag%>koRecipeList">카드/편지/봉투</a></li>
										<li><a href="<%=notWithFormTag%>chiRecipeList">사무용품</a></li>
										<li><a href="<%=notWithFormTag%>japRecipeList">캐릭터문구</a></li>
										<li><a href="<%=notWithFormTag%>engRecipeList">미술도구</a></li>
									</ul>
								</li>
							</ul>
						</div>
					</nav>
				</div>
				<!-- nav -->
			</div>
		</section>
	</div>
	
<%-- 	<c:if test="${not empty requestScope.alertMsg}"> --%>
<!-- 		<div class="alert alert-danger alert-dismissible"> -->
<!-- 			<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a> -->
<%-- 			<strong>${requestScope.alertMsg}</strong> --%>
<!-- 		</div> -->
<%-- 		<% request.removeAttribute("alertMsg"); %> --%>
<%-- 	</c:if> --%>
</body>
</html>
