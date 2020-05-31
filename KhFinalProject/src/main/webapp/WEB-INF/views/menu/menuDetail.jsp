<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.fp.model.vo.Member, com.kh.fp.model.vo.Business, java.util.Map, java.util.HashMap"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<link rel="stylesheet" href="${path }/resources/css/beom.css" type="text/css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<section>
<div class="s-store-list-return">
	<button onclick="returnList()" class="snip1535">돌아가기</button>
</div>
<div class="s-store container">
            <div class="s-store-left">
                <div class="s-store-title">
                    <span style="font-size:23px;font-weight:600;">${store['s_name']}</span>
                    <input type="hidden" id="s-store-bookMark" value=""/>
                    <span id="s-store-book-mark-btn"></span>
                </div>
                <div class="s-store-info"> 

                    <div class="s-store-img">
                        <img src="${path }/resources/upload/store/${store['s_logimg']}" width="100px" height="100px" style="cursor: pointer;">
                    </div>

                    <div class="s-store-content">
                       
                        <ul>
                            <li><span class="s-store-star-css-true">★</span><span class="s-store-info-text">${store['s_star']}</span></li>
                            <li>운영시간<span class="s-store-info-text"><fmt:formatDate value="${store['s_startTime'] }" 
                            	pattern="HH:00" /> ~ <fmt:formatDate value="${store['s_endTime']}" pattern="HH:00"/></span></li>
                            <li>최소주문 금액 <span class="s-store-info-text"><fmt:formatNumber pattern="###,###,###원" 
                            	value="${store['s_limitprice']}"/></span></li>
                            <li>결제 <span class="s-store-info-text">${store['s_payopt']}</span></li>
                            <li>배달시간 <span class="s-store-info-text">${store['s_time']}분</span></li>
                        </ul>

                    </div>
                
                </div>

                <div class="s-store-nav">  

                    <ul class="nav nav-tabs nav-justified">
                        <li class="nav-item">
                          <a class="nav-link active" data-toggle="pill" href="#menu">메뉴</a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link" data-toggle="pill" href="#review" onclick="review(${store['s_no']},1)">리뷰</a>
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
                                   <c:forEach items="${store['bestMenu']}" var="bm" varStatus="index">
                                      <c:if test="${bm['me_best'] eq 'Y' }">
                                          <div class="s-store-menu-content" onclick="storeMenuSelectModal('${bm['me_no']}')">
                                              <img src="${path }/resources/upload/business/${bm['me_logimg']}" width="100px" height="100px">
                                              <h6 style="margin-top: 5px;">${bm['me_name']}</h6>
                                              <span class="s-store-info-text"><fmt:formatNumber pattern="###,###,###원" 
                                              	value="${bm['me_price']}"/></span>
                                          </div>
                                       </c:if>
                                    </c:forEach>
                                </div>
                                
                            </div>

                            <div class="s-store-menu-bar">
                            <c:forEach items="${store['storeCategory']}" var="sc">
                                <div class="s-store-menu-nav" onclick="storeMenuCategory('${sc['mt_no']}')">
                                   ${sc['mt_name'] }
                                </div>
                                <div class="s-store-menu-nav-content-title" id="s-store-menu-category-no${sc['mt_no']}">
                                </div>
                            </c:forEach>
                                    
                            </div>


                        </div>

                        <div id="review" class="container tab-pane fade"><br>

                            <div class="s-store-star">
                                <div>
                                    <h1 style="color:red;">${store['s_star']}</h1>
                                </div>
                                <div class="s-store-scores">
                                    <div class="s-store-score-ta">
	                                   	<span class="s-store-star-type-text">양 : </span>
	                                   	<span>
	                                   		<c:forEach begin="1" end="5" step="1" varStatus="status">
		                                   		<c:choose>
		                                   		<c:when test="${status.index<=store['s_amount_tru']}">
		                                   			<span class="s-store-star-css-true">★</span>
		                                   		</c:when>
		                                   		<c:otherwise>
		                                   			<span class="s-store-star-css-false">★</span>
		                                   		</c:otherwise>
		                                   		</c:choose>
	                                   		</c:forEach>
	                                   	</span>
	                                   	<span class="s-store-star-type-text">${store['s_amount_tru'] }</span>
                                    </div>
                                    <div class="s-store-score-ta">
	                                   	<span class="s-store-star-type-text">배달 : </span>
                                    	<span>
	                                   		<c:forEach begin="1" end="5" step="1" varStatus="status">
		                                   		<c:choose>
		                                   		<c:when test="${status.index<=store['s_delivery_tru']}">
		                                   			<span class="s-store-star-css-true">★</span>
		                                   		</c:when>
		                                   		<c:otherwise>
		                                   			<span class="s-store-star-css-false">★</span>
		                                   		</c:otherwise>
		                                   		</c:choose>
	                                   		</c:forEach>
	                                   	</span>
	                                   	<span class="s-store-star-type-text">${store['s_delivery_tru'] }</span>
                                    </div>
                                    <div class="s-store-score-ta">
	                                   	<span class="s-store-star-type-text">맛 : </span>
                                    	<span>
	                                   		<c:forEach begin="1" end="5" step="1" varStatus="status">
		                                   		<c:choose>
		                                   		<c:when test="${status.index<=store['s_taste_tru']}">
		                                   			<span class="s-store-star-css-true">★</span>
		                                   		</c:when>
		                                   		<c:otherwise>
		                                   			<span class="s-store-star-css-false">★</span>
		                                   		</c:otherwise>
		                                   		</c:choose>
	                                   		</c:forEach>
	                                   	</span>
	                                   	<span class="s-store-star-type-text">${store['s_taste_tru'] }</span>
                                    </div>
                                </div>
                            </div>
							<br/>
                            <div class="s-store-review-count">
                                <div>
                                    <span id="s-store-review-count-text" class="s-store-star-type-text">리뷰 
                                    	<strong>${store['s_reviewCount'] }</strong>개</span>
                                </div>
                                <div class="s-store-review-search-photo">
                                	<span class="s-store-star-type-text">사진 리뷰만 : &nbsp;</span>
                                    <label class="switch">
                                        <input type="checkbox" id="onlyPhoto" value="true" onclick="storeReviewSearchPhoto(${store['s_no']})">
                                        <span class="slider round"></span>
                                    </label>
                                </div>
                            </div>

                            <div class="s-store-review">
                            </div>
                        </div>
                        
                        
                        <div id="info" class="container tab-pane fade"><br>
                            <div>
                                <div class="s-store-detail"><img src="${path}/resources/img/king.png" width="30px;" height="30px;">
                                	&nbsp;<h5>사장님 알림</h5></div>
                                <hr>
                                <pre>${store['s_text'] }</pre>
                                <br>
                                <div class="s-store-detail"><img src="${path}/resources/img/search.svg" width="30px;" 
                                	height="30px;">&nbsp;<h5>업체정보</h5></div>
                                <hr>
                                <table class="s-store-detail-content">
                                    <tr>
                                        <td>영업시간</td>
                                        <td><fmt:formatDate value="${store['s_startTime'] }" pattern="HH:00" /></span> ~ 
                                        	<fmt:formatDate value="${store['s_endTime']}" pattern="HH:00"/></td>
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
                                <div class="s-store-detail"><img src="${path}/resources/img/menuDetail/card.png" width="30px;" 
                                	height="30px;">&nbsp;<h5>결제정보</h5></div>
                                <hr>
                                <table class="s-store-detail-content">
                                    <tr>
                                        <td>최소주문금액</td>
                                        <td>
                                           <input type="hidden" id="s-store-limit-price" value="${store['s_limitprice'] }">
                                           <fmt:formatNumber value="${store['s_limitprice'] }" pattern="###,###,###,###"/>원
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>결제수단</td>
                                        <td>${store['s_payopt'] }</td>
                                    </tr>
                                </table>
                            
                                <div class="s-store-detail"><img src="${path}/resources/img/sidebar/shop.png" width="30px;" 
                                	height="30px;">&nbsp;<h5>사업자정보</h5></div>
                                <hr>
                                <table class="s-store-detail-content">
                                    <tr>
                                        <td>상호명</td>
                                        <td>${store['s_name'] }</td>
                                    </tr>
                                    <tr>
                                        <td>사업자등록번호</td>
                                        <td>${store['b_businesscode']}</td>
                                    </tr>
                                </table>
                                
                                <div class="s-store-detail"><img src="${path}/resources/img/menuDetail/carrots.png" width="30px;" 
                                	height="30px;">&nbsp;<h5>원산지정보</h5></div>
                                <hr>
                                <table class="s-store-detail-content">
                                    <tr>
                                        <td>${store['s_oriFoodInfo'] }</td>
                                    </tr>
                                </table>

                            </div>

                        </div>
                      </div>


                </div>

            </div>

            <div class="s-store-right">
                <aside class="s-store-right-side">
                    <div class="s-store-order-title">
                        <h4 style="margin-top:5px;">주문표</h4>
                        <img src="${path}/resources/img/menuDetail/garbage_icon.png" onclick="deleteAllOrder()"
                        	width="30px" height="30px" id="s-store-order-title-delete-btn">
                    </div>
                    <div class="s-store-order-content">
	                    <div id="order-content-1">
	                        <h5>주문표에 담긴 메뉴가 없습니다.</h5>
	                    </div>
	                    <div id="order-content-2">
	                    </div>
                    </div>
                    <div class="s-store-order-delivery">
                        <h6>배달요금 2,500원 별도</h6>
                    </div>
                    <div class="s-store-order-delivery">
                    	<input type="hidden" id="order-limit-price" value="${store['s_limitprice']}">
                        <h6>최소 주문금액 : <fmt:formatNumber value="${store['s_limitprice'] }" pattern="###,###,###,###"/>원 이상</h6>
                    </div>
					
                    <div class="s-store-order-price">
                    	<input type="hidden" name="allPrice" value="" id="order-final-price"/>
                        <h5 class="s-store-order-final-price">0 원</h5>
                    </div>

                    <div class="s-store-order">
                        <h3 style="cursor:pointer;" onclick="orderListEnd()">주문하기</h3>
                    </div>
                    
                </aside>
                    
            </div>

        </div>

    <div>

