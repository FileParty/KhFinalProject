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
		    
		    #card{
		    	color:rgb(34, 190, 241);
		    }
</style>

<section>

    <div class="row">
        <div class="col-md-1"></div>

        <div class="row col-md-10">

            <jsp:include page="/WEB-INF/views/mypage/mypageSidebar.jsp"/>

            <div id="cardDiv" class="col-md-10 row">
                    
                    <div class="col-md-6" style="margin-top:10px; height:250px;">
                        <div style="width: 100%; height: 100%;">
                            <img src="https://image.zdnet.co.kr/2016/01/25/sontech_4ebPRpxxlTpN.jpg" alt="" width="80%" height="60%" style="margin-left: 50%; transform: translateX(-50%);">
                            <button class="btn btn-lightgray" style="margin-left: 50%; transform: translateX(-50%); margin-top: 10px">삭제</button>
                        </div>
                    </div>

                    <div class="col-md-6" style="margin-top:10px; height:250px;">
                        <div style="width: 100%; height: 100%;">
                            <button style="margin-left: 50%; transform: translateX(-50%); width: 80%; height: 80%;"><img src="newCard.PNG" alt="" width="100%" height="100%" style="margin-left: 50%; transform: translateX(-50%);"></button>
                        </div>
                    </div>

                </div>


            </div>

            <div class="col-md-1"></div>

        </div>

    </section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>