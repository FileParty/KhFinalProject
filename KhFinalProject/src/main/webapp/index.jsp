<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<section>
	<div class="topnav">
		<a href="${path }/licensee/mypage">사업자 피파 바페도아닌 마페</a>
		<a href="${path }/menu/menuList.do">메뉴 리스트</a>
		<a href="${path }/pay/paylist.do">결제 리스트</a>
		<a href="${path }/menu/menuDetailView">메뉴 상세화면</a>
	</div>
	<div class="container text-center">
			<div class="d-flex justify-content-center">
				<jsp:include page="/WEB-INF/views/common/banner.jsp"/>
			</div>
			<div class="search-container d-flex justify-content-center">
				<div class="search-container-box d-flex">	
					<button class="location-button">⊙</button>
					<form action="#">
						<input class="search-input" type="text">
						<input type="submit" value="검색">
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




<style>
.topnav {
    overflow: hidden;
    background-color: rgb(253, 68, 68);
}
.topnav a {
    float: left;
    display: block;
    color: #f2f2f2;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
}
/* Change color on hover */
.topnav a:hover {
    background-color: rgb(161, 247, 122);
    color: black;
}
@media screen and (max-width: 400px) {
    .topnav a {
        float: none;
        width: 100%;
    }
}
.container{
 	border : solid 1px black;
 }
 .category-list-card{
 	/* border : solid 1px black; */
 	width : 250px;
 	height : 250px;
 	margin : 5px; 
 }
 .search-container{
 	border : solid 1px black;
 	margin : 30px;
 }
 .card-title{
 	border : solid 1px black;
 	 position: relative;
 	
 }
   /* Make the image fully responsive */
  .carousel-inner img {
      width: 1045px;
      height: 300px;
     
  }
  .carousel{
  	  width: 1045px;
  	  height:300px;
  	  margin-top: 30px;
  }
  .card-img {
  transform: scale(1);
  -webkit-transform: scale(1);
  -moz-transform: scale(1);
  -ms-transform: scale(1);
  -o-transform: scale(1);
  transition: all 0.3s ease-in-out;   /* 부드러운 모션을 위해 추가*/
  }
  .card-img:hover {
  transform: scale(1.2);
  -webkit-transform: scale(1.2);
  -moz-transform: scale(1.2);
  -ms-transform: scale(1.2);
  -o-transform: scale(1.2); 
  }
  .card-img img {width:250px; height:250px; overflow:hidden }   /* 부모를 벗어나지 않고 내부 이미지만 확대 */
</style>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />