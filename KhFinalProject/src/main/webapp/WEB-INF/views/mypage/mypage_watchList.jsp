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

                    <div class="col-md-6 row" style="height:220px;">

                        <div class="col-md-2"></div>
                        <div class="col-md-9" style="border: 1px solid black; height:220px;">
                            <p style="text-align: center;"><strong>바나프레소</strong></p>
                            <table style="width:100%">
                                <tr>
                                    <td>
                                        	별점 &nbsp;&nbsp;&nbsp;리뷰 1366
                                    </td>
                                    <td>
                                        <p style="text-align: right; width:100%"><svg class="bi bi-x" width="30px" height="30px" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg" onclick="">
                                            <path fill-rule="evenodd" d="M11.854 4.146a.5.5 0 010 .708l-7 7a.5.5 0 01-.708-.708l7-7a.5.5 0 01.708 0z" clip-rule="evenodd"/>
                                            <path fill-rule="evenodd" d="M4.146 4.146a.5.5 0 000 .708l7 7a.5.5 0 00.708-.708l-7-7a.5.5 0 00-.708 0z" clip-rule="evenodd"/>
                                        </svg></p>
                                    </td>
                                </tr>
                                
                                
                            </table>
                            <img style="margin-left: 50%; transform: translateX(-50%);" src="${path }/resources/upload/mypage/menu.PNG" onclick=""/>
                            <p style="overflow:hidden; text-overflow: ellipsis; white-space: nowrap;">런ㅇ머뢍ㄴㄹ ㅇㄶ 롱놀ㅇㄴㄹㅇㄴ뢍ㄶ라ㅗㅇㄴㅁㅎ라 ㄴㅁㅇㅎ란ㅇㅎ ㅏ</p>

                        </div>
                        <div class="col-md-1"></div>

                    </div>

                    <div class="col-md-6 row" style="height:220px;">

                        <div class="col-md-2"></div>
                        <div class="col-md-9" style="border: 1px solid black; height:220px;">
                            <p style="text-align: center;"><strong>바나프레소</strong></p>
                            <table style="width:100%">
                                <tr>
                                    <td>
                                        별점 &nbsp;&nbsp;&nbsp;리뷰 1366
                                    </td>
                                    <td>
                                        <p style="text-align: right; width:100%"><svg class="bi bi-x" width="30px" height="30px" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg" onclick="">
                                            <path fill-rule="evenodd" d="M11.854 4.146a.5.5 0 010 .708l-7 7a.5.5 0 01-.708-.708l7-7a.5.5 0 01.708 0z" clip-rule="evenodd"/>
                                            <path fill-rule="evenodd" d="M4.146 4.146a.5.5 0 000 .708l7 7a.5.5 0 00.708-.708l-7-7a.5.5 0 00-.708 0z" clip-rule="evenodd"/>
                                        </svg></p>
                                    </td>
                                </tr>
                                
                                
                            </table>
                            <img style="margin-left: 50%; transform: translateX(-50%);" src="${path }/resources/upload/mypage/menu.PNG" onclick=""/>
                            <p style="overflow:hidden; text-overflow: ellipsis; white-space: nowrap;">런ㅇ머뢍ㄴㄹ ㅇㄶ 롱놀ㅇㄴㄹㅇㄴ뢍ㄶ라ㅗㅇㄴㅁㅎ라 ㄴㅁㅇㅎ란ㅇㅎ ㅏ</p>

                        </div>
                        <div class="col-md-1"></div>

                    </div>

                    <div class="col-md-6 row" style="height:220px;">

                        <div class="col-md-2"></div>
                        <div class="col-md-9" style="border: 1px solid black; height:220px;">
                            <p style="text-align: center;"><strong>바나프레소</strong></p>
                            <table style="width:100%">
                                <tr>
                                    <td>
                                        별점 &nbsp;&nbsp;&nbsp;리뷰 1366
                                    </td>
                                    <td>
                                        <p style="text-align: right; width:100%"><svg class="bi bi-x" width="30px" height="30px" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg" onclick="">
                                            <path fill-rule="evenodd" d="M11.854 4.146a.5.5 0 010 .708l-7 7a.5.5 0 01-.708-.708l7-7a.5.5 0 01.708 0z" clip-rule="evenodd"/>
                                            <path fill-rule="evenodd" d="M4.146 4.146a.5.5 0 000 .708l7 7a.5.5 0 00.708-.708l-7-7a.5.5 0 00-.708 0z" clip-rule="evenodd"/>
                                        </svg></p>
                                    </td>
                                </tr>
                                
                                
                            </table>
                            <img style="margin-left: 50%; transform: translateX(-50%);" src="${path }/resources/upload/mypage/menu.PNG" onclick=""/>
                            <p style="overflow:hidden; text-overflow: ellipsis; white-space: nowrap;">런ㅇ머뢍ㄴㄹ ㅇㄶ 롱놀ㅇㄴㄹㅇㄴ뢍ㄶ라ㅗㅇㄴㅁㅎ라 ㄴㅁㅇㅎ란ㅇㅎ ㅏ</p>

                        </div>
                        <div class="col-md-1"></div>

                    </div>

                </div>


            </div>

            <div class="col-md-1"></div>

        </div>

    </section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>