</div>
<!-- menu modal -->
<div id="modalBox" class="modal" tabindex="-1" role="dialog">
   <div class="modal-dialog" role="document">
      <div class="modal-content">
         <div class="modal-header menu-modal-header">
         	<input type="hidden" id="modalMenuNo" value="">
            <h5 style="margin-top:8px;margin-left:200px;">메뉴 상세</h5>
            <button class="menu-modal-header-close" data-dismiss="modal">X</button>
         </div>
         <div class="modal-content menu-modal-content">
            <input type="hidden" value="" name="" id="modal-menu-img-src">
            <img id="modal-menu-img" alt="" src="" width="100%" height="200px"><br/>
            <div class="menu-modal-content-text">
               <h3 id="modal-menu-name"></h3>
               <p id="modal-menu-text"></p>
            </div>
            <hr class="menu-modal-hr">
            <div class="menu-modal-content-price menu-modal-content-chilrden">
               <strong>가격</strong>
               <p id="modal-menu-price"></p>
            </div>
            <hr class="menu-modal-hr">
            <div class="menu-modal-content-required-option menu-modal-content-chilrden">
               <h4 class="menu-modal-content-h4">필수 선택</h4>
            </div>
            <hr class="menu-modal-hr">
            <div class="menu-modal-content-un-required-option menu-modal-content-chilrden">
               <h4 class="menu-modal-content-h4">추가 선택</h4>
            </div>
            <hr class="menu-modal-hr">
            <div class="menu-modal-content-menu-count-div menu-modal-content-chilrden">
               <h4 class="menu-modal-content-h4">수량</h4>
               <div class="menu-modal-content-count">
                  <p class="menu-modal-menu-count-button"
                     style="background-color:lightgray;">-</p>
                  <p id="menu-modal-menu-count-text">1</p>
                  <p class="menu-modal-menu-count-button">+</p>
               </div>
            </div>
            <hr class="menu-modal-hr">
            <div class="menu-modal-content-final-price-div menu-modal-content-chilrde">
               <h4 class="menu-modal-content-h4">총 주문금액</h4>
               <div class="menu-modal-content-final-price-box">
                  <input type="hidden" name="finalPrice" id="finalPrice_">
                  <input type="hidden" name="limitPrice" id="limitPrice_">
                  <h4 class="menu-modal-content-final-price"></h4>
                  <h5 class="menu-modal-menu-limitPrice"></h5>
               </div>
            </div>
         </div>
         <div class="modal-footer menu-modal-footer">
         	<div id="menu-modal-footer-tootip" onclick="limitPirceTooTipHide();">최소 주문가격 이상으로 주문해야합니다!</div>
            <button class="menu-modal-footer-button" onclick="addOrderList()" style="background-color:red">주문표에 추가</button>
            <button class="menu-modal-footer-button" onclick="orderModal()"style="background-color:black">주문하기</button>
         </div>
      </div>
   </div>
