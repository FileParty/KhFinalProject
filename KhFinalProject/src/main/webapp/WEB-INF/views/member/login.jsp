<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<section>
	<div class="container">
		<div class="login-container d-flex justify-content-center">
			<div class="login-form" style="width:400px; border:1px solid black; border-radius:5%; margin:100px;">
				<div class="login-category d-flex">
					<div class="text-center" style="width:200px; border:1px solid black;"><button class="btn member-login" onclick="memberLogin();">일반인</button></div>
					<div class="text-center" style="width:200px; border:1px solid black;"><button class="btn ceo-login" onclick="ceoLogin();">사업자</button></div>
				</div>
				<div class="member-login-container d-flex justify-content-center flex-wrap text-center">
					<form action="${path}/member/memberLogin.do" method="post">
						<div class="login-title">
							<img src="${path}/resources/img/요기요.png">
						</div>
						<table>
							<tr>
								<td><input style="margin-top:30px; width:400px;" type="text" class="form-control" name="userId" placeholder="아이디 입력"></td>
							</tr>
							<tr>
								<td><input style="margin-top:30px;" type="password" class="form-control" name="userPw" placeholder="비밀번호 입력"></td>
							</tr>	
						</table>
						<div class="d-flex justify-content-between" style="margin-top:30px;">
							<div class="">
								<label><input type="checkbox" name="아이디 저장">아이디 저장</label>
							</div>
							<div class="d-flex" data-toggle="modal" data-target="#myModal">
							<span>아이디 / 비밀번호 찾기</span>
							</div>
						</div>
						<input type="submit" class="btn btn-outline-dark" value="로그인" style="width:400px; margin-top:30px;">
					</form>
					<div class="d-flex" style="margin-top:30px; margin-left:10px; margin-right:10px;">
						<button class="btn btn-outline-dark" onclick="location.replace('${path}/member/enroll.do')" style="width:200px;">Kakao 로그인</button>
						<button class="btn btn-outline-dark" onclick="location.replace('${path}/member/enroll.do')" style="width:200px;">Google 로그인</button>	
					</div>
					<div class="" style="margin:30px;">
						<span>배달킹이 처음이신가요? <a href="${path }/member/enroll.do">회원가입</a>을 해보세요!</span>
					</div>
				</div>
				<div class="ceo-login-container d-flex justify-content-center flex-wrap text-center" style="display: none!important;">
					<form action="${path}/member/memberLogin.do" method="post">
						<div class="login-title">
							<img src="${pageContext.request.contextPath}/resources/img/요기요.png">
						</div>
						<table>
							<tr>
								<td><input style="margin-top:30px; width:400px;" type="text" class="form-control" name="userId" placeholder="아이디 입력"></td>
							</tr>
							<tr>
								<td><input style="margin-top:30px;" type="password" class="form-control" name="password" placeholder="비밀번호 입력"></td>
							</tr>	
						</table>
						<div class="d-flex justify-content-between" style="margin-top:30px;">
							<div class="">
								<label><input type="checkbox" name="아이디 저장">아이디 저장</label>
							</div>
							<div class="d-flex" data-toggle="modal" data-target="#myModal">
							<span>아이디 / 비밀번호 찾기</span>
							</div>
						</div>
						<input type="submit" class="btn btn-outline-dark" value="로그인" style="width:400px; margin-top:30px;">
					</form>
				
					<div class="" style="margin:30px;">
						<span>배달킹이 처음이신가요? <a href="${path}/member/enroll.do">회원가입</a>을 해보세요!</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		function memberLogin(){
			$(".member-login-container").show();
			$(".ceo-login-container").hide();
		}
		function ceoLogin(){
			$(".member-login-container").hide();
			$(".ceo-login-container").show();
		}
		
	</script>
</section>


  <!-- The Modal -->
  <div class="modal fade" id="myModal">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">Modal Heading</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          Modal body..
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>