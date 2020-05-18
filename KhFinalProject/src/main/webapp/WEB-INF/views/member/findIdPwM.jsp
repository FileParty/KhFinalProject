<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<style>
   td.emailMsg-container{position:relative; padding:0px;}
   span.emailMsg{display:none;font-size: 12px;position:absolute; top:12px; right:10px;}
   span.ok4{color:green;}
   span.no4{color:red;}
</style>
<section>
	<div class="container d-flex justify-content-center">
			<div class="find-container d-flex justify-content-center " style="width:600px; border:1px solid black; margin-top:50px;">
				<div>
				<div class="find-category d-flex" style="margin-bottom:30px;">
					<div class="text-center id-find" style="width:300px; border:1px solid black;">아이디 찾기</div>
					<div class="text-center pw-find" style="width:300px; border:1px solid black;">비밀번호 찾기</div>
				</div>
				<div class="id-find-container d-flex justify-content-center">
					<table class="d-flex justify-content-center" >
						<form action="findMemberId.do" method="post">
							<tr>			
								<th>이메일</th>
								<td class="emailMsg-container">
									<input type="email" name="m_email" id="email"  class="form-control" style="width:300px;"placeholder="가입했던 이메일 입력" required>
									<span class="emailMsg ok4">사용가능한 이메일입니다.</span>
									<span class="emailMsg no4">사용 불가능한 이메일입니다.</span>
								</td>
							</tr>
							<tr>
								<td></td>
								<td><button type="submit" name="submit" class="btn btn-outline-dark" style="float:right;margin-top:30px; margin-bottom:30px;">아이디 받기</button></td>
							</tr>
						</form>
					</table>
				</div>
				<div class="pw-find-container d-flex justify-content-center flex-wrap text-center" style="display: none!important;">
					<table class="d-flex justify-content-center" >
						<form action="findMemberPw.do" method="post">
							<tr>
								<th>아이디</th>
								<td><input type="text" name="id" id="id"  class="form-control" placeholder="아이디를 입력해주세요." style="width:300px;" required></td>
							</tr>
							<tr>			
								<th>이메일</th>
								<td class="emailMsg-container">
									<input type="email" name="m_email" id="email"  class="form-control" placeholder="이메일 주소를 입력하세요." required>
									<span class="emailMsg ok4">사용가능한 이메일입니다.</span>
									<span class="emailMsg no4">사용 불가능한 이메일입니다.</span>
									
								</td>
							</tr>
							<tr>
								<td></td>
								<td><button type="submit" name="submit" class="btn btn-outline-dark" style="float:right;margin-top:30px; margin-bottom:30px;">인증번호 받기</button></td>
							</tr>
						</form>
						<form action="join_injeungPwM.do${dice}" method="post">
							<tr>
								<th>인증번호</th>
								<td class="emailNoMsg-container">
									<input type="number" name="email_injeung" id="emailNo"  class="form-control" placeholder="인증번호를 입력하세요." required>
									<input type="hidden" name="m_email" id="hiddenEmail"  class="form-control" placeholder="이메일 주소를 입력하세요."  value="${m_email }" required>
									<input type="hidden" name="m_id" id="m_id" value="${m_id }">
								</td>
							</tr>
							<tr>
								<td></td>
								<td><button type="submit" name="submit" class="btn btn-outline-dark" style="float:right;margin-top:30px; margin-bottom:30px;">인증번호 확인</button></td>
							</tr>
						</form>
					</table>				
				</div>
			</div>
		</div>
	</div>
	<script>
		//아이디 찾기 div를 보여주고 비밀번호 찾기 div를 숨기는 기능
		$(".id-find").click(()=>{	
			$(".id-find-container").attr("style","display:block !important");
			$(".pw-find-container").attr("style","display:none !important"); 
		});
		//아이디 찾기 div를 숨기고 비밀번호 찾기 div를 보여주는 기능
		$(".pw-find").click(()=>{
			$(".id-find-container").attr("style","display:none !important");
			$(".pw-find-container").attr("style","display:block !important");	
		});
		$(function(){
			
			const id=$("#m_id").val();
			if(id!=null){
				$(".id-find-container").attr("style","display:none !important");
				$(".pw-find-container").attr("style","display:block !important");
			}
		})
	</script>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>