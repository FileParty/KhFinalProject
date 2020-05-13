<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<link rel="stylesheet" type="text/css" href="${path }/resources/css/index.css"/>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<section>


	<div class="topnav">

		<a href="${path }/licensee/mypage">사업자 피파 바페도아닌 마페</a>
		<a href="${path }/menu/menuList.do?menuCategory=치킨">메뉴 리스트</a>
		<a href="${path }/pay/paylist.do">결제 리스트</a>
		<a href="${path }/pay/paylist2.do">결제 완료 주문내역Modal</a>
		<a href="${path }/menu/menuDetailView">메뉴 상세화면</a>
		<a href="${path }/common/juso">주소</a>
		<a href="${path }/mypage/mypage.do">마이페이지</a>

	</div>
	<jsp:include page="/WEB-INF/views/common/banner.jsp"/>
	
	<div class="index-first-box container">
			
			<div class="index-search-title">
					<h2>`<span style="color: #6F6CD2;">야식</span>이 필요할 <span style="color: orange;">때는</span> 배달킹`</h2><br>
					<h6>배달 받을 동을 검색해주세요</h6>
			</div>
			
	
			<div class="index-search-container">
			
				<div class="index-search">	
				
					<div class="search-btn"><button class="location-button"><i style='font-size:30px' class='fas'>&#xf14e;</i></button></div>
					
					<div>
						<form name="form" id="form" method="post">
							<input type="hidden" name="currentPage" value="1"/> 
							<input type="hidden" name="countPerPage" value="5"/>
							<input type="hidden" name="resultType" value="json"/> 
							<input type="hidden" name="confmKey" value="devU01TX0FVVEgyMDIwMDUxMjIwMDA0MTEwOTc1MjQ="/>
							<div class="keyword-box">
								<input type="text" name="keyword" id="keyword" value="" size="40px"/>
								<input type="button" onClick="getroadAddr();" class="btn btn-success" value="검색" />
							</div>
						</form>
					</div>
	
				</div>
				
				<div class="index-search-autosearch">
					<div id="list">
					
					</div>
				</div>
				
			</div>
			
			<div class="category-list d-flex flex-wrap justify-content-center">
				<c:forEach begin="1" step="1" end="8">
					<div class="category-list-card text-center">
			
						<div class="card-img ">
							<img src="${pageContext.request.contextPath }/resources/images/category-02.png" alt="치킨" width="250" height="250">
						</div>
						
					</div>
				</c:forEach>
			</div>		
		</div>


</section>
<jsp:include page="/WEB-INF/views/common/jusoJs.jsp"/>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />