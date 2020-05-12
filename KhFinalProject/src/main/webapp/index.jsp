<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<link rel="stylesheet" type="text/css" href="${path }/resources/css/index.css"/>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<section>


	<div class="topnav">

		<a href="${path }/licensee/mypage">사업자 피파 바페도아닌 마페</a>
		<a href="${path }/menu/menuList.do?menuCategory=치킨">메뉴 리스트</a>
		<a href="${path }/pay/paylist.do">결제 리스트</a>
		<a href="${path }/menu/menuDetailView">메뉴 상세화면</a>
		<a href="${path }/common/juso">주소</a>
		<a href="${path }/mypage/mypage.do">마이페이지</a>

	</div>
	<jsp:include page="/WEB-INF/views/common/banner.jsp"/>
	
	<div class="container text-center">
	
	
			<div class="search-container d-flex justify-content-center">
				<div class="search-container-box d-flex">	
					<button class="location-button">⊙</button>
					<form id="form" name="form" method="post">
						<input type="hidden" id="confmKey" name="confmKey" value=""/>
						<input type="hidden" id="returnUrl" name="returnUrl" value=""/>
						<input type="hidden" id="resultType" name="resultType" value=""/>
					</form>
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

<jsp:include page="/WEB-INF/views/common/footer.jsp" />