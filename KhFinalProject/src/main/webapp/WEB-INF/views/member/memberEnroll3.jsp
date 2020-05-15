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
   td.pwMsg-container{position:relative; padding:0px;}
   td.pwckMsg-container{position:relative; padding:0px;}
   td.nameMsg-container{position:relative; padding:0px;}
   td.emailMsg-container{position:relative; padding:0px;}
   td.emailNoMsg-container{position:relative; padding:0px;}
   span.idMsg{display:none;font-size: 12px;position:absolute; top:12px; right:10px;}
   span.pwMsg{display:none;font-size: 12px;position:absolute; top:12px; right:10px;}
   span.pwckMsg{display:none;font-size: 12px;position:absolute; top:12px; right:10px;}
   span.nameMsg{display:none;font-size: 12px;position:absolute; top:12px; right:10px;}
   span.emailMsg{display:none;font-size: 12px;position:absolute; top:12px; right:10px;}
   span.emailNoMsg{display:none;font-size: 12px;position:absolute; top:12px; right:10px;}
   span.ok{color:green;}
   span.no{color:red;}
   span.ok1{color:green;}
   span.no1{color:red;}
   span.ok2{color:green;}
   span.no2{color:red;}
   span.ok3{color:green;}
   span.no3{color:red;}
   span.ok4{color:green;}
   span.no4{color:red;}
</style>
<section>
	<div class="container d-flex justify-content-center">
		<div class="enroll-container">
			<div class="d-flex justify-content-center" style="margin:30px;">
   				<img src="${path}/resources/img/요기요.png">
			</div>
		 	<div class="d-flex text-center" style="width:500px; margin-top:30px; margin-bottom:30px;">
				<hr style="width:175px;">
				<h4 style="margin-left:10px; margin-right:10px;">정보 입력</h4>
				<hr style="width:175px;">
			</div>
			<div class="enroll-form">
				<form action="${path}/member/enrollEnd.do" method="post">
				<table style="width:500px;">
					<tr style="margin-bottom:30px;">
						<th>아이디</th>
						<td class="idMsg-container">
							<input type="text" id="userId" name="m_id" class="form-control" placeholder="아이디 입력 " required>
							<span class="idMsg ok">사용가능한 아이디입니다.</span>
							<span class="idMsg no">이미 존재하는 아이디입니다.</span>
						</td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td class="pwMsg-container">
							<input type="password" id="userPw" name="m_pw" class="form-control" placeholder="비밀번호 입력" required>
							<span class="pwMsg ok3">사용가능한 비밀번호 입니다.</span>
							<span class="pwMsg no3">올바른 비밀번호 형식이 아닙니다.</span>
						</td>
					</tr>
					<tr>
						<th></th>
						<td class="pwckMsg-container">
							<input type="password" id="userPwck" name="m_pwck" class="form-control" placeholder="비밀번호 확인" required>
							<span class="pwckMsg ok1">비밀번호가 일치합니다.</span>
							<span class="pwckMsg no1">비밀번호가 일치하지 않습니다.</span>
						</td>
					</tr>
					<tr>
						<th>이름</th>
						<td><input type="text" id="name" name="m_name" class="form-control" placeholder="이름 입력" required></td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td><input type="text" id="phone" name="m_phone" class="form-control" placeholder="전화번호 입력" required></td>
					</tr>
					<tr>
						<th>닉네임</th>
						<td class="nameMsg-container">
							<input type="text" id="nickname" name="m_nickname" class="form-control" placeholder="닉네임 입력" required>
							<span class="nameMsg ok2">사용가능한 닉네임입니다.</span>
							<span class="nameMsg no2">중복된 닉네임입니다.</span>
						</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td><input type="email" name="m_email" class="form-control" value="${m_email }"></td>
					</tr>
					<tr>
						<th>종류</th>
						<td><label><input type="radio" name="m_level" value="1">구매자</label><label><input type="radio" name="m_level" value="2">배달원</label></td>
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
						url:"${path}/member/checkId",
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
		//닉네임 중복체크
		$(function(){
			$("#nickname").keyup(function(){
				const name=$(this).val();
				if(name.trim().length>2){
					$.ajax({
						url:"${path}/member/checkName",
						data:{name:name},
						success:function(data){
							console.log(data);
							if(data=='false'){
								$(".nameMsg.ok2").hide();
								$(".nameMsg.no2").show();
							}else{
								$(".nameMsg.ok2").show();
								$(".nameMsg.no2").hide();
							}
						}
					});
				}else{
					$(".nameMsg").hide();
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