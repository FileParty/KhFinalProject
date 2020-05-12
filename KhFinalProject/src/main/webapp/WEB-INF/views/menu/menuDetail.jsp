<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<link rel="stylesheet" href="${path }/resources/css/beom.css" type="text/css">
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<section>
<div class="s-store container">
            <div class="s-store-left">
                <div class="s-store-title">
                    <span>${store['s_name']}</span>
                </div>
                <div class="s-store-info"> 

                    <div class="s-store-img">
                        <img src="#" width="100px" height="100px" style="cursor: pointer;">
                    </div>

                    <div class="s-store-content">
                       
                        <ul>
                            <li><i class="fa fa-star"></i><span>${store['s_score']}</span></li>
                            <li>운영시간<span>${store['s_startTime'] }</span> ~ ${store['s_endTime']}</li>
                            <li>최소주문 금액 <span>${store['s_limitprice']}</span></li>
                            <li>결제 <span></span>${store['s_payopt']}</li>
                            <li>배달시간 <span>${store['s_holiday']}</span></li>
                        </ul>

                    </div>
                
                </div>

                <div class="s-store-nav">  

                    <ul class="nav nav-tabs nav-justified">
                        <li class="nav-item">
                          <a class="nav-link active" data-toggle="pill" href="#menu">메뉴</a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link" data-toggle="pill" href="#review">리뷰</a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link" data-toggle="pill" href="#info">정보</a>
                        </li>
                      </ul>
                    
                      <!-- Tab panes -->
                      <div class="tab-content">
                        <div id="menu" class="container tab-pane active"><br>
                          
                            <div class="s-store-menu">

                                <div class="s-store-scroll">
                                	<c:forEach items="${store['smList']}" var="sl">
	                                	<c:if test="${sl['me_best'] eq 'Y' }">
		                                    <div class="s-store-menu-content">
		                                        <img src="${path }/resources/upload/menu/${sl['me_logimg']}" width="100px" height="100px">
		                                        <h6 style="margin-top: 5px;">${sl['me_name']}</h6>
		                                        <span><fmt:formatNumber pattern="###,###,###원" value="${sl['me_price']}"/></span>
		                                    </div>
	                                    </c:if>
                                    </c:forEach>
                                </div>
                                
                            </div>

                            <div class="s-store-menu-bar">
                            <c:forEach items="${store['scList']}" var="scl">
                                <div class="s-store-menu-nav">${scl }</div>
                                <div class="s-store-menu-nav-content-title">
                                </div>
                            </c:forEach>
                                    <!-- <div class="s-store-menu-nav-content">
                                        <div>
                                            <span>
                                                <strong>빅맥세트</strong><br>
                                                햄버거+감튀+콜라<br>
                                                8,000원
                                            </span>
                                        </div>
                                        <div>
                                            <img src="#" width="100px" height="100px">
                                        </div>
                                    </div> -->
                                    
                            </div>


                        </div>

                        <div id="review" class="container tab-pane fade"><br>

                            <div class="s-store-star">
                                <div>
                                    <h1>4.4</h1>
                                </div>
                                <div class="s-store-score">
                                    <div><i class="fa fa-star"></i><span>맛</span></div>
                                </div>
                            </div>

                            <div class="s-store-review-count">
                                <div>
                                    <span>리뷰 <strong>121</strong>개</span><span>사장님 댓글 <strong>21</strong>개</span>
                                </div>
                                <div>
                                    사진 리뷰만 :
                                    <label class="switch">
                                        <input type="checkbox">
                                        <span class="slider round"></span>
                                    </label>
                                </div>
                            </div>

                            <div class="s-store-review">

                                <table>

                                    <tr>
                                        <td><strong>성연이형</strong>&nbsp;&nbsp;<span>3일 전</span></td>
                                    </tr>
                        
                                    <tr>
                                        <td>
                                            맛 : <i class="fa fa-star"></i> 
                                            <sapn class="report">신고</sapn>
                                        </td>
                                        
                                    </tr>
                                    
                                    <tr>
                                        <td><img src="#" width="650px;" height="300px"></td>
                                    </tr>

                                    <tr>
                                        <td>메뉴이름</td>
                                    </tr>
                                        
                                    <tr>
                                        <td>내용</td>
                                    </tr>
                                </table>

                            </div>
                            
                            
                            
                        </div>
                        
                       
                        <div id="info" class="container tab-pane fade"><br>
                            
                            <div>

                                <div class="s-store-detail"><img src="#" width="30px;" height="30px;">&nbsp;<h5>사장님 알림</h5></div>
                                <hr>
                                <p>
                                    고객님들께 알려드립니다.<br>
                                    죄송하게도 바로결제시에는 쿠폰이 지급되지 않습니다.
                                </p>
                                <br>
                                

                                <div class="s-store-detail"><img src="#" width="30px;" height="30px;">&nbsp;<h5>업체정보</h5></div>
                                <hr>
                                <table class="s-store-detail-content">
                                    <tr>
                                        <td>영업시간</td>
                                        <td>${store['s_startTime'] } - ${store['s_endTime']}</td>
                                    </tr>
                                    <tr>
                                        <td>전화번호</td>
                                        <td>${store['s_phone']}</td>
                                    </tr>
                                    <tr>
                                        <td>주소</td>
                                        <td>${store['s_addr'] }</td>
                                    </tr>
                                </table>

                                <div class="s-store-detail"><img src="#" width="30px;" height="30px;">&nbsp;<h5>결제정보</h5></div>
                                <hr>
                                <table class="s-store-detail-content">
                                    <tr>
                                        <td>최소주문금액</td>
                                        <td><fmt:formatNumber value="${store['s_limitprice'] }" pattern="###,###,###,###"/>원</td>
                                    </tr>
                                    <tr>
                                        <td>결제수단</td>
                                        <td>${store['s_payopt'] }</td>
                                    </tr>
                                </table>
                            
                                <div class="s-store-detail"><img src="#" width="30px;" height="30px;">&nbsp;<h5>사업자정보</h5></div>
                                <hr>
                                <table class="s-store-detail-content">
                                    <tr>
                                        <td>상호명</td>
                                        <td>${store['s_name'] }</td>
                                    </tr>
                                    <tr>
                                        <td>사업자등록번호</td>
                                        <td>725-01-00329</td>
                                    </tr>
                                </table>
                                
                                <div class="s-store-detail"><img src="#" width="30px;" height="30px;">&nbsp;<h5>원산지정보</h5></div>
                                <hr>
                                <table class="s-store-detail-content">
                                    <tr>
                                        <td>${store['s_oriFood'] }</td>
                                    </tr>
                                </table>

                            </div>

                        </div>
                      </div>


                </div>

            </div>

            <div class="s-store-right">

                <aside>

                    <div class="s-store-order-title">
                        <h4>주문표</h4>
                        <img src="#" width="30px" height="30px" style="cursor: pointer;">
                    </div>

                    <div class="s-store-order-content">

                             <div id="order-content-1">
                                <h5>주문표에 담긴 메뉴가 없습니다.</h5>
                            </div> -

                        <!-- <div  id="order-content-2">
                            <div class="s-store-order-button">
                                <h4>국물떡볶이</h4><br>
                                <div>
                                    <button class="btn btn-success" >X</button>
                                    <div><button class="btn btn-success">-</button>&nbsp;<strong style="font-size: 20px;">1</strong>&nbsp;<button class="btn btn-success">+</button></div>
                                </div>
                            </div>
                            
                        </div> -->

                    </div>

                    <div class="s-store-order-delivery">
                        <h6>배달요금 별도 3,500원 별도</h6>
                    </div>

                    <div class="s-store-order-delivery">
                        <h6>최소 주문금액 : <fmt:formatNumber value="${store['s_limitprice'] }" pattern="###,###,###,###"/>원 이상</h6>
                    </div>

                    <div class="s-store-order-price">
                        <h6>합계 : 5,000원</h6>
                    </div>

                    <div class="s-store-order">
                        <h3>주문하기</h3>
                    </div>
                    
                </aside>
                    
            </div>

        </div>

    <div>

</div>

    <script>

        var height = $("#order-content-2").height();
        console.log(height);
    
        if(height>400){
            console.log("앙");
            $("#order-content-2").css({
                height : "400px",
                overflowY : "scroll"
            });
        }else{
            $("#order-content-2").css({
                height : "auto",
                overflowY : "hidden"
            });
        }
    
    </script>

</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>