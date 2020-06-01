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
<div style="transform: translateY(0%); transition: all 0.7s ease 0s;" id="main">
	<section id="coupon-banner-main-1" class="coupon-banner-mains">
		<h1 id="coupon-banner-main-1-text-1">배달킹</h1>
		<h2 id="coupon-banner-main-1-text-2">런칭 이벤트</h2>
		<h2 id="coupon-banner-main-1-text-3">배달킹 쿠폰팩!</h2>
		<h2 id="coupon-banner-main-1-text-end">스크롤을 내려보세요!</h2>
	</section>
	<section id="coupon-banner-main-2" class="coupon-banner-mains">
		<h1 id="coupon-banner-main-2-text-1">배달킹 쿠폰팩을 열어보세요!</h1>
		<h2 id="coupon-banner-main-2-text-2">하루에 3개씩 열 수 있습니다!</h2>
		<div id="coupon-banner-main-pack">
			<img width="250px" height="400px" src="">
			<h2 id="coupon-banner-main-2-text-3">← 쿠폰팩 열기!</h2>
		</div>
	</section>
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
<script>

	var scrollCheck = 0;
	var divIndex = 1;
	$(function(){
		let pageHeihgt = ($(window).height())-343;
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
	
	/* 스크롤 페이지 전환 */
	/* $(window).scroll(function(){
		let flag = $(window).scrollTop()-scrollCheck >= 0 ? 1 : -1;
		srcollDivChange(flag);
		scrollCheck = $(window).scrollTop();
		setTimeout(srcollDivChange(flag),150);
	})
	
	function srcollDivChange(flag){
		console.log(flag);
		if(flag>0){
			if(divIndex<2){
				$("#coupon-banner-main-"+divIndex).hide();
				divIndex++;
				$("#coupon-banner-main-"+divIndex).show();
			}
		}else {
			if(divIndex>1){
				$("#coupon-banner-main-"+divIndex).hide();
				divIndex--;
				$("#coupon-banner-main-"+divIndex).show();
			}
		}
	} */
</script>
<script>

/**
 * Full page
 */
 (function () {
	'use strict';
	
	/**
	 * Full scroll main function
	 */
	var fullScroll = function (params) {
		/**
		 * Main div
		 * @type {Object}
		 */
		var main = document.getElementById('main');
		
		/**
		 * Sections div
		 * @type {Array}
		 */
		var sections = main.getElementsByTagName('section');
		
		/**
		 * Full page scroll configurations
		 * @type {Object}
		 */
		var defaults = {
			container : main,
			sections : sections,
			animateTime : params.animateTime || 0.7,
			animateFunction : params.animateFunction || 'ease',
			maxPosition: sections.length - 1,
			currentPosition: 0,
			displayDots: typeof params.displayDots != 'undefined' ? params.displayDots : true,
			dotsPosition: params.dotsPosition || 'left'
		};

		this.defaults = defaults;
		/**
		 * Init build
		 */
		this.init();
	};

	/**
	 * Init plugin
	 */
	fullScroll.prototype.init = function () {
		this.buildSections()
			.buildDots()
			.buildPublicFunctions()
			.addEvents();

		var anchor = location.hash.replace('#', '').split('/')[0];
		location.hash = 0;
		this.changeCurrentPosition(anchor);
	};

	/**
	 * Build sections
	 * @return {Object} this(fullScroll)
	 */
	fullScroll.prototype.buildSections = function () {
		var sections = this.defaults.sections;
		for (var i = 0; i < sections.length; i++) {
			sections[i].setAttribute('data-index', i);
		}
		return this;
	};

	/**
	 * Build dots navigation
	 * @return {Object} this (fullScroll)
	 */
	fullScroll.prototype.buildDots = function () {		
		this.ul = document.createElement('ul');
		this.ul.classList.add('dots');
		this.ul.classList.add(this.defaults.dotsPosition == 'right' ? 'dots-right' : 'dots-left');
		var _self = this;
		var sections = this.defaults.sections;		

		for (var i = 0; i < sections.length; i++) {
			var li = document.createElement('li');
			var a = document.createElement('a');
		
			a.setAttribute('href', '#' + i);			
			li.appendChild(a);
			_self.ul.appendChild(li);
		}

		this.ul.childNodes[0].firstChild.classList.add('active');

		if (this.defaults.displayDots) {
			document.body.appendChild(this.ul);
		}

		return this;
	};

	/**
	 * Add Events
	 * @return {Object} this(fullScroll)
	 */
	fullScroll.prototype.addEvents = function () {
		
		if (document.addEventListener) {
			document.addEventListener('mousewheel', this.mouseWheelAndKey, false);
			document.addEventListener('wheel', this.mouseWheelAndKey, false);
			document.addEventListener('keyup', this.mouseWheelAndKey, false);
			document.addEventListener('touchstart', this.touchStart, false);
			document.addEventListener('touchend', this.touchEnd, false);
			window.addEventListener("hashchange", this.hashChange, false);

			/**
			 * Enable scroll if decive don't have touch support
			 */
			if(/Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent)) {
				if(!('ontouchstart' in window)){
					document.body.style = "overflow: scroll;";
					document.documentElement.style = "overflow: scroll;";
				}
			}			

		} else {
			document.attachEvent('onmousewheel', this.mouseWheelAndKey, false);
			document.attachEvent('onkeyup', this.mouseWheelAndKey, false);
		}
		
		return this;
	};	

	/**
	 * Build public functions
	 * @return {[type]} [description]
	 */
	fullScroll.prototype.buildPublicFunctions = function () {
		var mTouchStart = 0;
		var mTouchEnd = 0;
		var _self = this;

		this.mouseWheelAndKey = function (event) {
			if (event.deltaY > 0 || event.keyCode == 40) {	
				_self.defaults.currentPosition ++;
				_self.changeCurrentPosition(_self.defaults.currentPosition);				
			} else if (event.deltaY < 0 || event.keyCode == 38) {
				_self.defaults.currentPosition --;
				_self.changeCurrentPosition(_self.defaults.currentPosition);	
			}
			_self.removeEvents();
		};

		this.touchStart = function (event) {
			mTouchStart = parseInt(event.changedTouches[0].clientY);
			mTouchEnd = 0;
		};

		this.touchEnd = function (event) {
			mTouchEnd = parseInt(event.changedTouches[0].clientY);
			if (mTouchEnd - mTouchStart > 100 || mTouchStart - mTouchEnd > 100) {
				if (mTouchEnd > mTouchStart) {
					_self.defaults.currentPosition --;
				} else {
					_self.defaults.currentPosition ++;					
				}
				_self.changeCurrentPosition(_self.defaults.currentPosition);
			}			
		};

		this.hashChange = function (event) {
			if (location) {
				var anchor = location.hash.replace('#', '').split('/')[0];
				if (anchor !== "") {
					if (anchor < 0) {
						_self.changeCurrentPosition(0);
					} else if (anchor > _self.defaults.maxPosition) {
						_self.changeCurrentPosition(_self.defaults.maxPosition);
					} else {
						_self.defaults.currentPosition = anchor;
						_self.animateScroll();
					}					
				}				
			}
		};

		this.removeEvents = function () {
			if (document.addEventListener) {
			document.removeEventListener('mousewheel', this.mouseWheelAndKey, false);
			document.removeEventListener('wheel', this.mouseWheelAndKey, false);
			document.removeEventListener('keyup', this.mouseWheelAndKey, false);
			document.removeEventListener('touchstart', this.touchStart, false);
			document.removeEventListener('touchend', this.touchEnd, false);

			} else {
				document.detachEvent('onmousewheel', this.mouseWheelAndKey, false);
				document.detachEvent('onkeyup', this.mouseWheelAndKey, false);
			}

			setTimeout(function(){
				_self.addEvents();
			}, 600);
		};

		this.animateScroll = function () {
			var animateTime = this.defaults.animateTime;
			var animateFunction = this.defaults.animateFunction;
			var position = this.defaults.currentPosition * 100;

			this.defaults.container.style.webkitTransform = 'translateY(-' + position + '%)';
			this.defaults.container.style.mozTransform = 'translateY(-' + position + '%)';
			this.defaults.container.style.msTransform = 'translateY(-' + position + '%)';
			this.defaults.container.style.transform = 'translateY(-' + position + '%)';
			this.defaults.container.style.webkitTransition = 'all ' + animateTime + 's ' + animateFunction;
			this.defaults.container.style.mozTransition = 'all ' + animateTime + 's ' + animateFunction;
			this.defaults.container.style.msTransition = 'all ' + animateTime + 's ' + animateFunction;
			this.defaults.container.style.transition = 'all ' + animateTime + 's ' + animateFunction;

			for (var i = 0; i < this.ul.childNodes.length; i++) {
					this.ul.childNodes[i].firstChild.classList.remove('active');
					if (i == this.defaults.currentPosition) {
					this.ul.childNodes[i].firstChild.classList.add('active');		
				}
			}
		};

		this.changeCurrentPosition = function (position) {
			if (position !== "") {
				_self.defaults.currentPosition = position;
				location.hash = _self.defaults.currentPosition;
			}	
		};

		return this;
	};
	window.fullScroll = fullScroll;
})();		


	
	new fullScroll({
		displayDots: true,
		dotsPosition: 'left',
		animateTime: 0.7,
		animateFunction: 'ease'
	});

</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>