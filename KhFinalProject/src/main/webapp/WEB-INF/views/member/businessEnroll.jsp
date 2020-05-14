<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<style>
	    /*중복아이디체크관련*/
   td.idMsg-container{position:relative; padding:0px;}
   td.pwckMsg-container{position:relative; padding:0px;}
   span.idMsg{display:none;font-size: 12px;position:absolute; top:12px; right:10px;}
   span.pwckMsg{display:none;font-size: 12px;position:absolute; top:12px; right:10px;}
   span.ok{color:green;}
   span.no{color:red;}
   span.ok1{color:green;}
   span.no1{color:red;}
</style>
<section>
	<div class="container d-flex justify-content-center">
		<div class="enroll-container">
			<div class="enroll-title text-center text-center" style="margin:30px;">
				<h2>회원가입</h2>
			</div>
			<div class="enroll-form">
				<form action="${path}/member/businessEnrollEnd.do" method="post">
				<table style="width:500px;">
					<tr>
						<th>아이디</th>
						<td class="idMsg-container">
							<input type="text" id="userId" name="b_id" class="form-control" placeholder="아이디 입력 " required>
							<span class="idMsg ok">사용가능한 아이디입니다.</span>
							<span class="idMsg no">이미 존재하는 아이디입니다.</span>
						</td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input type="password" id="userPw" name="b_pw" class="form-control" placeholder="비밀번호 입력" required></td>
					</tr>
					<tr>
						<th></th>
						<td class="pwckMsg-container">
							<input type="password" id="userPwck" name="b_pwck" class="form-control" placeholder="비밀번호 확인" required>
							<span class="pwckMsg ok1">비밀번호가 일치합니다.</span>
							<span class="pwckMsg no1">비밀번호가 일치하지 않습니다.</span>
						</td>
					</tr>
					<tr>
						<th>이름</th>
						<td><input type="text" id="name" name="b_name" class="form-control" placeholder="이름 입력" required></td>
					</tr>
					<tr>
						<th>사업자 번호</th>
						<td><input type="text" id="name" name="b_businesscode" class="form-control" placeholder="사업자 번호 입력" required></td>
					</tr>
				</table>
				<div class="d-flex text-center" style="width:500px; margin-top:30px; margin-bottom:30px;">
					<hr style="width:170px;">
					<h4 style="margin-left:10px; margin-right:10px;">이메일 인증</h4>
					<hr style="width:170px;">
				</div>
				<table style="width:500px;">
					<tr>
						<th>이메일</th>
						<td class="emailMsg-container">
							<input type="email" name="b_email" id="email"  class="form-control" placeholder="이메일 주소를 입력하세요." required>
							<span class="emailMsg ok4">사용가능한 이메일입니다.</span>
							<span class="emailMsg no4">사용 불가능한 이메일입니다.</span>
						</td>
					</tr>
					<tr>
						<td></td>
						<td><button type="button" id="emailBtn" class="btn btn-outline-dark" style="float:right">인증번호 받기</button></td>
					</tr>
					<tr>
						<th>인증번호</th>
						<td class="emailNoMsg-container">
							<input type="text" name="emailNo" id="emailNo"  class="form-control" placeholder="인증번호를 입력하세요." required>
							<span class="emailNoMsg ok5">인증완료</span>
							<span class="emailNoMsg no5">인증실패</span>
						</td>
					</tr>
					<tr>
						<td></td>
						<td><button type="button" id="emailAuthBtn" class="btn btn-outline-dark" style="float:right">인증번호 확인</button></td>
					</tr>
				</table>
				<div class="d-flex justify-content-center" style="margin:30px;">
					<input class="btn btn-outline-dark" type="submit" value="회원가입">
				</div>
				</form>
			</div>
		</div>
	</div>
	<script>
		//아이디 중복체크
		$(function(){
			$("#userId").keyup(function(){
				const id=$(this).val();
				if(id.trim().length>4){
					$.ajax({
						url:"${path}/member/checkIdB",
						data:{userId:id},
						success:function(data){
							console.log(data);
							if(data=='false'){
								$(".idMsg.ok").hide();
								$(".idMsg.no").show();
							}else{
								$(".idMsg.ok").show();
								$(".idMsg.no").hide();
							}
						}
					});
				}else{
					$(".idMsg").hide();
					return;
				}
			})
		})
		//비밀번호 일치체크
		$("#userPwck").keyup(function(){
			let pw=$("#userPw").val();
			let pwck=$("#userPwck").val();
			if(pw != "" && pwck != ""){
				if(pwck.trim().length>=pw.trim().length){
					if(pw == pwck) {
						$(".no1").hide();
						$(".ok1").show();
					}else{
						$(".no1").show();
						$(".ok1").hide();
					}
				}
			}
		});
		$("#userPw").keyup(function(){
			let pw=$("#userPw").val();
			let pwck=$("#userPwck").val();
			if(pw != "" && pwck != ""){
				if(pwck.trim().length=pw.trim().length){
					if(pw == pwck) {
						$(".no1").hide();
						$(".ok1").show();
					}else{
						$(".no1").show();
						$(".ok1").hide();
					}
				}
			}
		});
	</script>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>