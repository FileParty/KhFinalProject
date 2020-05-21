<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<style>
	.updatePw-container{
		border: 1px solid black;
	}

   td.pwMsg-container{position:relative; padding:0px;}
   td.pwckMsg-container{position:relative; padding:0px;}
   span.pwMsg{display:none;font-size: 12px;position:absolute; top:12px; right:10px;}
   span.pwckMsg{display:none;font-size: 12px;position:absolute; top:12px; right:10px;}
   span.ok1{color:green;}
   span.no1{color:red;}
   span.ok3{color:green;}
   span.no3{color:red;}
</style>
<section>
	<div class="container d-flex justify-content-center">
		<div class="updatePw-container" style="margin-top:50px; width:600px;">
			<div class="updatePw-title d-flex text-center" style="margin:30px;">
				<hr style="width:175px;">
				<h4 style="margin-left:10px; margin-right:10px;">비밀번호 변경</h4>
				<hr style="width:175px;">
			</div>
			<div class="updatePw-form d-flex justify-content-center">
				<form action="${path}/member/updateMemberPwEnd.do" method="post" onsubmit="fn_checkPwM();">
					<table>
						<tr>
							<th>변경할 비밀번호</th>
							<td class="pwMsg-container">
								<input type="password" class="form-control" name="m_pw" id="pw" placeholder="비밀번호 입력">
								<span class="pwMsg ok3">사용가능한 비밀번호 입니다.</span>
								<span class="pwMsg no3">올바른 형식의 비밀번호가 아닙니다.</span>
							</td>
						</tr>
						<tr>
							<th>비밀번호 확인</th>
							<td class="pwckMsg-container">
								<input type="password" class="form-control" name="m_pwck" id="pwck" placeholder="비밀번호 확인"style="width:300px;">
								<span class="pwckMsg ok1">비밀번호가 일치합니다.</span>
								<span class="pwckMsg no1">비밀번호가 일치하지 않습니다.</span>
							</td>
							<td><input type="hidden" name="m_id" value="${m_id }"></td>
						</tr>
					</table>
					<div class="text-center" style="margin:30px;">
						<input type="submit" class="btn btn-outline-dark" value="비밀번호 변경">
					</div>
				</form>
			</div>
		</div>
	</div>
</section>
<script>
	//비밀번호 일치체크
	$("#pwck").keyup(function(){
		let pw=$("#pw").val();
		let pwck=$("#pwck").val();
		if(pw != "" && pwck != ""){
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
		}
	});
	$("#pw").keyup(function(){
		let pw=$("#pw").val();
		let pwck=$("#pwck").val();
		const reg = /^(?=.*[a-z])(?=.*\d)[a-z\d]{5,10}$/;
		if(pw.trim().length>4){
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
		}else{
			$(".no1").hide();
			$(".ok1").hide();
			$(".no1").attr("name","no");
			$(".ok1").attr("name","no");
		}
	});
	//비밀번호 형식이 잘못 됬거나 비밀번호 확인이 불일치 일때 변경 방지
    function fn_checkPwM(){
	
		//재확인
        let pwckMsg = $(".no1").attr("name");
		//비번
		let pwMsg = $(".no3").attr("name");
      
        if(pwMsg=="ok"){
        	alert("올바른 형식의 비밀번호를 입력해주세요.");
        	return false;  
        }
        else if(pwckMsg=="ok"){
        	alert("비밀번호가 일치하지 않습니다.");
        	return false;
        }
        return true;
	}  	
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>