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
   span.error{color:red;}
</style>
<section>
	<div class="container d-flex justify-content-center">
		<div class="enroll-container" style="width:600px; border:1px solid black; margin-top:50px;">
			<div class="d-flex justify-content-center" style="margin:30px;">
   				<img src="${path}/resources/img/요기요.png">
			</div>
		 	<div class="d-flex text-center" style="margin:30px;">
				<hr style="width:175px;">
				<h4 style="margin-left:10px; margin-right:10px;">정보 입력</h4>
				<hr style="width:175px;">
			</div>
			<div class="enroll-form d-flex justify-content-center">
				<form action="${path}/member/enrollEnd.do" method="post" onsubmit="return fn_checkEndM();">
				<table style="width:500px;">
					<tr style="margin-bottom:30px;">
						<th>아이디</th>
						<td class="idMsg-container">
							<input type="text" id="userId" name="m_Id" class="form-control" placeholder="숫자와 영(소)문자 조합 5~10자리를 사용 " required>
							<span class="idMsg ok">사용가능한 아이디입니다.</span>
							<span class="idMsg no">이미 존재하는 아이디입니다.</span>
							<span class="idMsg error">올바른 아이디 형식이 아닙니다.</span>
						</td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td class="pwMsg-container">
							<input type="password" id="userPw" name="m_Pw" class="form-control" placeholder="숫자와 영(소)문자 조합 5~10자리를 사용" required>
							<span class="pwMsg ok3">사용가능한 비밀번호 입니다.</span>
							<span class="pwMsg no3">올바른 비밀번호 형식이 아닙니다.</span>
						</td>
					</tr>
					<tr>
						<th></th>
						<td class="pwckMsg-container">
							<input type="password" id="userPwck" name="m_Pwck" class="form-control" placeholder="비밀번호 확인" required>
							<span class="pwckMsg ok1">비밀번호가 일치합니다.</span>
							<span class="pwckMsg no1">비밀번호가 일치하지 않습니다.</span>
						</td>
					</tr>
					<tr>
						<th>이름</th>
						<td><input type="text" id="name" name="m_Name" class="form-control" placeholder="이름 입력" required></td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td><input type="text" id="phone" name="m_Phone" class="form-control" placeholder="전화번호 입력" required></td>
					</tr>
					<tr>
						<th>닉네임</th>
						<td class="nameMsg-container">
							<input type="text" id="nickname" name="m_Nickname" class="form-control" placeholder="닉네임 입력" required>
							<span class="nameMsg ok2">사용가능한 닉네임입니다.</span>
							<span class="nameMsg no2">중복된 닉네임입니다.</span>
						</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td><input type="email" name="m_Email" class="form-control" value="${m_Email }" readonly="readonly"></td>
					</tr>
					<tr>
						<th>종류</th>
						<td><label><input type="radio" name="m_Level" value="1">구매자</label>&emsp;<label><input type="radio" name="m_Level" value="2">배달원</label></td>
					</tr>
				</table>
				<div class="d-flex justify-content-center" style="margin:30px;">
					<input class="btn btn-outline-dark" type="submit" value="회원가입">
				</div>
				</form>
			</div>
		</div>
	</div>
