<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<style>  
   td.nameMsg-container{position:relative; padding:0px;}
   span.nameMsg{display:none;font-size: 12px;position:absolute; top:12px; right:10px;}
   td.emailMsg-container{position:relative; padding:0px;}
   span.emailMsg{display:none;font-size: 12px;position:absolute; top:12px; right:10px;}
   span.ok2{color:green;}
   span.no2{color:red;}
   span.ok4{color:green;}
   span.no4{color:red;}
</style>
<section>
	<div class="container d-flex justify-content-center">
		<div class="kakao-enroll-container" style="width:600px; border:1px solid black; margin-top:50px;">
			<div class="d-flex text-center" style="margin:30px;">
				<hr style="width:175px;">
				<h4 style="margin-left:10px; margin-right:10px;">정보 입력</h4>
				<hr style="width:175px;">
			</div>
			<div class="kakao-form d-flex justify-content-center" >
			<form action="${path}/member/naverEnroll.do" method="post" onsubmit="return fn_checkEndN();" >
				<input type="hidden" name="m_Id" value="${email}">
				<input type="hidden" name="m_Email" value="${email}">
				<input type="hidden" name="m_Pw" value="1234a">
				<input type="hidden" name="m_Name" value="${name}">
				<table>
					<tr>
						<th>전화번호</th>
						<td><input type="text" name="m_Phone" class="form-control" style="width:400px;"></td>
					</tr>
					<tr>
						<th>닉네임</th>
						<td class="nameMsg-container">
							<input type="text" id="nickname" name="m_Nickname" class="form-control">
							<span class="nameMsg ok2">사용가능한 닉네임입니다.</span>
							<span class="nameMsg no2">중복된 닉네임입니다.</span>
						</td>
					</tr>
					<tr>
						<th>종류</th>
						<td>
							<label><input type="radio" name="m_Level" value="1" >구매자</label>&emsp;&emsp;
							<label><input type="radio" name="m_Level" value="2" >배달원</label>
						</td>
					</tr>
				</table>
				<div class="d-flex justify-content-center" style="margin:30px;">
					<input class="btn btn-outline-dark" type="submit" value="완료">
				</div>
				
				
				
			</form>
			</div>
		</div>
	</div>
</section>
<script>
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

//중복 닉네임 가입 방지
function fn_checkEndN(){
	
	
	//닉네임
	let nameMsg = $(".no2").attr("name");
	
	
    if(nameMsg=="ok"){
    	alert("중복된 닉네임은 가입할 수 없습니다.");
    	return false;        	
    }
    //회원 종류 선택했는지
    else if(!$("input:radio[name=m_Level]").is(":checked")){
	    alert("회원 종류를 선택해 주세요.");
        return false; 
	}

    return true;
}  
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>>