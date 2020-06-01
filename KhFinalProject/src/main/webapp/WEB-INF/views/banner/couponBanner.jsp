<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<link rel="stylesheet" href="${path }/resources/css/loginModal.css" type="text/css">
<link rel="stylesheet" href="${path }/resources/css/couponBanner.css" type="text/css">
<style>
	@font-face{
		font-family:BMHANNA;
		src:url("${path}/resources/font/BMHANNA.ttf").format("truetype");
	}
	section{
		font-family:BMHANNA;
	}
</style>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<section>
	<div id="coupon-banner-main-1" class="coupon-banner-mains">
		<h1 id="coupon-banner-main-1-text-1">배달킹</h1>
		<h2 id="coupon-banner-main-1-text-2">런칭 이벤트</h2>
		<h2 id="coupon-banner-main-1-text-3">1인 3장! 2000원 쿠폰!</h2>
	</div>
<!-- login modal -->
<div id="report-login-modal" class="modal" tabindex="-1" role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<p class="report-login-modal-header">배달킹 알림</p>
			</div>
			<div class="modal-content">
				<p class="report-login-modal-content">로그인이 필요한 서비스입니다. 로그인 페이지로 이동하시겠어요?</p>
			</div>
			<div class="modal-footer">
				<button class="report-login-modal-btn" data-dismiss="modal">
					아니오
				</button>
				<button class="report-login-modal-btn report-login-modal-btn-bg" onclick="goToLoginPage()">
					예
				</button>
			</div>
		</div>
	</div>
</div>
</section>
<script>
	$(function(){
		let pageHeihgt = ($(window).height())-170-177;
		$(".coupon-banner-mains").css({
			height:pageHeihgt
		})
		$("#coupon-banner-main-1").css({
			backgroundImage:"url('${path}/resources/img/banner/coupon-banner/coupon-banner-1.jpg')",
		});
	})
	/* 로그인 페이지로 이동 */
	function goToLoginPage(){
		location.replace("${path}/member/login.do");
	}
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>