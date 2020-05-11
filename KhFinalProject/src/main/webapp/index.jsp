<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<section>



 
<div class="topnav">

	<a href="${path }/licensee/mypage">사업자 마페</a>
	<a href="${path }/menu/menuList.do">메뉴 리스트</a>
	<a href="${path }/pay/paylist.do">결제 리스트</a>
	<a href="${path }/menu/menuDetailView">메뉴 상세화면</a>
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
</style>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />