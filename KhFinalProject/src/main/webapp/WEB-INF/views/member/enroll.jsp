<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<style>
	    /*중복아이디체크관련*/
		    div#idMsg-container{position:relative; padding:0px;}
		    div#idMsg-container span.idMsg{display:none;font-size: 12px;position:absolute; top:12px; right:10px;}
		    div#idMsg-container span.ok{color:green;}
		    div#idMsg-container span.no{color:red;}
</style>
<section>
	<div class="container d-flex justify-context-center">
		<div class="">
		<div class="enroll-title">
			<h2>회원가입</h2>
		</div>
		<div class="enroll-container d-flex justify-context-center" style="width:500px;">
			<div>
			<form action="${path }/member/enrollEnd.do" method="post" class="text-center">
				<div class="id-container d-flex">
					<h4>아이디</h4>
					<input type="text" id="userId" name="userId" class="form-control" placeholder="아이디 입력 " required>
				</div>
				<div id="idMsg-container">
					<span class="idMsg ok">사용이 가능한 아이디 입니다.</span>
					<span class="idMsg no">사용이 불가능한 아이디 입니다.</span>
				</div>
				<div class="pw-container d-flex">
					<h4>비밀번호</h4>
					<input type="password" id="userPw" name="userPw" class="form-control" placeholder="비밀번호 입력" required>
				</div>
				<div class="pwck-container d-flex">
					<h4>비밀번호 확인</h4>
					<input type="password" id="pwck" name="pwck" class="form-control" placeholder="비밀번호 확인" required>
				</div>
				<div id="pwMsg-container">
					<span>숫자,영문자 조합 5~10자리로 입력해주세요.</span>
					<span>비밀번호가 일치하지 않습니다.</span>
					<span>비밀번호가 일치합니다.</span>
				</div>
				<div class="nickname-container d-flex">
					<h4>닉네임</h4>
					<input type="text" name="nickname" id="nickname" class="form-control" placeholder="닉네임 입력 " required>
				</div>
				<div class="email-container d-flex">
					<div class="d-flex justify-content-center align-self-center text-center" style="width: 400px; height: auto;">
                        <hr class="w-25">
                        <p class="w-50 m-0 " style="font-weight: 600;"> 본인확인 이메일 인증 </p>
                        <hr class="w-25">
                    </div>
                    <table class="" style="width: 400px;">
                        <tr>
                            <th class="pt-3" style="width: 95.6px; text-align: left;">이메일 </th>
                            <td class="pt-3"><input type="email" id="userEmail" name="userEmail" class="form-control" placeholder="이메일 입력" required></td>
                        </tr>
                        <tr>
                            <th></th>
                            <td class="d-flex justify-content-end pt-2 pb-3">                                        
                                <button type="button" class="btn-outline-success" id="mailBtn" onclick="fn_enrollEmailAut();">인증번호 발송</button>
                            </td>
                        </tr>
                    </table>
                    <table id="autCodeInputTb" style="width: 400px; display: none;">
                        <div>
                        	<tr>
                        		<td colspan='2'>
                        			<div class="alert alert-success m-1 mb-3 p-2 text-center">
                                   		인증코드가 발송되었습니다.<br>
                        				메일을 확인해주세요.
                                	</div>
                        		</td>
                        	</tr>
                            <tr>
                       			<input type="hidden" id="authenticationKey" name="authenticationKey"/>                            
                                <th style="width: 95.6px; text-align: left;">인증코드</th>
                                <td><input type="text" id="autCode" name="autCode" class="form-control" placeholder="인증코드 입력" required></td>
                            </tr>
                            <tr>
                                <th></th>
                                <td class="d-flex justify-content-end pt-2 pb-2">
                                    <input type="button" class="ldBtn btn-sm" id="autCodeCheckBtn" onclick="fn_autCodeCheck()" value="본인인증 확인">
                                </td>
                            </tr>
                        </div>
                    </table>
				</div>
				<input type="submit" class="btn-outline-success" value="회원가입">
			</form>
			</div>
		</div>
		</div>
	</div>
</section>
<script>
			$(function(){
				$("#userId_").keyup(function(){
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
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>