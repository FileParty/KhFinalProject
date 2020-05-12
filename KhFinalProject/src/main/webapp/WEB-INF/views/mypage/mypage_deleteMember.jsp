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

            <div class="col-md-10 row" style="margin-top:30px">
                    
                    <div class="col-md-2"></div>

                    <div class="col-md-8">
                        <p>설명설명설명설명설명설 설명설명설명설명설명설 설명설명설명설명설명설 설명설명설명설명설명설 설명설명설명설명설명설 설명설명설명설명설명설 설명설명설명설명설명설 설명설명설명설명설명설 설명설명설명설명설명설 설명설명설명설명설명설 설명설명설명설명설명설 설명설명설명설명설명설 설명설명설명설명설명설 설명설명설명설명설명설 설명설명설명설명설명설 설명설명설명설명설명설 설명설명설명설명설명설 설명설명설명설명설명설 설명설명설명설명설명설 설명설명설명설명설명설 설명설명설명설명설명설 설명설명설명설명설명설 설명설명설명설명설명설 설명설명설명설명설명설 설명설명설명설명설명설 설명설명설명설명설명설 설명설명설명설명설명설 설명설명설명설명설명설 설명설명설명설명설명설 설명설명설명설명설명설 설명설명설명설명설명설 설명설명설명설명설명설 설명설명설명설명설명설 설명설명설명설명설명설 설명설명설명설명설명설 설명설명설명설명설명설 설명설명설명설명설명설 </p>
                        <button class="btn btn-lightgray" style="margin-left: 50%; transform: translateX(-50%);">회원탈퇴</button>
                    </div>

                    <div class="col-md-2"></div>
                    

                </div>


            </div>

            <div class="col-md-1"></div>

        </div>

    </section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>