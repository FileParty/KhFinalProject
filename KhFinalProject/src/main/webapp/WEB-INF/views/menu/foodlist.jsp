<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</head>
<body>
	<section>
	<div style="position:fixed; left:1200px; top:16px;" class="text-center">
		 	<span class="text-center d-block">
		 		최근 본 상품
		 	</span>
		 	<span class="text-center d-block">
		 		0
		 	</span>
		 	<div class="text-center">
		 		<button class="btn btn-link">
		 			<img src="${pageContext.request.contextPath }/resources/images/up.png" width="8px" height="8px"/>
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
		 								<img src="${pageContext.request.contextPath }/resources/images/food.jpg"/>
		 							</div>
		 						</c:forEach>
		 					</c:if>
		 				</div>
		 			</div>
		 		</div>
		 		<button class="btn btn-link">
		 			<img src="${pageContext.request.contextPath }/resources/images/down.png" width="8px" height="8px"/>
		 		</button>
		 	</div>
		 	<button class="btn btn-link">
		 		TOP
		 	</button>
	</div>
	
		<script>
			$(function(){
	
				$(".category").hover(function(){
					/* $(this).find("h2").css("background-color", "black");
					$(this).find("h2").css("color", "white"); */
					$(this).find("h2").attr("style", "cursor:pointer");
					$(this).find("h2").addClass("text-white");
					$(this).find("h2").addClass("bg-dark");
				},function(){
					/* $(this).find("h2").css("background-color", "white");
					$(this).find("h2").css("color", "black"); */
					$(this).find("h2").removeClass("text-white");
					$(this).find("h2").removeClass("bg-dark");
				});
				
				$(".food-category").hover(function(){
					$(this).attr("style", "cursor:pointer; height:130px; opacity:0.4;");
				}, function(){
					$(this).attr("style", "cursor:pointer; height:130px;");
				});
				
				//dropdown 선택시 바꾸게 하기
				$(".dropdown-item").click(function(){
					var val = $(this).html();
					console.log(val);
					$(this).parent().prev().html(val);
				});
				
				//메뉴 클릭시 controller로 넘겨주기
				$(".category").click(function(){
					//매핑값 설정
					var category = $(this).attr("id");
					console.log(category);
					//cateogry 같이 넘겨주기
					//location.replace("category/categorylist.do?"+category);
				})
				
				//foodcategory 클릭시 controller로 넘겨주기
				$(".food-category").click(function(){
					
					//매핑값 설정 해주세요 ^^
					
					//location.replace("");
				});
				
				//메뉴 호버시 포인터
				$(".list-group-item").hover(function(){
					$(this).attr("style", "cursor:pointer;");
				}, function(){
					$(this).attr("style", "cursor:pointer;");
				});
				
				//메뉴 클릭시 active 변화
				$(".list-group-item").click(function(){
					$(this).siblings().removeClass("active");
					$(this).addClass("active");
				});
			})
		</script>
		<div class="container mt-3">
			<div class="row">
			<div class="col">
				<ul class="list-group d-flex flex-row justify-content-center">
				  <li class="list-group-item active" id="category-chicken">치킨</li>
				  <li class="list-group-item" id="category-pizza">피자</li>
				  <li class="list-group-item" id="category-chinese">중국집</li>
				  <li class="list-group-item" id="category-snack">분식</li>
				  <li class="list-group-item" id="category-korean">한식</li>
				  <li class="list-group-item" id="category-bugger">햄버거</li>
				  <li class="list-group-item" id="category-japanese">일식</li>
				</ul>
			</div>	
				<!-- <div class="col category m-0 p-0 text-center" id="category-chicken"><h2>치킨</h2></div>
				<div class="col category m-0 p-0 text-center" id="category-piza"><h2>피자</h2></div>
				<div class="col category m-0 p-0 text-center" id="category-chinese"><h2>중국집</h2></div>
				<div class="col category m-0 p-0 text-center" id="category-snack"><h2>분식</h2></div>
				<div class="col category m-0 p-0 text-center" id="category-korean"><h2>한식</h2></div>
				<div class="col category m-0 p-0 text-center" id="category-bugger"><h2>햄버거</h2></div>
				<div class="col category m-0 p-0 text-center" id="category-japanese"><h2>일식</h2></div> -->
			</div>
			
			<div class="row mt-5">
				<div class="col d-flex justify-content-center">
					<nav class="navbar navbar-light bg-light justify-content-between">					 
					  <form class="form-inline">

					    <input class="form-control" type="search" id="search-name" placeholder="음식점을 검색하세요" aria-label="Search">
					    <button id="btn-search" class="btn btn-outline-success my-2 my-sm-0 mr-3" type="submit">
					    	<img src="${pageContext.request.contextPath }/resources/images/search.svg" width="25px">
					    </button>
					    
					   <div class="dropdown">
	                   <button class="dropdown-toggle mr-3 ldBtnC bg-white text-dark rounded" type="button" id="lo" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                        	기본 정렬순
	                   </button>
	                   <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
	                        <a class="dropdown-item" href="#">기본 정렬순</a>
	                        <a class="dropdown-item" href="#">별점순</a>
		                    <a class="dropdown-item" href="#">리뷰순</a>
		                    <a class="dropdown-item" href="#">거리순</a>           
	                   </div>
	                	</div>
					  
					  </form>
					</nav>
	 			
					
				</div>
			
			</div>
		</div>
		
		 <style>
		 	* {
                /*모든 요소 초기화*/
                border-collapse: collapse;
                margin: 0px;
                padding: 0px;
                text-decoration: none;
                color: black;
                list-style: none;
            }
            
		 	/* .row{
		 		border : solid 1px black;
		 	}
		 	
		 	.col-5{
		 		border : solid 1px red;
		 	} */
		 	.food-category{
		 		
		 	}
		 </style>
		 
		 <div class="container mt-3  p-1">
		 <c:forEach begin="1" end="5" step="1" var="i">
		 	<div class="row ml-4 mt-3 p-0 justify-content-center m-0">
		 	<c:forEach begin="1" end="2" step="1" var="j">
		 		<div class="food-category col-5 d-flex align-items-center border border-secondary p-0 mr-5" style="height:130px">	 					
 					<div class="mr-4 ml-2">
 						<img src="${pageContext.request.contextPath }/resources/images/food.jpg" class="img-thumbnail shadow-lg" style="height:115px; width:115px;"/> 
 					</div>
 				
 					
 					<div class="m-0 p-0"> 
 						<div class="category-title">
 							<span class="h-4">
 								<c:if test="${j==1}">							
 									<c:out value="${list.get(2*(i-1)).getTitle()}"/>
	 							</c:if>
 								<c:if test="${j==2}">		 								
 									<c:out value="${list.get(i*j-1).getTitle()}"/>
 								</c:if>
 							</span>
 						</div>
 						
 						
 						<div class="category-info mt-1">
 							<div class="d-flex flex-row mt-1">
 								<div class="star d-flex justify-content-center align-items-center ">
 									<c:if test="${j==1}">
 										<span class="mr-2 text-warning">		
	 										★						
	 										<c:out value="${list.get(2*(i-1)).getStar()}"/>
	 									</span>
	 								</c:if>
	 								
	 								<c:if test="${j==2}">
	 									<span class="mr-2 text-warning">
	 										★
	 										<c:out value="${list.get(i*j-1).getStar()}"/>
	 									</span>
	 								</c:if>
 								</div>
 								
 								<div>
 									<span class="mr-2 " style="color:grey;">|</span>
 								</div>
 								
 								<div>
 									<c:if test="${j==1}">
 										<span>
 											리뷰 <c:out value="${list.get(2*(i-1)).getReviewCount()}"/>
 										</span>
 									</c:if>
 									
 									<c:if test="${j==2}">
 										<span>
 											리뷰 <c:out value="${list.get(i*j-1).getReviewCount()}"/>
 										</span>
 									</c:if>								
 								</div>		 										 		
 							</div>
 						</div>
 						
 						<div class="category-deliveryInfo mt-1">
 							<span class="text-secondary">
 								<c:if test="${j==1}">
 									<c:out value="${list.get(2*(i-1)).getDeleveryMinCharge()}"/> 이상 배달
 								</c:if>
 								
 								<c:if test="${j==2}">
 									<c:out value="${list.get(i*j-1).getDeleveryMinCharge()}"/> 이상 배달
 								</c:if>
 							</span>
 						</div>
 						
 						<div class="category-deliveryTime mt-1">
 							<span class="border border-danger text-danger mr-5">
 								쿠폰 적용 가능
 							</span>		
 											
 							<span class="ml-5 text-secondary">
 								<c:if test="${j==1}">
 									<c:out value="${list.get(2*(i-1)).getDeleveryTime()}"/>~<c:out value="${list.get(2*(i-1)).getDeleveryTime()+5}분"/>
 								</c:if>
 								<c:if test="${j==2}">
 									<c:out value="${list.get(i*j-1).getDeleveryTime()}"/>~<c:out value="${list.get(2*(i-1)).getDeleveryTime()+5}분"/>
 								</c:if>
 							</span>
 						</div>
 					</div>					
		 		</div>	
		 	</c:forEach>	
		 	</div>
		 </c:forEach>			
		</div>
		
		<div class="container mt-3">
		<div class="row justify-content-center">
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
			</div>
		</div>
		
		<script>
		//선택된 페이지 변화 
			$(function(){
				$(".page-item").click(function(){
					$(this).siblings().removeClass("active");
					$(this).addClass("active");		
				});
			})
		</script>
	</section>

</body>
</html>