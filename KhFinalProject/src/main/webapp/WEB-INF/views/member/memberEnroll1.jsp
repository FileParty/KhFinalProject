<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<section>
	<div class="container d-flex justify-content-center">
		<div class="terms-container" style="width:600px; border:1px solid black; margin-top:50px;">
			<div class="d-flex justify-content-center" style="margin:30px;">
   				<img class="rounded-circle" style="margin:5px;width:100px;height:100px;cursor: pointer;"
					alt="rogo" src="${pageContext.request.contextPath }/resources/img/king.png">
			</div>
			<div class="d-flex text-center" style="margin:30px;">
				<hr style="width:160px;">
				<h4 style="margin-left:10px; margin-right:10px;">이용약관 동의</h4>
				<hr style="width:160px;">
			</div>
			<div class="terms-body d-flex justify-content-center">
				<form action="${path }/member/memberEnroll2.do" method="post">
				<table>
					<tr>
						<td><label><input type="checkbox" name="개인정보" required><strong>  배달킹 사용약관</strong><span>에 동의 (필수)</span></label></td>
					</tr>
					<tr>
						<td><label><input type="checkbox" name="개인정보" required><strong>  개인정보 수집 및 이용</strong><span>에 동의 (필수)</span></label></td>
					</tr>
					<tr>
						<td><label><input type="checkbox" name="개인정보" required><strong>  개인정보 국외 이전</strong><span>에 동의 (필수)</span></label></td>
					</tr>
					<tr>
						<td><label><input type="checkbox" name="개인정보" required><strong>  정호한테 치킨사주는 것</strong><span>에 동의 (필수)</span></label></td>
					</tr>
				</table>
			</div>
			<div class="d-flex justify-content-center" style="margin:30px;">
				<input type="submit" value="다음" class="btn btn-outline-dark">
			</div>
			</form>
		</div>
	</div>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>