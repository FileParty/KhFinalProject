<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<section>
	<div class="container d-flex justify-content-center">
		<div class="terms-container" style="width:500px;">
			<div class="d-flex justify-content-center" style="margin:30px;">
   				<img src="${path}/resources/img/요기요.png">
			</div>
			<div class="d-flex text-center" style="width:500px; margin-top:30px; margin-bottom:30px;">
				<hr style="width:160px;">
				<h4 style="margin-left:10px; margin-right:10px;">이용약관 동의</h4>
				<hr style="width:160px;">
			</div>
			<div class="terms-body text-center">
				<div class="" >
					<label><input type="checkbox" name="개인정보" required><strong>  배달킹 사용약관</strong><span>에 동의 (필수)</span></label>
					<label><input type="checkbox" name="개인정보" required><strong>  개인정보 수집 및 이용</strong><span>에 동의 (필수)</span></label>
					<label><input type="checkbox" name="개인정보" required><strong>  개인정보 국외 이전</strong><span>에 동의 (필수)</span></label>
				</div>
			</div>
			<div class="d-flex justify-content-center" style="margin:30px;">
				<button class="btn btn-outline-dark" onclick="location.replace('${path }/member/memberEnroll2.do')">다음</button>
			</div>
		</div>
	</div>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>