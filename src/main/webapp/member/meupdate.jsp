<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ include file="./../Home/common.jsp"%>

<%
   int myoffset = 2 ; // 옵셋
   int mywidth = twelve - 2 * myoffset ; // 센터 너비
   int formleft = 3 ; // 좌측 라벨의 너비
   int formright = twelve - formleft ; // 우측 입력란의 너비
%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>Insert title here</title>
   <script type="text/javascript">
      function validCheck(){
         $('.err').each(function(){
           $(this).text(''); 
         });
         
         var name = $('#name').val();
         if(name.length < 2 || name.length > 10){
            $('#errname').text('이름은 2자리 이상 10자리 이하이어야 합니다.');
            $('#name').focus();
            return false; //이벤트 전파 방지
         }
         
         var password = $('#password').val();
         if(password.length < 4 || password.length > 30){
            $('#errpassword').text('비밀번호는 4글자 이상 30글자 이하이어야 합니다.');
            $('#password').focus();
            return false; // 이벤트 전파 방지(전송 x)
         }
         
         return true;
      }
   </script>
</head>
<body>
   <div class="container col-sm-offset-<%=myoffset%> col-sm-<%=mywidth%>" >
      <div class="panel panel-default">
         <div class="panel-heading">
            <h4>회원 수정</h4>
         </div>
         <div class="panel-body">
            <form class="form-horizontal" action="<%=withFormTag%>" method="post">
               <input type="hidden" name="command" value="meUpdate">
               <div class="form-group">
                  <label class="control-label col-sm-<%=formleft%>" for="id">아이디</label>
                  <div class="col-sm-<%=formright%>">
                     <input type="text" class="form-control" disabled="disabled"  
                        id="fakeid" name="fakeid" value="${requestScope.bean.id}">
                     <input type="hidden"  
                        id="id" name="id" value="${requestScope.bean.id}">                        
                  </div>
               </div>   
               <div class="form-group">
                  <label class="control-label col-sm-<%=formleft%>" for="name">이름</label>
                  <div class="col-sm-<%=formright%>">
                     <input type="text" class="form-control" id="name"
                        placeholder="이름을 입력해 주세요" name="name" 
                        value="${requestScope.bean.name}">
                     <span class="err" id="errname"></span>
                  </div>
               </div>   
               <div class="form-group">
                  <label class="control-label col-sm-<%=formleft%>" for="password">비밀 번호</label>
                  <div class="col-sm-<%=formright%>">
                     <input type="password" class="form-control" id="password"
                        placeholder="비밀 번호를 입력해 주세요." name="password" value="">
                     <span class="err" id="errpassword"></span>
                  </div>
             </div>
               <div class="form-group">
                  <div class="col-sm-offset-2 col-sm-10">
                     <button type="submit" class="btn btn-primary" onclick="return validCheck();">수정하기</button>
                     &nbsp;&nbsp;&nbsp;
                     <button type="reset" class="btn btn-default" onclick="history.back();">취소</button>
                  </div>
               </div>
            </form>
         </div>
      </div>
   </div>
</body>
</html>