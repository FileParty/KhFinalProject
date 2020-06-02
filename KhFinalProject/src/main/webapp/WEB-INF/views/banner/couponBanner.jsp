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
				<p class="coupon-banner-slot-machine-val-text">3000원 쿠폰</p>
			</div>
			<div class="coupon-banner-slot-machine-val">
				<input type="hidden" value="10000" class="slot-machine-value">
				<p class="coupon-banner-slot-machine-val-text">7000원 쿠폰</p>
			</div>
			<div class="coupon-banner-slot-machine-val">
				<input type="hidden" value="2000" class="slot-machine-value">
				<p class="coupon-banner-slot-machine-val-text">2000원 쿠폰</p>
			</div>
		</div>
	</div>
	<button id="slot-start-btn" onclick="slotMachineStart()">추첨하기!</button>
	<p class="slot-start-end">오늘은 이미 추첨을 했어요!</p>
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
	
	var fCheck = false;
	$(function(){
		$("#coupon-banner-main-1").show();
		let lcpCheck = "${loginType['cCheck']}";
		if(lcpCheck.length>0&&lcpCheck=='1'){
			$("#slot-start-btn").hide();
			$(".slot-start-end").show();
			fCheck = true;
		}
	})

	var scrollCheck = 0;
	var divIndex = 1;
	$(function(){
		$(".coupon-banner-mains").css({
			backgroundImage:"url('${path}/resources/img/banner/coupon-banner/coupon_bg.png')"
		});
		
		
	})
	/* 로그인 페이지로 이동 */
	function goToLoginPage(){
		location.replace("${path}/member/login.do");
	}
	
	function slotMachineStart(){
		if(fCheck){
			alert("오늘은 이미 추첨을 하셨어요!");
			return false;
		}
		fCheck = true;
		let loginCheck = "${loginType['type']}";
		let param = 1;
		let flag = false;
		if(loginCheck.length>0&&loginCheck=="m"){
			$(event.target).stop();
			var SMtop = 0;
			let rnd = Math.floor(Math.random()*5)+25;
			for(let i=0;i<rnd;i++){
				if(SMtop<=400){
					SMtop += 100;
					if(SMtop<400){
						param += 1;
						$("#slot-machine-value").animate({
							top:"-=100px"
						},50,function(){
							flag = iCheck(i,rnd,param);
							if(flag){
								return;
							}
						});
					} else {
						param = 1;
						SMtop = 0;
						$("#slot-machine-value").animate({
							top:"0px"
						},0,function(){
							flag = iCheck(i,rnd,param);
							if(flag){
								return;
							}
						});
					}
				} else {
					param = 1;
					SMtop = 0;
					$("#slot-machine-value").animate({
						top:"0px"
					},0,function(){
						flag = iCheck(i,rnd,param);
						if(flag){
							return;
						}
					});
				}
			}
			/* 라스트체크 */
		} else if(loginCheck=="b"){
			alert("일반 회원만 사용 가능합니다!");
		} else {
			$("#report-login-modal").modal("show");
		}

	}
	
	function iCheck(i,rnd,param){
		if(i>=Number(rnd)-1){
			$.ajax({
				url:"${path}/banner/couponAdd.do",
				data:{"cpNo":param,"mNo":"${loginType['no']}"},
				success:function(data){
					console.log(data);
					alert("축하합니다! 쿠폰을 받으셨어요!\n 마이페이지에서 확인하세요!");
					$("#slot-start-btn").hide();
					$(".slot-start-end").show();
					return true;
				}
			})
		} else {
			return false;
		}
	}
	
	
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>