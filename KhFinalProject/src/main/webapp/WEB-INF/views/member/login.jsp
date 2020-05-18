<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<style>
	.login-form{
	
		width:400px; 
		border:5px double black; 
		border-radius:5%; 
		margin:100px;	
			
	}
</style>
<section>
	<div class="container d-flex justify-content-center">
		<div class="login-container"  style="margin-top:50px;">
			<div class="login-form">
				<div class="login-category d-flex">
					<div class="text-center member-login" style="width:200px; border:1px solid black; border-top-left-radius:15px;">일반인</div>
					<div class="text-center business-login" style="width:200px; border:1px solid black;">사업자</div>
				</div>
				<div class="member-login-container d-flex justify-content-center flex-wrap text-center">
					<form action="${path}/member/memberLogin.do" method="post">
						<div class="login-title">
							<img src="${path}/resources/img/요기요.png">
						</div>
						<table>
							<tr>
								<td><input style="margin-top:30px; width:400px;" type="text" class="form-control" name="userId" placeholder="아이디 입력" required></td>
							</tr>
							<tr>
								<td><input style="margin-top:30px;" type="password" class="form-control" name="userPw" placeholder="비밀번호 입력" required></td>
							</tr>	
						</table>
						<div class="d-flex justify-content-between" style="margin-top:30px;">
							<div class="">
								<label><input type="checkbox" name="saveId" id="saveId">아이디 저장</label>
							</div>
							<div class="d-flex">
								<span><a href="${path }/member/findIdPwM.do">아이디 / 비밀번호 찾기</a></span>
							</div>
						</div>
						<input type="submit" class="btn btn-outline-dark" value="로그인" style="width:400px; margin-top:30px;">
					</form>
					<div class="d-flex" style="margin-top:30px; margin-left:10px; margin-right:10px;">
						<button class="btn btn-outline-dark" onclick="location.replace('${path}/member/enroll.do')" style="width:200px;">Kakao 로그인</button>
						<button class="btn btn-outline-dark" onclick="location.replace('${path}/member/enroll.do')" style="width:200px;">Google 로그인</button>	
					</div>
					<div class="" style="margin:30px;">
						<span>배달킹이 처음이신가요? <a href="${path }/member/memberEnroll1.do">회원가입</a>을 해보세요!</span>
					</div>
				</div>
				<div class="business-login-container d-flex justify-content-center flex-wrap text-center" style="display: none!important;">
					<form action="${path}/member/businessLogin.do" method="post">
						<div class="login-title">
							<img src="${pageContext.request.contextPath}/resources/img/요기요.png">
						</div>
						<table>
							<tr>
								<td><input style="margin-top:30px; width:400px;" type="text" class="form-control" name="userId" placeholder="아이디 입력" required></td>
							</tr>
							<tr>
								<td><input style="margin-top:30px;" type="password" class="form-control" name="userPw" placeholder="비밀번호 입력" required></td>
							</tr>	
						</table>
						<div class="d-flex justify-content-between" style="margin-top:30px;">
							<div class="">
								<label><input type="checkbox" name="아이디 저장">아이디 저장</label>
							</div>
							<div class="d-flex">
								<span><a href="${path }/member/findIdPwB.do">아이디 / 비밀번호 찾기</a></span>
							</div>
						</div>
						<input type="submit" class="btn btn-outline-dark" value="로그인" style="width:400px; margin-top:30px;">
					</form>
				
					<div class="" style="margin:30px;">
						<span>배달킹이 처음이신가요? <a href="${path}/member/businessEnroll1.do">회원가입</a>을 해보세요!</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		//사업자 로그인 div를 숨기고 일반인 로그인 div를 보여주는 기능
		$(".member-login").click(()=>{	
			$(".member-login-container").attr("style","display:block !important");
			$(".business-login-container").attr("style","display:none !important"); 
			
		});
		
		
		//일반인 로그인 div를 숨기고 사업자 로그인 div를 보여주는 기능	
		$(".business-login").click(()=>{
			$(".member-login-container").attr("style","display:none !important");
			$(".business-login-container").attr("style","display:block !important");
			
		});
		
	</script>
	
</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>