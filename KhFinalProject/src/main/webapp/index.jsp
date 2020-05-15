<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<link rel="stylesheet" type="text/css" href="${path }/resources/css/index.css"/>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0c4555610509aaa6cfd5fae61f00a23f&libraries=services"></script>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<section>


	<div class="topnav">

		<a href="${path }/licensee/mypage">사업자 피파 바페도아닌 마페</a>
		<a href="${path }/menu/menuList.do?menuCategory=치킨">메뉴 리스트</a>
		<a href="${path }/pay/paylist.do">결제 리스트</a>
		<a href="${path }/pay/paylist2.do">결제 완료 주문내역Modal</a>
		<a href="${path }/menu/menuDetailView">참새올드 하약물빵</a>
		<a href="${path }/common/juso">주소</a>
		<a href="${path }/mypage/mypage.do">마이페이지</a>

	</div>
	<jsp:include page="/WEB-INF/views/common/banner.jsp"/>
	
	<div class="index-first-box container">
			
			<div class="index-search-title">
					<h2>`<span style="color: #6F6CD2;">야식</span>이 필요할 <span style="color: orange;">때는</span> 배달킹`</h2><br>
					<h6>배달 받을 동을 검색해주세요</h6><br>
					<p>정확한 주소를 입력하시거나 나침반을 클릭하면 현재 위치를 받을수 있습니다</p>
			</div>
		
	
			<div class="index-search-container">
						
						
				<div class="index-search">
				
				
					<div class="search-btn"><button class="location-button" onclick="getbrowserxy();"><i style='font-size:30px' class='fas'>&#xf14e;</i></button></div>
					
				
					<div>
						<form name="form" id="form" method="post"  onsubmit="return false">
							<input type="hidden" name="currentPage" value="1"/> 
							<input type="hidden" name="countPerPage" value="5"/>
							<input type="hidden" name="resultType" value="json"/> 
							<input type="hidden" name="confmKey" value="devU01TX0FVVEgyMDIwMDUxMjIwMDA0MTEwOTc1MjQ="/>
							<div class="keyword-box">
								<input type="text" name="keyword" id="keyword" value="" onkeydown="enterSearch();" autocomplete="off" size="40px"/>
								<input type="button" onClick="getroadAddr();" class="btn btn-success"  value="검색" />
							</div>
						</form>
					</div>
	
				</div>
				
				<div class="index-search-autosearch">
					<div id="list">
					</div>
					<div>
						<input type="hidden" value="" name="xl" id="xl"/>
						<input type="hidden" value="" name="yl" id="yl"/>
			
					</div>
				</div>
				
			</div>
			
			<div class="index-category-list  flex-wrap">
			
					<div class="index-category-img" onclick="selectCategory('전체');">
							<div class="index-category-title">전체보기</div>
							<img src="${path }/resources/img/all.jpg" alt="전체보기" width="100%" height="210px">	
					</div>
			
				
					<div class="index-category-img" onclick="selectCategory('치킨');">
							<div class="index-category-title">치킨</div>
							<img src="${path }/resources/img/chicken.png" alt="치킨" width="100%" height="210px">	
					</div>
					
					<div class="index-category-img" onclick="selectCategory('피자');">
							<div class="index-category-title">피자</div>
							<img src="${path }/resources/img/pizza.png" alt="피자" width="100%" height="210px">	
					</div>
					
					
					<div class="index-category-img" onclick="selectCategory('중국집');">
							<div class="index-category-title">중국집</div>
							<img src="${path }/resources/img/Jajangmyeon.png" alt="중국집" width="100%" height="210px">	
					</div>
					
					<div class="index-category-img" onclick="selectCategory('분식');">
							<div class="index-category-title">분식</div>
							<img src="${path }/resources/img/chicken.png" alt="분식" width="100%" height="210px">	
					</div>
						
					<div class="index-category-img" onclick="selectCategory('한식');">
							<div class="index-category-title">한식</div>
							<img src="${path }/resources/img/korea.png" alt="한식" width="100%" height="210px">
					</div>
					
					<div class="index-category-img" onclick="selectCategory('햄버거');">
							<div class="index-category-title">햄버거</div>
							<img src="${path }/resources/img/hamburger.png" alt="햄버거" width="100%" height="210px">	
					</div>
					
					<div class="index-category-img" onclick="selectCategory('일식');">
							<div class="index-category-title">일식</div>
							<img src="${path }/resources/img/Japan.jpg" alt="일식" width="100%" height="210px">
					</div>
					
					<div class="index-category-img">
							<img src="${path }/resources/img/baemin.png" alt="이미지" width="100%" height="250px">	
					</div>
			</div>		
		</div>
		
		

</section>
<jsp:include page="/WEB-INF/views/common/jusoJs.jsp"/>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />