<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../Home/common.jsp"%>
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
<script type="text/javascript">
	function search() {//검색
		//alert('검색');
	}
	function searchAll() {//전체검색
		location.href='<%=notWithFormTag%>bolist'
	}
	function writeForm() {//글쓰기
		location.href='<%=notWithFormTag%>boinsert'
	}
</script>
</head>
<body>
	<div class="container col-sm-offset-<%=myoffset%> col-sm-<%=mywidth%>">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h4>게시목록</h4>
			</div>
			<div class="panel-body">
				<div class="col-sm-12">
					<table class="table table-hover">
						<thead>
							<tr>
								<th>작성자</th>
								<th>글내용</th>
								<th>작성 일자</th>
								<th>답글</th>
								<th>수정</th>
								<th>삭제</th>
							</tr>
						</thead>
					    <tbody>
					    	<tr>
					    		<td colspan="9" align="center">
					    			<form  class="form-inline" role="form" name="myform" action="<%=notWithFormTag%>" method="get"><!-- withFormTag -->
					    				<input type="hidden" name="command" value="bolist">
					    				<div class="form-group">
					    					<select class="form-control" name="mode" id="mode">
					    						<option value="all" selected="selected">--선택---
					    						<option value="writer">작성자
					    						<option value="subject">제목
					    						<option value="content">글 내용
					    					</select>
					    				</div>
					    				<div class="form-group">
					    					<input type="text" class="form-control" name="keyword" id="keyword"
					    						placeholder="검색할 키워드 입력"/>
					    				</div>
					    				<button type="submit" class="btn btn-warning" onclick="search();">검색</button>
					    				<button type="button" class="btn btn-warning" onclick="searchAll();">전체검색</button>
					    				<button type="button" class="btn btn-info" onclick="writeForm();">글 쓰기</button>
					    				&nbsp;&nbsp;&nbsp;
					    				<p class="form-control-static">
					    					${requestScope.pageInfo.pagingStatus}
					    				</p>
					    			</form>
					    		</td>
					    	</tr>
					    	<c:forEach var="bean" items="${requestScope.lists}">
						      	<tr>
							        <td>${bean.no}</td>
							        <td>${bean.writer}</td>
							        <td>
							        	<c:forEach var="cnt" begin="1" end="${bean.depth}">
							        		<span class="badge">re</span>
							        	</c:forEach>
							        	<a href="<%=notWithFormTag%>bodetail&no=${bean.no}&${requestScope.parameter}">
							        	${bean.subject}</a>
							        </td>
							        <td>${bean.content}</td>
							        <td>${bean.regdate}</td>
							        <td>${bean.readhit}</td>
							        <td>
							        	<!-- 내글이아닐시 수정삭제X  링크를 막아놓거나 글을 없에기-->
							        	<c:if test="${sessionScope.loginfo.id == bean.writer}">
							        	<a href="<%=notWithFormTag%>boupdate&no=${bean.no}&${requestScope.parameter}">수정</a>
							        	</c:if>
							        	<c:if test="${sessionScope.loginfo.id != bean.writer}">수정</c:if>
							        </td>
							        <td>
							        	<c:if test="${sessionScope.loginfo.id == bean.writer}">
							        	<a href="<%=notWithFormTag%>bodelete&no=${bean.no}&${requestScope.parameter}">삭제</a>
							        	</c:if>
							        	<c:if test="${sessionScope.loginfo.id != bean.writer}">삭제</c:if>
							        </td>
							        <td>
							        	<c:if test="${bean.depth < 3}">
							        		<c:set var="replyInfo" value="&groupno=${bean.groupno}&orderno=${bean.orderno}&depth=${bean.depth}"/>
							        		<a href="<%=notWithFormTag%>boreply&no=${bean.no}&${requestScope.parameter}${replyInfo}">답글</a>
							        	</c:if>
							        	<c:if test="${bean.depth >= 3}">
							        		답글
							        	</c:if>
							        </td>
						    	</tr>
					    	</c:forEach>
					    </tbody>
					  </table>
				</div>
				<div align="center">
					<footer>${requestScope.pageInfo.pagingHTML}</footer>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">		
		/* jQuery를 사용하여 필드 검색시 입력했던 콤보 박스 mode의 내용과 입력한 키워드(keyword)의 값을 보존해 주도록 합니다. */
		$(document).ready(function(){
			/* alert('${requestScope.pageInfo.mode}') ; */
			
			var myoptions = $('#mode option');
			
			for(var i=0;i<myoptions.length;i++){
				if(myoptions[i].value=='${requestScope.pageInfo.mode}'){
					myoptions[i].selected = true;
				}
			}
			$('#keyword').val('${requestScope.pageInfo.keyword}');
		});
	</script>
</body>
</html>