</div>
<!-- report login modal -->
<div id="report-login-modal" class="modal" tabindex="-1" role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<p class="report-login-modal-header">배달킹 알림</p>
			</div>
			<div class="modal-content">
				<p class="report-login-modal-content">로그인이 필요한 서비스입니다. 로그인 페이지로 이동하시겠어요?</p>
			</div>
			<div class="modal-footer">
				<button class="report-login-modal-btn" data-dismiss="modal">
					아니오
				</button>
				<button class="report-login-modal-btn report-login-modal-btn-bg" onclick="goToLoginPage()">
					예
				</button>
			</div>
		</div>
	</div>
</div>
<!-- report modal -->
<div id="report-modal" class="modal" tabindex="-1" role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<p id="review-report-header-text">리뷰 신고하기</p>
				<button class="menu-modal-header-close" data-dismiss="modal">X</button>
			</div>
			<div class="modal-content report-modal-content">
				<select id="report-modal-report-type-select" name="reportType">
					<option value="욕설">욕설</option>
					<option value="광고">광고</option>
					<option value="선정성">선정성</option>
					<option value="작성">직접 작성</option>
				</select>
			</div>
			<div class="modal-footer">
				
			</div>
		</div>
	</div>
</div>
</section>
<script>
	$(".hover").mouseleave(
		function() {
			$(this).removeClass("hover");
		}
	);

	function orderListHeightCheck(){
				
		let height = $("#order-content-2").height();
		
		if(height>=320){
		    $("#order-content-2").css({
		        height : "320px",
		        overflowY : "scroll"
		    });
		}else{
		    $("#order-content-2").css({
		        height : "auto",
		        overflowY : "hidden"
		    });
		}
	}
        
        function storeMenuCategory(cNo){
           $.ajax({
              url:'${path}/menu/menuDetailCategoryMenus',
              data:{'no':cNo},
              success:function(data){
                 let tar = $("#s-store-menu-category-no"+cNo);
                 let check = tar.children();
                 if(check.length==0){
                      for(let i=0;i<data.length;i++){
                          let content = $("<div>").attr({
                             "class":"s-store-menu-nav-content",
                             "onclick":"storeMenuSelectModal("+data[i]['me_no']+")"
                             }).css("display","none");
                          let div1 = $("<div>");
                          let span = "<span>";
                          span += "<br/><strong>"+data[i]['me_name']+"</strong><br/>"
                          if(data[i]['me_text']!=null){
                             span += data[i]['me_text']+"<br/>";
                          } else {
                             span += "<br/>";
                          }
                          span += data[i]['me_price'];
                          span += "</span>"
                          let div2 = $("<div>");
                          let img = $("<img>").attr({
                             src:"${path}/resources/upload/business/"+data[i]['me_logimg'],
                             width:"100px",
                             height:"100px"
                          });
                          let br = $("<br>");
                          div1.append(span);
                          div2.append(img);
                          content.append(div1).append(div2);
                          tar.append(content);
                          content.slideDown(600);

                       }
                 } else {
                    check.slideUp(600,function(){
                       check.remove();
                    })
                 }
              }
           })
        }
        
        function storeMenuSelectModal(menuNo){
           $.ajax({
              url:"${path}/menu/storeMenuSelectModalAjax",
              data:{'no':menuNo},
              success:function(data){
                 $('#modalBox').modal('show');
                 $("#modalMenuNo").val(menuNo);
                 $("#menu-modal-menu-count-text").html("1");
                 $("#modal-menu-img-src").val(data['me_logimg']);
                 $("#modal-menu-img").attr("src","${path}/resources/upload/business/"+data['me_logimg']);
                 $("#modal-menu-name").html(data['me_name']);
                 if(data['me_text']!=null){
                    $("#modal-menu-text").html(data['me_text']);
                 } else {
                    $("#modal-menu-text").html("메뉴 설명이 없습니다.");
                 }
                 $("#modal-menu-price").html(numberFormatting(data['me_price']));
                 $(".menu-modal-menu-limitPrice")
                 .html("(최소 주문금액  "+numberFormatting($("#s-store-limit-price").val())+")");
                 $("#limitPrice_").val($("#s-store-limit-price").val());
                 $("#finalPrice_").val(data['me_price']);
                 $(".menu-modal-content-final-price").html(numberFormatting(data['me_price']));
                 $(".menu-modal-content-required-option-item").remove();
                 $(".menu-modal-content-un-required-option-item").remove();
                 for(let i=0;i<data['side'].length;i++){
                    let side = data['side'][i];
                    let req = $(".menu-modal-content-required-option");
                    let unreq = $(".menu-modal-content-un-required-option");
                    let div = $("<div>");
                    if(side['sd_division']=='Y'){
                       div.attr("class","menu-modal-content-required-option-item");
                       let lable = $("<label>").html("&nbsp;&nbsp;"+side['sd_name'])
                          .attr("class","menu-modal-content-lable");
                       let input = $("<input>").attr({
                          type:"radio",
                          name:"required-option",
                          required:"required",
                          value:side['sd_no'],
                          onclick:"cacrlPriceReq("+side['sd_price']+")",
                          "class":"menu-modal-content-required-option-radio"
                       });
                       if($(".menu-modal-content-required-option-radio").length==1){
                    	   $(".menu-modal-content-required-option-radio").prop("checked","true");
                       }
                       lable.prepend(input);
                       let price = $("<span>");
                       if(side['sd_price']==0){
                          price.html("추가비용없음");
                       } else {
                          price.html("+"+side['sd_price']+"원");
                       }
                       div.append(lable);
                       div.append(price);
                       if(side['sd_price']==0){
                    	   req.children("h4").after(div);
                       } else {
	                       req.append(div);
                       }
                    } else {
                       div.attr("class","menu-modal-content-un-required-option-item");
                       let lable = $("<label>").html("&nbsp;&nbsp;"+side['sd_name'])
                       .attr("class","menu-modal-content-lable");
                       let input = $("<input>").attr({
                          type:"checkbox",
                          name:"un-required-option",
                          value:side['sd_no'],
                          onclick:"cacrlPriceChk("+side['sd_price']+")",
                          "class":"menu-modal-content-required-option-checkbox"
                       });
                       lable.prepend(input);
                       let price = $("<span>");
                       if(side['sd_price']==0){
                          price.html("추가비용없음");
                       } else {
                          price.html("+"+side['sd_price']+"원");
                       }
                       div.append(lable);
                       div.append(price);
                       unreq.append(div);
                    }
                 }
              }
           });
           
        }
        
        $('#closeModalBtn').on('click', storeMenuModalClose());
        
        function storeMenuModalClose(){
	        $('#modalBox').modal('hide');
        }
        
        var finalPrice = 0;
        var menuCount = 1;
        
        /* +-하기 */
        $(".menu-modal-menu-count-button").on("click",function(){
           let type = $(event.target).text();
           let text = $("#menu-modal-menu-count-text");
           let value = Number($("#menu-modal-menu-count-text").text());
           let countPrice = Number($("#finalPrice_").val());
           if(type=="+"){
        	  let plusPrice = countPrice/value;
        	  countPrice += plusPrice;
              $(".menu-modal-menu-count-button").css("backgroundColor","white");
              text.text((value+1));
           } else{
              if(Number(value)>1){
            	 let minusPrice = countPrice/value;
            	 countPrice -= minusPrice;
                 text.text((value-1));
                 if(text.text()==1){
                    $(event.target).css("background-color","lightgray");
                 }
              }
           }
           menuCount = Number(text.text());
           $("#finalPrice_").val(countPrice);
           $(".menu-modal-content-final-price").html(numberFormatting(countPrice));
        })
        
        
        var oldChoReqOpValue = 0;
        
        function cacrlPriceReq(value){
           let cacrPrice = Number($("#finalPrice_").val());
           cacrPrice -= (oldChoReqOpValue*menuCount);
           cacrPrice += (value*menuCount);
           $("#finalPrice_").val(cacrPrice);
           $(".menu-modal-content-final-price").html(numberFormatting(cacrPrice));
           propPrice = cacrPrice;
           oldChoReqOpValue = value;
        }
        
        function cacrlPriceChk(value){
           let cacrPrice = Number($("#finalPrice_").val());
           if(event.target.checked){
              cacrPrice += (value*menuCount);
           } else {
              cacrPrice -= (value*menuCount);
           }
           propPrice = cacrPrice;
           $("#finalPrice_").val(cacrPrice);
           $(".menu-modal-content-final-price").html(numberFormatting(cacrPrice));
        }
        
        var orderListArr = new Array();
        
        /* 주문표에 추가 */
        function addOrderList(){
        	let finalPrice = Number($("#finalPrice_").val());
        	let limitPrice = Number($("#limitPrice_").val());
        	if(finalPrice>=limitPrice){
        		let no = $("#modalMenuNo").val();
        		let menuImgSrc = $("#modal-menu-img-src").val();
	        	let menuName = $("#modal-menu-name").text();
	        	let reqOp;
	        	let reqOps = $(".menu-modal-content-required-option-radio");
	        	for(let i=0;i<reqOps.length;i++){
	        		if($(reqOps[i]).is(":checked")==true){
	        			reqOp = {"reqOpNo":$(reqOps[i]).val(),
	        					"reqOpName":$(reqOps[i]).parent().text().trim()};
	        		}
	        	}
	        	let unReqOps = $(".menu-modal-content-required-option-checkbox");
	        	let unReqOp = new Array();
	        	for(let i=0;i<unReqOps.length;i++){
	        		let j = 0;
	        		if($(unReqOps[i]).is(":checked")==true){
	        			unReqOp[unReqOp.length]={"unReqOpNo":$(unReqOps[i]).val(),
	        						"unReqOpName":$(unReqOps[i]).parent().text().trim()};
	        		}
	        	}
	        	let menuCount = Number($("#menu-modal-menu-count-text").text());
	        	
	        	const oContent = $(".s-store-order-content");
	        	let orderAdd = new newOrder(no,menuImgSrc,menuName,reqOp,unReqOp,menuCount,finalPrice);
	        	let flag = false;
	        	let flagIndex = 0;
	        	for(let i=0;i<orderListArr.length;i++){
	        		flag = equlasObject(orderListArr[i],orderAdd);
	        		flagIndex = i;
	        		if(flag){
	        			break;
	        		}
	        	}
	        	
        		if(!flag){
	        		let orderDiv = $("#order-content-2");
		        	if($(oContent).children('#order-content-1').length>0){
		        		$(oContent).children('#order-content-1').hide();
		        	}
		        	let orderContent = '<div data-index="'+$(".s-store-order-button").length+'" class="s-store-order-button">';
		        	orderContent += "<h4>"+menuName+"</h4>"
		        	orderContent += "<span>";
		        	orderContent += "&nbsp;&nbsp;옵션 : ";
		        	orderContent += (reqOp!=null?reqOp['reqOpName']:"");
		        	if(unReqOp!=null){
			        	unReqOp.forEach(e=>{
			        		orderContent += ", "+e['unReqOpName'];
			        	});
		        	}
		        	orderContent += "</span>";
		        	orderContent += "<br/>";
		        	orderContent += '<input type="hidden" name="imgName" value="'+menuImgSrc+'">';
		        	orderContent += '<input type="hidden" class="s-store-order-prices" name="menuPrice" value="'+finalPrice+'">';
		        	orderContent += '<input type="hidden" class="s-store-order-count" name="count" value="'+menuCount+'">';
		        	orderContent += '<div class="s-store-order-count-controller-div">';
		        	orderContent += '<button class="btn btn-success" onclick="orderDeleteThis(this)">X</button>';
		        	orderContent += '<span class="s-store-order-menu-price">'+numberFormatting(finalPrice)+"</span>";
		        	orderContent += '<div><button class="order-count-btns" onclick="orderCountMinus(this)">-</button>';
		        	orderContent += '<span class="order-count-check">'+menuCount+'</span>';
		        	orderContent += '<button class="orderCountPlusBtn order-count-btns" onclick="orderCountPlus(this)">+</button></div>';
		        	orderContent += '</div>';
		        	orderContent += '</div>';
		        	let finalPriceCheck = Number($(".order-final-price").val());
		        	finalPriceCheck += finalPrice
		        	$("#s-store-order-final-price").html(numberFormatting(finalPriceCheck));
		        	$(".order-final-price").val(finalPriceCheck);
		        	$("#s-store-order-title-delete-btn").show();
		        	orderDiv.append(orderContent);
		        	oContent.append(orderDiv);
		        	orderListArr.push(orderAdd);
		        	} else{
		        		let tarDiv = $("div[data-index="+flagIndex+"]");
		        		for(let i=0;i<Number(orderAdd['count']);i++){
		        			orderCountPlus($(tarDiv).find(".orderCountPlusBtn"));
		        		}
		        	}
		        	storeMenuModalClose();
		        	orderListHeightCheck();
		        	orderAllFinalPriceCacr();
        	} else {
        		ShowlimitPriceTooTip();
        	}
        }
        
        /* 모달창에서 주문하기 */
        function orderModal(){
        	let finalPrice = Number($("#finalPrice_").val());
        	let limitPrice = Number($("#limitPrice_").val());
        	if(finalPrice>=limitPrice){
        		let no = $("#modalMenuNo").val();
	        	let menuImgSrc = $("#modal-menu-img-src").val();
	        	let menuName = $("#modal-menu-name").text();
	        	let reqOp;
	        	let reqOps = $(".menu-modal-content-required-option-radio");
	        	for(let i=0;i<reqOps.length;i++){
	        		if($(reqOps[i]).is(":checked")==true){
	        			reqOp = {"reqOpNo":$(reqOps[i]).val(),
	        					"reqOpName":$(reqOps[i]).parent().text().trim()};
	        		}
	        	}
	        	let unReqOps = $(".menu-modal-content-required-option-checkbox");
	        	let unReqOp = new Array();
	        	for(let i=0;i<unReqOps.length;i++){
	        		if($(unReqOps[i]).is(":checked")==true){
	        			unReqOp[unReqOp.length]={"unReqOpNo":$(unReqOps[i]).val(),
	        						"unReqOpName":$(unReqOps[i]).parent().text().trim()};
	        		}
	        	}
	        	let menuCount = $("#menu-modal-menu-count-text").text();
	        	let newOrders = [new newOrder(no,menuImgSrc,menuName,reqOp,unReqOp,menuCount,finalPrice)];
	        	newOrders.push({"finalPrice":finalPrice,"s_no":${store['s_no']}});
	        	$.ajax({
	        		url:"${path}/menu/menuOrderEnd",
	        		data:{"newOrders":JSON.stringify(newOrders)},
	        		type:"post",
	        		success:function(){
	        			location.reload();
	        			location.replace("${path}/pay/paylist.do");
	        		},
	        		error:function(a,b,c){
	        			console.log(a);
	        			console.log(b);
	        			console.log(c);
	        		}
	        	});
        	} else {
        		ShowlimitPriceTooTip();
        	}
        }
        
        function newOrder(no,src,name,reqOp,unReqOp,count,price){
        	this.no = no; // 메뉴코드
        	this.src = src; // 메뉴이미지이름
        	this.name = name; // 메뉴이름
        	this.reqOp = reqOp; // 메뉴 필수옵션(no,필수옵션명)
        	this.unReqOp = unReqOp; // 메뉴 추가옵션(no,추가옵션명)
        	this.count = count; // 메뉴 갯수
        	this.price = price; // 메뉴 가격
        }
        
        function ShowlimitPriceTooTip(){
        	let tootip = $("#menu-modal-footer-tootip");
        	tootip.stop();
        	tootip.css("opacity",0).show();
        	tootip.animate({opacity:1},300);
         	setTimeout(limitPirceTooTipHide,1800);
        }
        
        function limitPirceTooTipHide(){
        	let tootip = $("#menu-modal-footer-tootip");
        	tootip.stop();
        	tootip.animate(
       			{opacity:0},500,function(){
       				tootip.hide();
       			}
       		)
        }
        
        function returnList(){
        	let loc = "${path}/menu/menuList.do?no=${rMap['no']}";
        	loc += "&menuCategory=${rMap['menuCategory']}";
        	loc += "&sortType=${rMap['sortType']}";
        	loc += "&search=${rMap['search']}";
        	loc += "&cPage=${rMap['cPage']}";
        	location.replace(loc);
        }
        
        /* 주문표 주문메뉴 전체삭제 */
        function deleteAllOrder(){
        	let flag = confirm("모든 주문표를 삭제하시겠습니까?");
        	if(flag){
        		orderListArr = new Array();
        		$(".s-store-order-button").remove();
        		$("#order-content-1").show();
        		$("#order-content-2").css("height","auto");
        		$("#s-store-order-title-delete-btn").hide();
        		orderListHeightCheck();
        		$(".s-store-order-final-price").text("0원");
        	}
        }
        
        /* 주문표 주문메뉴 개별삭제 */
        function orderDeleteThis(e){
        	let flag = confirm("해당 주문을 취소하시겠습니까?");
        	if(flag){
        		let tarIndex = Number($(e).parent().parent().attr("data-index"));
        		orderListArr.splice(tarIndex,1);
        		let length = $(".s-store-order-button").length;
        		for(let i=0;i<length;i++){
        			let tarNextIndex = Number($($(".s-store-order-button")[i]).attr("data-index"));
        			console.log($($(".s-store-order-button")[i]),tarNextIndex);
        			if(tarNextIndex>tarIndex){
        				$($(".s-store-order-button")[i]).attr("data-index",(tarNextIndex-1));
        			}
        		}
        		console.log($(".s-store-order-button"));
        		$(e).parent().parent().remove();
        		orderListHeightCheck();
        		orderAllFinalPriceCacr();
        		if(length==0){
        			$("#order-content-1").show();
        			orderListArr = new Array();
        		} else if(length<3){
        			$("#order-content-2").css("height","auto");
        		}
        	}
        }
        
        function orderCountMinus(e){
        	let tar = $(e).parent().parent().parent();
        	let price = Number($(tar).find(".s-store-order-prices").val());
        	let count = Number($(tar).find(".s-store-order-count").val());
        	if(count>1){
        		let testPrice = price/count;
        		price -= testPrice;
        		count--;
        		$(tar).find(".s-store-order-prices").val(price);
        		$(tar).find(".s-store-order-count").val(count);
        		$(tar).find(".order-count-check").text(count);
        		$(tar).find(".s-store-order-menu-price").text(numberFormatting(price));
        		let listIndex = $(tar).attr("data-index");
        		orderListArr[listIndex]['count'] -= 1;
        	}
        	orderAllFinalPriceCacr();
        }
        
        function orderCountPlus(e){
        	let tar = $(e).parent().parent().parent();
        	let price = Number($(tar).find(".s-store-order-prices").val());
        	let count = Number($(tar).find(".s-store-order-count").val());
        	let testPrice = price/count;
        	price += testPrice;
    		count++;
    		$(tar).find(".s-store-order-prices").val(price);
    		$(tar).find(".s-store-order-count").val(count);
    		$(tar).find(".order-count-check").text(count);
    		$(tar).find(".s-store-order-menu-price").text(numberFormatting(price));
        	let listIndex = $(tar).attr("data-index");
    		orderListArr[listIndex]['count'] += 1;
    		orderAllFinalPriceCacr();
        }
        
        
        /* 주문표 가격계산 함수 */
        function orderAllFinalPriceCacr(){
        	let orderFinalPriceCheck = $(".s-store-order-prices");
        	let orderFinalPrice = 0;
        	for(let i=0;i<orderFinalPriceCheck.length;i++){
        		orderFinalPrice += Number($(orderFinalPriceCheck[i]).val());
        	}
        	$("#order-final-price").val(orderFinalPrice);
        	$(".s-store-order-final-price").text(numberFormatting(orderFinalPrice));
        }
        
        /* 주문표에서 주문하기 */
        function orderListEnd(){
        	let limitPrice = Number($("#order-limit-price").val());
        	let orderFinalPrice = Number($("#order-final-price").val());
        	if(orderFinalPrice>limitPrice){
	        	orderListArr.push({"finalPrice":$("#order-final-price").val(),"s_no":"${store['s_no']}"});
	        	console.log("ppap");
	        	$.ajax({
	        		url:"${path}/menu/menuOrderEnd",
	        		data:{"newOrders":JSON.stringify(orderListArr)},
	        		type:"post",
	        		success:function(){
	        			location.reload();
	        			location.replace("${path}/pay/paylist.do");
	        		},
	        		error:function(a,b,c){
	        			console.log(a);
	        			console.log(b);
	        			console.log(c);
	        		}
	        	});
        	} else {
        		alert("최소 주문금액보다 높게 주문해야합니다!");
        	}
        	
        }
        
        /* 돈 표시용 */
        function numberFormatting(num){
           num = num.toString().split('').reverse().join('');
           val = "";
           for(let i=0;i<num.length;i++){
              if(i!=0&&i%3==0){
                 val += ",";
              }
              val += num.substr(i,1);
           }
           val = val.split('').reverse().join('');
           val += "원";
           return val;
        }
        
        /* order객체 동일성비교메소드 */
        function equlasObject(x,y){
        	if(x['src']!=y['src']){
        		return false;
        	}
        	if(x['name']!=y['name']){
        		return false;
        	}
       		if(x['reqOp']['reqOpNo']!=y['reqOp']['reqOpNo']){
       			return false;
       		}
       		if(x['unReqOp'].length==y['unReqOp'].length){
	       		for(let i=0;i<x['unReqOp'].length||i<y['unReqOp'].length;i++){
	       			if(x['unReqOp'][i]['unReqOpNo']!=y['unReqOp'][i]['unReqOpNo']){
	       				return false;
	       			}
	       		}
       		} else {
       			return false;
       		}
        	return true;
        }
        
        const yearCalc = 1000 * 60 * 24 * 30 * 12;
        const dateCalc = 1000 * 60 * 24 * 30;
        const dayCalc = 1000 * 60 * 60 * 24;
        const hourCalc = 1000 * 60 * 60;
        const minCalc = 1000 * 60;
        
        var reviewLength = 0;
        var reviewCpage = 1;
        
        /* 리뷰 ajax */
        function review(no,cPage){
        	reviewAjax(no,cPage,"all");
        }
        
        /* 사진있는 리뷰만 출력 */
        function storeReviewSearchPhoto(no){
        	let tar = event.target;
        	reviewCpage = 1;
        	reviewLength = 0;
        	$(".s-store-review").slideUp(1000,function(){
	        	$(".s-store-review").find("table").remove();
	        	$(".s-store-review").find("hr").remove();
	        	$(".s-store-review-reply").remove();
	        	if(tar.checked){
	        		reviewAjax(no,1,"photo");
	        	} else {
	        		reviewAjax(no,1,"all");
	        	} 
	        	$(".s-store-review").slideDown(1000);
        	});
        }
        
        
        /* review ajax */
        function reviewAjax(no,cPage,type){
        	$.ajax({
        		url:"${path}/menu/storeReview",
        		data:{"no":no,"cPage":cPage,"type":type},
        		success:function(data){
        			let reviewDiv = $(".s-store-review");
        			for(let i=0;i<(data.length-1);i++){
	        			let table = $("<table>");
	        			let trStar = "<tr><td>";
                   		for(let k=1;k<=5;k++){
                   			if(Number(data[i]['r_score'])>=k){
	        					trStar += '<span class="s-store-star-css-min-true">★</span>';
                   			} else {
                   				trStar += '<span class="s-store-star-css-min-false">★</span>';
                   			}
                   		}
                   		trStar += "<span class='s-store-star-type-text-min'>"+data[i]['r_score']+"</span>&nbsp;&nbsp;";
                   		trStar += '<span class="s-store-star-css-min-true">★</span>';
                   		trStar += "<span class='s-store-star-type-text-min'>양 : "+data[i]['r_score_amount']+"</span>&nbsp;";
                   		trStar += '<span class="s-store-star-css-min-true">★</span>';
                   		trStar += "<span class='s-store-star-type-text-min'>배달 : "+data[i]['r_score_delivery']+"</span>&nbsp;";
                   		trStar += '<span class="s-store-star-css-min-true">★</span>';
                   		trStar += "<span class='s-store-star-type-text-min'>맛 : "+data[i]['r_score_taste']+"</span>&nbsp;";
	        			trStar += "</td></tr>";
	        			table.append(trStar);
	        			let tr1 = "<tr><td><span class='s-store-review-nickname'>"+securityNickName(data[i]['m_nickName'])+"님</span>";
	        			tr1 += "&nbsp;&nbsp;<span>";
	        			let rDate = new Date(Date.now()-Number(data[i]['r_date']));
	        			if(parseInt(rDate/minCalc)<60){
	        				tr1 += parseInt(rDate/minCalc)+"분 전";
	        			} else if(parseInt(rDate/hourCalc)<24){
	        				tr1 += parseInt(rDate/hourCalc)+"시간 전";
	        			} else if(parseInt(rDate/dayCalc)<30) {
	        				tr1 += parseInt(rDate/dayCalc)+"일 전";
	        			} else if(parseInt(rDate/dateCalc)<12){
	        				tr1 += parseInt(rDate/dateCalc)+"개월 전";
	        			} else {
	        				tr1 += parseInt(rDate/yearCalc)+"년 전";
	        			}
	        			tr1 += "</span>";
	        			tr1 += "<span class='report' onclick='reviewReport("+data[i]['r_no']+")'>신고</span>";
	        			table.append(tr1);
	        			let sliLen = 0;
	        			if(data[i]['r_imgs'].length>1){
		        			sliLen = data[i]['r_imgs'].length;
		        			
		        			let imgTr = "<tr><td>";
		        			imgTr += "<div class='review-slide-td' data-cPage='1' data-max-page='"+sliLen+"'>";
		        			imgTr += "<div class='review-slide-div'>";
	        				for(let j=0;j<data[i]['r_imgs'].length;j++){
	        					imgTr += "<img style='display:inline-block' src='${path}/resources/img/mypage/review/"
	        						+data[i]['r_imgs'][j]+"' width='650px' height='300px'/>";
	        				}
	        				imgTr += "</div>";
	        				imgTr += "<button class='review-slide-btns' onclick='SlideMove(-1)'>◁</button>";
	        				imgTr += "<button class='review-slide-btns' onclick='SlideMove(1)'>▷</button>";
	        				imgTr += "<</div></td></tr>";
		        			table.append(imgTr);
	        			} else if(data[i]['r_imgs'].length==1){
	        				let imgTr = "<tr><td>";
	        				imgTr += "<img style='display:inline-block' src='${path}/resources/img/mypage/review/"
	        					+data[i]['r_imgs'][0]+"' width='650px' height='300px'/>";
	        				imgTr += "</td></tr>"
	        				table.append(imgTr);
	        			}
		        			let tr5 = "<tr><td>";
		        		for(let k=0;k<data[i]['mdrm'].length;k++){
		        			tr5 += "<span class='s-store-review-menu-text'>메뉴- "+data[i]['mdrm'][k]['me_name']+" 옵션- "
		        				+data[i]['mdrm'][k]['sd_array']+"</span><br/>";
	        			}
	        			tr5 += "</td></tr>";
	        			table.append(tr5);
	        			let tr4 = "<tr><td>";
	        			tr4 += "<pre>"+data[i]['r_text']+"</pre>";
	        			tr4 += "</td></tr>";
	        			table.append(tr4);
	        			let hr= $("<hr>").css("margin","5px");
	        			reviewDiv.append(table);
	        			reviewDiv.append(hr);
	        			$(".review-slide-div").last().css("width",sliLen*650);
	        			if(data[i]['r_reply']!=null){
	        				let reply = "<div class='s-store-review-reply'>";
	        				reply += "<span class='s-store-review-reply-text'>☞&nbsp;사장님&nbsp;☜</span>";
	        				reply += "<pre class='s-store-review-reply-content'>"+data[i]['r_reply']+"</pre>";
	        				reply += "</div>";
	        				reviewDiv.append(reply);
	        				let hr2 = $("<hr>");
	        				reviewDiv.append(hr2);
	        			}
        			}
        			$("#s-store-review-count-text").html('리뷰 <strong>'+data[(data.length-1)]+'</strong>개');
        			reviewLength += 5;
        			if(data[(data.length-1)]>reviewLength){
        				scrollFalg = true;
        			} else {
        				scrollFalg = false;
        			}
        		}
        	});
      		reviewCpage++;
        }
        
        var scrollFalg = false;
        let scrollHCheck = 0;
        
        /* review infinite scroll */
        $(function(){
       		$(document).scroll(function(){
	        	if(scrollFalg){
	        		if($(window).scrollTop()>=scrollHCheck){
	        			if($(window).scrollTop() >= $(document).height()-1237){
	        				if($("#onlyPhoto").is(":checked")){
		        				scrollFalg = false;
	        					review("${store['s_no']}",reviewCpage,'photo');
	        					event.preventDefault();
	        				} else {
		        				scrollFalg = false;
	        					review("${store['s_no']}",reviewCpage,'all');
	        					event.preventDefault();
	        				}
	        				scrollHCheck = $(window).scrollTop()+300;
	        			}
	        		}
	        	}
        	})
        	
        });
        
        
        /* 닉네임 암호화 */
        function securityNickName(name){
        	name = name.substring(0,2);
        	name += "**";
        	return name;
        }
        
        /* 리뷰 신고하기 */
        function reviewReport(r_no){
        	let check = "${loginType['no']}";
	        if(check.length!=0){
        		if("${loginType['type']}"=='m'){
		        	$("#report-modal").modal("show");
		        	$("#report-modal-report-type-select").val('욕설');
		        	$("#report-modal").find("#report-modal-report-writer").remove();
		        	
		        	if($("#report-modal").find(".report-modal-report-end").length==0){
		        		$("#report-modal").find(".modal-footer")
		        			.append("<button class='report-modal-report-end' onclick='reportEnd("+r_no+")'>신고하기</button>");
		        	}
	        	
	        	} else {
	        		alert("일반 회원만 사용할 수 있습니다.");
	        	}
        	} else {
        		$("#report-login-modal").modal("show");
        	}
        }
        
        /* 로그인 페이지로 이동 */
        function goToLoginPage(){
        	location.replace("${path}/member/login.do");
        }
        
        $("#report-modal-report-type-select").on("change",function(){
        	let report = $(event.target).parent().parent().find("#report-modal-report-type-select").val();
        	if(report=="작성"){
        		let reportWriter = "<textarea id='report-modal-report-writer' cols='45' rows='10' style='resize:none'>"
        		reportWriter += "</textarea>";
        		$(event.target).parent().append(reportWriter);
        	} else {
        		$(event.target).parent().parent().find("#report-modal-report-writer").remove();
        	}
        })
        
        
        /* 신고작성완료 */
         function reportEnd(r_no){
        	let report = $(event.target).parent().parent().find("#report-modal-report-type-select").val();
        	if(report=="작성"){
        		let reportWriter = $(event.target).parent().parent().find("#report-modal-report-writer").val();
        		if($.trim(reportWriter).length==0){
        			alert("신고내용을 입력해주세요!");
        			return;
        		} else {
        			report = reportWriter;
        		}
        	}
        	
        	let flag = confirm("신고하시겠습니까?");
        	if(!flag){
        		return;
        	}else {
        		let reportVar = {'r_no':r_no,'m_send':"${loginType['no']}","re_content":report}
        		$.ajax({
        			url:"${path}/menu/reviewReport",
        			data:{"reportVar":JSON.stringify(reportVar)},
        			type:"post",
        			success:function(data){
        				if(data==1){
        					alert("신고가 접수되었습니다.\n빠르게 처리하겠습니다.");
        					$("#report-modal").modal("hide");
        				} else {
        					alert("신고 접수에 문제가 발생했습니다.\n다시 시도하시거나 관리자에게 문의해주세요");
        				}
        			}
        		})
        	}
        	
        };
        
        /* 슬라이드바 */
         function SlideMove(nPage){
        	let dataDiv = $(event.target).parent();
        	let moveDiv = $(dataDiv).find(".review-slide-div");
        	let cPage = Number($(dataDiv).attr("data-cpage"));
        	let maxPage = Number($(dataDiv).attr("data-max-page"));
        	cPage += nPage;
        	console.log(cPage);
        	if(cPage!=0&&cPage<=maxPage){
        		if(nPage>0){
        			$(moveDiv).animate({
        				left:"-=650px"
        			});
        		} else {
        			$(moveDiv).animate({
        				left:"+=650px"
        			});
        		}
        	} else if(cPage==0){
        		$(moveDiv).animate({
    				left:"-="+((maxPage-1)*650)+"px"
    			});
        		cPage = maxPage;
        	} else if(cPage>maxPage){
        		$(moveDiv).animate({
    				left:"+="+((maxPage-1)*650)+"px"
    			});
        		cPage = 1;
        	}
        	$(dataDiv).attr("data-cpage",cPage);
        	console.log($(dataDiv).attr("data-cpage"));
        } 
        
        
        /* 찜하기 버튼 */
         $("#s-store-book-mark-btn").click(function(){
        	 if("${loginType['type']}"=="m"){
        		let check = "${loginType['no']}";
        		if(check.length!=0){
		        	let bm = Number($("#s-store-bookMark").val());
		        	console.log(bm);
		        	$.ajax({
		        		url:"${path}/menu/storeBookMark",
		        		data:{"m_no":check,"s_no":"${store['s_no']}","check":bm},
		        		success:function(data){
		        			console.log("성공"+data);
		        			if(data==100){
		        				$("#s-store-book-mark-btn").html("♥");
		        				$("#s-store-bookMark").val('1');
		        			}else{
		        				$("#s-store-book-mark-btn").html("♡");
		        				$("#s-store-bookMark").val('0');
		        			}
		        		}
		        	});
		        	
        		} else {
        			$("#report-login-modal").modal("show");
        		}
        	 } else {
        		 alert("일반 회원만 사용할 수 있습니다.");
        	 }
        });
        

        
        
	/* 페이지 리로드 */
	$(function(){
		let no = "${loginType['no']}";
		if(no.length>0){
		 	$.ajax({
				url:"${path}/menu/bookMarkCheck",
				data:{"m_no":no,"s_no":"${store['s_no']}"},
				success:function(data){
					if(data==0){
						$("#s-store-bookMark").val("0");
						$("#s-store-book-mark-btn").html("♡");
					} else {
						$("#s-store-bookMark").val("1");
						$("#s-store-book-mark-btn").html("♥");
					}
				}
			})
		}
		/* 뒤로가기 버튼 막기 */
		history.pushState(null, null, location.href);
		window.onpopstate = function(event){
			returnList();
		}
	})
        
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

