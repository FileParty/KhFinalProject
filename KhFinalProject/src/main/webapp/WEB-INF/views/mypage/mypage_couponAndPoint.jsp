<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<style>
	    /*중복아이디체크관련*/
		    div#idMsg-container{position:relative; padding:0px;}
		    div#idMsg-container span.idMsg{display:none;font-size: 12px;position:absolute; top:12px; right:10px;}
		    div#idMsg-container span.ok{color:green;}
		    div#idMsg-container span.no{color:red;}
</style>

<section>

    <div class="row">
        <div class="col-md-1"></div>

        <div class="row col-md-10">

            <jsp:include page="/WEB-INF/views/mypage/mypageSidebar.jsp"/>

            <div class="col-md-10 row">
                    
                    <div class="col-md-12">
                        <h4>현재포인트: ${loginMember.m_point }</h4>
                        <hr>
                    </div>

					<c:forEach items="${list }" var="cn">
	                    <div class="col-md-6 row"> 
	                        
	
	                        <div class="col-md-2"></div>
	                        <div class="col-md-8" style="border: 1px solid black; height:200px;">
	
	                    		<h4 style="text-align: center;">${cn['CN_NAME'] }</h4>
	                            <h4 style="text-align: center;">${cn['CN_PRICE'] }원 할인</h4>
	                            <p style="text-align: center;"><strong>${cn['CN_ENROLLDATE'] } ~ ${cn['CN_EXPIRE'] }</strong></p>
	                                
	                            <img style="margin-left: 50%; transform: translateX(-50%);" src="${path }/resources/img/mypage/coupon/AA.PNG" onclick=""/>
	                            <p style="text-align: center;"><strong>${cn['CN_LIMITPRICE'] }원 이상 주문 시 사용가능</strong></p>
	
	                        </div>
	                        <div class="col-md-2"></div>
	
	                    </div>
                    </c:forEach>

                </div>


            </div>

            <div class="col-md-1"></div>

        </div>

    </section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>