</section>
<script>
	//아이디 중복체크
	$(function(){
		$("#userId").keyup(function(){
			const id=$(this).val();
			const reg = /^(?=.*[a-z])(?=.*\d)[a-z\d]{5,10}$/;
			if(id.trim().length>4){
				if(!reg.test(id)){
					$(".idMsg.ok").hide();
					$(".idMsg.no").hide();
					$(".idMsg.error").show();
					$(".idMsg.ok").attr("name","no");
					$(".idMsg.no").attr("name","no");
					$(".idMsg.error").attr("name","ok");
				}else{	
					$.ajax({
						url:"${path}/member/checkId",
						data:{userId:id},
						success:function(data){
							console.log(data);
							if(data=='false'){
								$(".idMsg.ok").hide();
								$(".idMsg.no").show();
								$(".idMsg.error").hide();
								$(".idMsg.ok").attr("name","no");
								$(".idMsg.no").attr("name","ok");
								$(".idMsg.error").attr("name","no");
							}else{
								$(".idMsg.ok").show();
								$(".idMsg.no").hide();
								$(".idMsg.error").hide();
								$(".idMsg.ok").attr("name","ok");
								$(".idMsg.no").attr("name","no");
								$(".idMsg.error").attr("name","no");
							}
						}
					});
				}
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
							$(".nameMsg.ok2").attr("name","no");
							$(".nameMsg.no2").attr("name","ok");
						}else{
							$(".nameMsg.ok2").show();
							$(".nameMsg.no2").hide();
							$(".nameMsg.ok2").attr("name","ok");
							$(".nameMsg.no2").attr("name","no");
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
		
		if(pwck.trim().length>=pw.trim().length){
			if(pw == pwck) {
				$(".no1").hide();
				$(".ok1").show();
				$(".no1").attr("name","no");
				$(".ok1").attr("name","ok");
			}else{
				$(".no1").show();
				$(".ok1").hide();
				$(".no1").attr("name","ok");
				$(".ok1").attr("name","no");
			}
		}else{
			$(".no1").hide();
			$(".ok1").hide();
			$(".no1").attr("name","no");
			$(".ok1").attr("name","no");
		}
			
		
		
	});
	$("#userPw").keyup(function(){
		let pw=$("#userPw").val();
		let pwck=$("#userPwck").val();
		const reg = /^(?=.*[a-z])(?=.*\d)[a-z\d]{5,10}$/;
		
		if(pw.trim().length>3){
			if(!reg.test(pw)){
				$(".ok3").hide();
				$(".no3").show();
				$(".ok3").attr("name","no");
				$(".no3").attr("name","ok");
				
			}else{
				$(".ok3").show();
				$(".no3").hide();
				$(".ok3").attr("name","ok");
				$(".no3").attr("name","no");
			}
		}else{
			$(".ok3").hide();
			$(".no3").hide();
			$(".ok3").attr("name","no");
			$(".no3").attr("name","no");
		}
		if(pw != "" && pwck != ""){
			if(pwck.trim().length=pw.trim().length){
				if(pw == pwck) {
					$(".no1").hide();
					$(".ok1").show();
					$(".no1").attr("name","no");
					$(".ok1").attr("name","ok");
					
				}else{
					$(".no1").show();
					$(".ok1").hide();
					$(".no1").attr("name","ok");
					$(".ok1").attr("name","no");
					
				}
			}
		}
	});
	//중복 아이디 + 중복 닉네임 + 비밀번호 불일치 + 형식에 맞지 않는 비밀번호 가입방지
    function fn_checkEndM(){
		
		//아이디 1
        let idMsg1 = $(".no").attr("name");
      	//아이디 2
        let idMsg2 = $(".error").attr("name");
		//재확인
        let pwckMsg = $(".no1").attr("name");
		//닉네임
		let nameMsg = $(".no2").attr("name");
		//비번
		let pwMsg = $(".no3").attr("name");
        if(idMsg1=="ok"){
        	alert("중복된 아이디는 가입할 수 없습니다.");
        	return false;
        }
        if(idMsg2=="ok"){
        	alert("올바른 형식의 아이디를 입력해주세요.");
        	return false;
        }
        else if(pwMsg=="ok"){
        	alert("올바른 형식의 비밀번호를 입력해주세요.");
        	return false;  
        }
        else if(pwckMsg=="ok"){
        	alert("비밀번호가 일치하지 않습니다.");
        	return false;
        }
        else if(nameMsg=="ok"){
        	alert("중복된 닉네임은 가입할 수 없습니다.");
        	return false;        	
        }
        //회원 종류 선택했는지
        else if(!$("input:radio[name=m_level]").is(":checked")){
		    alert("회원 종류를 선택해 주세요.");
            return false; 
		}

        return true;
	}  		
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>