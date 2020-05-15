<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<link rel="stylesheet" href="${path }/resources/css/menulist.css" type="text/css">

<jsp:include page="/WEB-INF/views/common/header.jsp"/>


	<section>
	
	<input id="menu-category" type="hidden" value="${category}"/>
	<input id="sortType" type="hidden" value="${sortType}"/>
	<input id="search" type="hidden" value="${search}"/>
	<input id="cPage" type="hidden" value="${cPage}"/>
	
	<div style="position:fixed; left:1700px; top:200px;" class="text-center">
		 	<span class="text-center d-block">
		 		최근 본 상품
		 	</span>
		 	<span class="text-center d-block">
		 		0
		 	</span>
		 	<div class="text-center">
		 		<button class="btn btn-link">
		 			<img src="${pageContext.request.contextPath }/resources/img/up.png" width="8px" height="8px"/>
		 		</button>
		 		
		 		<div>
		 			<div>
		 				<div>
		 					<c:if test="${empty recentList}">
		 						최근 본 상품<br>
		 						정보가 없습니다
		 					</c:if>
		 					
		 					<c:if test="${not empty recentList}">
		 						<c:forEach var="r" items="${recentList}">
		 							<div>
		 								<img src="${pageContext.request.contextPath }/resources/img/food.jpg"/>
		 							</div>
		 						</c:forEach>
		 					</c:if>
		 				</div>
		 			</div>
		 		</div>
		 		<button class="btn btn-link">
		 			<img src="${pageContext.request.contextPath }/resources/img/down.png" width="8px" height="8px"/>
		 		</button>
		 	</div>
		 	<button class="btn btn-link">
		 		TOP
		 	</button>
	</div>
	

		<div class="container mt-3">
			<div class="row">
				<div class="col">
					<ul class="list-group d-flex flex-row justify-content-center">
						<li class="list-group-item active" id="category-chicken">전체</li>
					  <li class="list-group-item" id="category-chicken">치킨</li>
					  <li class="list-group-item" id="category-pizza">피자</li>
					  <li class="list-group-item" id="category-chinese">중국집</li>
					  <li class="list-group-item" id="category-snack">분식</li>
					  <li class="list-group-item" id="category-korean">한식</li>
					  <li class="list-group-item" id="category-bugger">햄버거</li>
					  <li class="list-group-item" id="category-japanese">일식</li>
					</ul>
				</div>	
			
			</div>
			
			<div class="row mt-5">
				<div class="col d-flex justify-content-center">
					<nav class="navbar navbar-light bg-light justify-content-between">					 
					  <form class="form-inline">

					    <input class="form-control" type="search" id="search-name" placeholder="음식점을 검색하세요" aria-label="Search" value="${search!='null'?search:''}">
					    <button id="btn-search" class="btn btn-outline-success my-2 my-sm-0 mr-3" type="button">
					    	<img src="${pageContext.request.contextPath }/resources/img/search.svg" width="25px">
					    </button>
					    
					   <div class="dropdown">
	                   <button class="dropdown-toggle mr-3 ldBtnC bg-white text-dark rounded" type="button" id="sort" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                        	${sortType!=null and sortType!='null'?sortType:'기본 정렬순' }
	                   </button>
	                   <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
	                        <a class="dropdown-item" href="#">기본 정렬순</a>
	                        <a class="dropdown-item" href="#">별점순</a>
		                    <a class="dropdown-item" href="#">리뷰순</a>           
	                   </div>
	                	</div>
					  
					  </form>
					</nav>
	 			
					
				</div>
			
			</div>
		</div>
		
	
		 
		 <div class="menu-category-container container mt-3 p-1">
		 <c:forEach begin="1" end="5" step="1" var="i" varStatus="vsi">
		 	<div class="row category-row-${i} ml-4 mt-3 p-0 justify-content-center m-0 ${2*(i-1)>=list.size()?'d-none':''}">
		 	<c:forEach begin="1" end="2" step="1" var="j" varStatus="vsj">
		 		<div class="category-${j==1?2*(i-1):i*j-1} food-category col-5 ${2*(i-1)>=list.size() || i*j-1>=list.size() ? 'invisible':'d-flex' } align-items-center border border-secondary p-0 mr-5" style="height:130px">	 					
 					<div class="mr-4 ml-2">
 						<c:if test="${j==1 && 2*(i-1)<list.size()}">
 							<img src="${pageContext.request.contextPath }/resources/img/${list.get(2*(i-1)).getS_LOGIMG()}" class="img-thumbnail shadow-lg log-img-${2*(i-1)}" style="height:115px; width:115px;"/>												
						</c:if>
						
						<c:if test="${j==2 && i*j-1<list.size()}">
							<img src="${pageContext.request.contextPath }/resources/img/${list.get(i*j-1).getS_LOGIMG()}" class="img-thumbnail shadow-lg log-img-${i*j-1}" style="height:115px; width:115px;"/>		 								
						</c:if>
 						 
 						 <c:if test="${j==1 && 2*(i-1)>=list.size()}">
 						 	<img src="" class="img-thumbnail shadow-lg log-img-${2*(i-1)}" style="height:115px; width:115px;"/>
 						 </c:if>
 						 
 						 <c:if test="${j==2 && i*j-1>=list.size()}">
 						 	<img src="" class="img-thumbnail shadow-lg log-img-${i*j-1}" style="height:115px; width:115px;"/>
 						 </c:if>
 					</div>
 				
 					<span class="invisible store-no-${j==1?2*(i-1):i*j-1} no">
 						<c:if test="${j==1 && 2*(i-1)<list.size()}">							
 							<c:out value="${list.get(2*(i-1)).getS_NO()}"/>
						</c:if>
						<c:if test="${j==2 && i*j-1<list.size()}">		 								
							<c:out value="${list.get(i*j-1).getS_NO()}"/>
						</c:if>
 					</span>
 					
 					<div class="m-0 p-0"> 
 						<div class="category-title d-flex justify-content-between">
 							<span class="h-4 name-${j==1?2*(i-1):i*j-1}">
 								<c:if test="${j==1 && 2*(i-1)<list.size()}">							
 									<c:out value="${list.get(2*(i-1)).getS_NAME()}"/>
	 							</c:if>
 								<c:if test="${j==2 && i*j-1<list.size()}">		 								
 									<c:out value="${list.get(i*j-1).getS_NAME()}"/>
 								</c:if>
 							</span>
 							
 							<jsp:useBean id="now" class="java.util.Date"/>
 							
 							<span class="h-4 border border-danger text-danger status-${j==1?2*(i-1):i*j-1}">
 								<!-- 현재 시간 -->	
 								<fmt:formatDate value="${now}" pattern="HH:mm:ss" var="nowDate"/>
 									
 								<c:if test="${j==1 && 2*(i-1)<list.size()}">
 									<!-- 영업 시작 시간 -->
	 								<c:set value="${list.get(2*(i-1)).getS_STARTTIME()}" var="start"/>
	 								<!-- 영업 종료 시간 -->
	 								<c:set value="${list.get(2*(i-1)).getS_ENDTIME()}}" var="end"/>
	 								<!-- 문자열을 date로 파싱 -->
	 								<fmt:parseDate var="start" value="${start}" pattern="yyyy-mm-dd HH:mm:ss" />
									<fmt:parseDate var="end" value="${end}" pattern="yyyy-mm-dd HH:mm:ss" />
	 								
	 								<fmt:formatDate value="${start}" var="start_op" pattern="HH:mm:ss"/>
	 								<fmt:formatDate value="${end}" var="end_op" pattern="HH:mm:ss"/>
	 															
 									<c:out value="${now>start_op and now<end_op?'영업중':'영업 준비중'}"/>
	 							</c:if>
	 								<c:if test="${j==2 && i*j-1<list.size()}">	
	 									<!-- 영업 시작 시간 -->
	 								<c:set value="${list.get(i*j-1).getS_STARTTIME()}" var="start"/>
	 								<!-- 영업 종료 시간 -->
	 								<c:set value="${list.get(i*j-1).getS_ENDTIME()}}" var="end"/>
	 								<!-- 문자열을 date로 파싱 -->
	 								<fmt:parseDate var="start" value="${start}" pattern="yyyy-mm-dd HH:mm:ss" />
									<fmt:parseDate var="end" value="${end}" pattern="yyyy-mm-dd HH:mm:ss" />
	 								
	 								<fmt:formatDate value="${start}" var="start_op" pattern="HH:mm:ss"/>
	 								<fmt:formatDate value="${end}" var="end_op" pattern="HH:mm:ss"/>
 									 								
 									<c:out value="${now>start_op and now<end_op?'영업중':'영업 준비중'}"/>
 								</c:if>
 							</span>
 						</div>
 												
 						<div class="category-info mt-1">
 							<div class="d-flex flex-row mt-1">
 								<div class="star d-flex justify-content-center align-items-center ">
 									<span class="mr-2 text-warning score-${j==1?2*(i-1):i*j-1}">
	 									<c:if test="${j==1 && 2*(i-1)<list.size()}">												
		 										★
		 										<c:set var = "score" value="${list.get(2*(i-1)).getS_TASTE() + list.get(2*(i-1)).getS_AMOUNT() + list.get(2*(i-1)).getS_DELIVERY()}"/>						
		 										<c:set var = "score" value="${score/3/list.get(2*(i-1)).getS_REVIEWCOUNT() }"/>
		 										
		 										<fmt:formatNumber value="${score }" pattern=".00"/>					
		 								</c:if>
		 								
		 								<c:if test="${j==2 && i*j-1<list.size()}">	
		 										★
		 										<c:set var = "score" value="${list.get(2*(i-1)).getS_TASTE() + list.get(2*(i-1)).getS_AMOUNT() + list.get(2*(i-1)).getS_DELIVERY()}"/>						
		 										<c:set var = "score" value="${score/3/list.get(2*(i-1)).getS_REVIEWCOUNT() }"/>						
		 										<fmt:formatNumber value="${score }" pattern=".00"/>	
		 								</c:if>
	 								</span>
 								</div>
 								
 								<div>
 									<span class="mr-2 " style="color:grey;">|</span>
 								</div>
 								
 								<div>
 									<span class="review-${j==1?2*(i-1):i*j-1}">
	 									<c:if test="${j==1 && 2*(i-1)<list.size()}">	 										
	 										리뷰 <c:out value="${list.get(2*(i-1)).getS_REVIEWCOUNT()}"/>	 										
	 									</c:if>
	 									
	 									<c:if test="${j==2 && i*j-1<list.size()}">	 										
	 										리뷰 <c:out value="${list.get(i*j-1).getS_REVIEWCOUNT()}"/>	 										
	 									</c:if>	
 									</span>							
 								</div>		 										 		
 							</div>
 						</div>
 						
 						<div class="category-deliveryInfo mt-1">
 							<span class="text-secondary limit-price-${j==1?2*(i-1):i*j-1}">
 								<c:if test="${j==1 && 2*(i-1)<list.size()}">
 									<c:out value="${list.get(2*(i-1)).getS_LIMITPRICE()}"/> 이상 배달
 								</c:if>
 								
 								<c:if test="${j==2 && i*j-1<list.size()}">
 									<c:out value="${list.get(i*j-1).getS_LIMITPRICE()}"/> 이상 배달
 								</c:if>
 							</span>
 						</div>
 						
 						<div class="category-deliveryTime mt-1">
 							<span class="border border-danger text-danger mr-5">
 								쿠폰 적용 가능
 							</span>		
 											
 							<span class="ml-5 text-secondary time-${j==1?2*(i-1):i*j-1}">
 								<c:if test="${j==1 && 2*(i-1)<list.size()}">
 									<c:out value="${list.get(2*(i-1)).getS_TIME()}"/>~<c:out value="${list.get(2*(i-1)).getS_TIME()+5}분"/>
 								</c:if>
 								<c:if test="${j==2 && i*j-1<list.size()}">
 									<c:out value="${list.get(i*j-1).getS_TIME()}"/>~<c:out value="${list.get(2*(i-1)).getS_TIME()+5}분"/>
 								</c:if>
 							</span>
 						</div>
 					</div>					
		 		</div>
		 	</c:forEach>
		 	</div>
		 </c:forEach>			
		</div>
		
		<div class="container mt-3 page-bar">
		<!-- <div class="row justify-content-center">
			<nav aria-label="..." class="justify-content-center">
			  <ul class="pagination">
			    <li class="page-item disabled">
			      <a class="page-link" href="#" tabindex="-1">&lt</a>
			    </li>		    
			    <li class="page-item active">
			      <a class="page-link" href="#">1</a>
			    </li>
			    <li class="page-item"><a class="page-link" href="#">2</a></li>
			    <li class="page-item"><a class="page-link" href="#">3</a></li>
			     <li class="page-item"><a class="page-link" href="#">4</a></li>
			      <li class="page-item"><a class="page-link" href="#">5</a></li>
			    <li class="page-item">
			      <a class="page-link" href="#">&gt</a>
			    </li>
			  </ul>
			</nav>
			</div> -->
			${pageBar}
		</div>
		
	</section>
	
<jsp:include page="/WEB-INF/views/menu/menulistjs.jsp">
	<jsp:param name="cate" value="${cate}"></jsp:param>
</jsp:include>	
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>