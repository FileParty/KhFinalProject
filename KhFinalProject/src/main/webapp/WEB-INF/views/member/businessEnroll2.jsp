<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<style>
	    /*중복아이디체크관련*/
   td.emailMsg-container{position:relative; padding:0px;}
   td.emailNoMsg-container{position:relative; padding:0px;}
   span.emailMsg{display:none;font-size: 12px;position:absolute; top:12px; right:10px;}
   span.emailNoMsg{display:none;font-size: 12px;position:absolute; top:12px; right:10px;}
   span.ok4{color:green;}
   span.no4{color:red;}
</style>
<section>
	<div class="container d-flex justify-content-center">
		<div class="email-container" style="width:600px; border:1px solid black; margin-top:50px;">
			<div class="d-flex justify-content-center" style="margin:30px;">
   				<img src="${path}/resources/img/요기요.png">
			</div>
		 	<div class="d-flex text-center" style="margin:30px;">
				<hr style="width:170px;">
				<h4 style="margin-left:10px; margin-right:10px;">이메일 인증</h4>
				<hr style="width:170px;">
			</div>
			<div class="email-body d-flex justify-content-center">
				<table style="width:500px;">
					<form action="authB.do" method="post" onsubmit="return fn_checkEmailM();">
					<tr>			
						<th>이메일</th>
						<td class="emailMsg-container">
							<input type="email" name="b_email" id="email"  class="form-control" placeholder="이메일 주소를 입력하세요." value="${b_email }" required>
							<span class="emailMsg ok4">사용가능한 이메일입니다.</span>
							<span class="emailMsg no4">이미 가입된 이메일입니다.</span>
						</td>
					</tr>
					<tr>
						<td></td>
						<td><button type="submit" name="submit" class="btn btn-outline-dark" style="float:right; margin-top:30px; margin-bottom:30px;">인증번호 받기</button></td>
					</tr>
					</form>
					<form action="join_injeungB.do${dice}" method="post">
					<tr>
						<th>인증번호</th>
						<td class="emailNoMsg-container">
							<input type="number" name="email_injeung" id="emailNo"  class="form-control" placeholder="인증번호를 입력하세요." required>
							<input type="hidden" name="b_email" id="hiddenEmail"  class="form-control"   value="${b_email }" required>
						</td>
					</tr>
					<tr>
						<td></td>
						<td><button type="submit" name="submit" class="btn btn-outline-dark" style="float:right; margin-top:30px; margin-bottom:30px;">인증번호 확인</button></td>
					</tr>
					</form>
				</table>
			</div>
		</div>
	</div>
</section>
<script>
	//사업자 아이디 이메일 중복체크
	$(function(){
		$("#email").keyup(function(){
			const email=$(this).val();
			if(email.length>4){
				$.ajax({
					url:"${path}/member/checkEmailB",
					data:{b_email:email},
					success:function(data){
						console.log(data);
						if(data=='false'){
							$(".emailMsg.ok4").hide();
							$(".emailMsg.no4").show();
							$(".emailMsg.ok4").attr("name","no");
							$(".emailMsg.no4").attr("name","ok");
						}else{
							$(".emailMsg.ok4").show();
							$(".emailMsg.no4").hide();
							$(".emailMsg.ok4").attr("name","ok");
							$(".emailMsg.no4").attr("name","no");
						}
					}
				});
			}else{
				$(".emailMsg").hide();
				return;
			}
		})
	})
	function fn_checkEmailM(){
		
		//이메일
        let emailMsg = $(".no4").attr("name");
      	
        if(emailMsg=="ok"){
        	alert("이미 가입된 이메일입니다.");
        	return false;
        }
        return true;
	}  		
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>