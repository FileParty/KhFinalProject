<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<link rel="stylesheet" href="${path }/resources/css/loginModal.css" type="text/css">
<link rel="stylesheet" href="${path }/resources/css/couponBanner.css" type="text/css">
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<section id="coupon-banner-main-1" class="coupon-banner-mains">
	<h1 id="coupon-banner-main-1-text-1">배달킹</h1>
	<h2 id="coupon-banner-main-1-text-2">런칭 이벤트! 하루에 무조건 쿠폰 한장!</h2>
	<h2 id="coupon-banner-main-1-text-3">배달킹 쿠폰룰렛!</h2>
	<div id="coupon-banner-slot-machine">
		<div id="slot-machine-value">
			<div class="coupon-banner-slot-machine-val">
				<input type="hidden" value="1000" class="slot-machine-value">
				<p class="coupon-banner-slot-machine-val-text">1000원 쿠폰</p>
			</div>
			<div class="coupon-banner-slot-machine-val">
				<input type="hidden" value="5000" class="slot-machine-value">
				<p class="coupon-banner-slot-machine-val-text">5000원 쿠폰</p>
			</div>
			<div class="coupon-banner-slot-machine-val">
				<input type="hidden" value="10000" class="slot-machine-value">
				<p class="coupon-banner-slot-machine-val-text">10000원 쿠폰</p>
			</div>
			<div class="coupon-banner-slot-machine-val">
				<input type="hidden" value="2000" class="slot-machine-value">
				<p class="coupon-banner-slot-machine-val-text">2000원 쿠폰</p>
			</div>
			<div class="coupon-banner-slot-machine-val">
				<input type="hidden" value="1000" class="slot-machine-value">
				<p class="coupon-banner-slot-machine-val-text">1000원 쿠폰</p>
			</div>
			<div class="coupon-banner-slot-machine-val">
				<input type="hidden" value="2000" class="slot-machine-value">
				<p class="coupon-banner-slot-machine-val-text">2000원 쿠폰</p>
			</div>
		</div>
	</div>
	<button onclick="slotMachineStart()">추첨하기!</button>
	<img id="coupon-banner-main-bg" src="${path}/resources/img/banner/coupon-banner/coupon_bg.png" width="1366px">
</section>
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
<script>

	$(function(){
		$("#coupon-banner-main-1").show();
	})

	var scrollCheck = 0;
	var divIndex = 1;
	$(function(){
		let pageHeight = $(window).height()-340;
		$(".coupon-banner-mains").css({
			height:pageHeight
		});
		$("#coupon-banner-main-bg").css({
			height:pageHeight
		});
		
		
	})
	/* 로그인 페이지로 이동 */
	function goToLoginPage(){
		location.replace("${path}/member/login.do");
	}
	
	
	function slotMachineStart(){
		var SMtop = 0;
		for(let i=0;i<15;i++){
			if(SMtop<=600){
				SMtop += 100;
				console.log(SMtop);
				if(SMtop<=600){
					$("#slot-machine-value").animate({
						top:"-"+SMtop+"px"
					});
				} else {
					console.log("히얏호");
					SMtop = 0;
					$("#slot-machine-value").animate({
						top:"0px"
					});
				}
			} else {
				SMtop = 0;
				$("#slot-machine-value").animate({
					top:"0px"
				});
			}
			console.log(SMtop,$("#slot-machine-value"));
		}
	}
	
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>