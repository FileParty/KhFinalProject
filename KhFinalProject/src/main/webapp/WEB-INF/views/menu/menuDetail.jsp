

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
<div class="s-store-list-return">
	<button onclick="returnList()" class="snip1535">돌아가기</button>
	<style>
	@import url(https://fonts.googleapis.com/css?family=BenchNine:700);
.snip1535 {
  background-color: #070707;
  border: none;
  color: #ffffff;
  cursor: pointer;
  display: inline-block;
  font-family: 'BenchNine', Arial, sans-serif;
  font-size: 1em;
  font-size: 22px;
  line-height: 1em;
  margin: 15px 40px;
  outline: none;
  padding: 12px 40px 10px;
  position: relative;
  text-transform: uppercase;
  font-weight: 700;
}
.snip1535:before,
.snip1535:after {
  border-color: transparent;
  -webkit-transition: all 0.25s;
  transition: all 0.25s;
  border-style: solid;
  border-width: 0;
  content: "";
  height: 24px;
  position: absolute;
  width: 24px;
}
.snip1535:before {
  border-color: #c47135;
  border-right-width: 2px;
  border-top-width: 2px;
  right: -5px;
  top: -5px;
}
.snip1535:after {
  border-bottom-width: 2px;
  border-color: #c47135;
  border-left-width: 2px;
  bottom: -5px;
  left: -5px;
}
.snip1535:hover,
.snip1535.hover {
  background-color: #c47135;
}
.snip1535:hover:before,
.snip1535.hover:before,
.snip1535:hover:after,
.snip1535.hover:after {
  height: 100%;
  width: 100%;
}
	</style>
	<script>
	$(".hover").mouseleave(
			  function() {
			    $(this).removeClass("hover");
			  }
			);
	</script>
</div>
<div class="s-store container">
            <div class="s-store-left">
                <div class="s-store-title">
                    <span>${store['s_name']}</span>
                </div>
                <div class="s-store-info"> 

                    <div class="s-store-img">
                        <img src="${path }/resources/upload/store/${store['s_logimg']}" width="100px" height="100px" style="cursor: pointer;">
                    </div>

                    <div class="s-store-content">
                       
                        <ul>
                            <li><i class="fa fa-star"></i><span>${store['s_score']}</span></li>
                            <li>운영시간<span><fmt:formatDate value="${store['s_startTime'] }" pattern="HH:00" /></span> ~ <fmt:formatDate value="${store['s_endTime']}" pattern="HH:00"/></li>
                            <li>최소주문 금액 <span>${store['s_limitprice']}</span></li>
                            <li>결제 <span></span>${store['s_payopt']}</li>
                            <li>배달시간 <span>${store['s_time']}분</span></li>
                        </ul>

                    </div>
                
                </div>

                <div class="s-store-nav">  

                    <ul class="nav nav-tabs nav-justified">
                        <li class="nav-item">
                          <a class="nav-link active" data-toggle="pill" href="#menu">메뉴</a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link" data-toggle="pill" href="#review" onclick="review()">리뷰</a>
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
                                              <img src="${path }/resources/upload/menu/${bm['me_logimg']}" width="100px" height="100px">
                                              <h6 style="margin-top: 5px;">${bm['me_name']}</h6>
                                              <span><fmt:formatNumber pattern="###,###,###원" value="${bm['me_price']}"/></span>
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
                                            <span class="report">신고</span>
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
                                        <td><fmt:formatDate value="${store['s_startTime'] }" pattern="HH:00" /></span> ~ <fmt:formatDate value="${store['s_endTime']}" pattern="HH:00"/></td>
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
                            
                                <div class="s-store-detail"><img src="#" width="30px;" height="30px;">&nbsp;<h5>사업자정보</h5></div>
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
                                
                                <div class="s-store-detail"><img src="#" width="30px;" height="30px;">&nbsp;<h5>원산지정보</h5></div>
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
                        <h5 class="s-store-order-final-price">합계 : 0 원</h5>
                    </div>

                    <div class="s-store-order">
                        <h3 style="cursor:pointer;" onclick="orderListEnd()">주문하기</h3>
                    </div>
                    
                </aside>
                    
            </div>

        </div>

    <div>

</div>
<!-- modal -->
<div id="modalBox" class="modal" tabindex="-1" role="dialog">
   <div class="modal-dialog" role="document">
      <div class="modal-content">
         <div class="modal-header menu-modal-header">
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


<script>

	function orderListHeightCheck(){
				
		let height = $("#order-content-2").height();
		console.log(height);
		
		if(height>=320){
		    $("#order-content-2").css({
		        height : "320px",
		        overflowY : "scroll"
		    });
		}else{
			console.log("앙");
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
                 console.log(check);
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
                             src:"${path}/resources/upload/menu/"+data[i]['me_logimg'],
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
                 console.log(data);
                 console.log(menuNo);
                 $('#modalBox').modal('show');
                 $("#menu-modal-menu-count-text").html("1");
                 $("#modal-menu-img-src").val(data['me_logimg']);
                 $("#modal-menu-img").attr("src","${path}/resources/upload/menu/"+data['me_logimg']);
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
                 console.log(("#finalPrice_"));
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
        
        /* 주문표에 추가 */
        function addOrderList(){
        	let finalPrice = Number($("#finalPrice_").val());
        	let limitPrice = Number($("#limitPrice_").val());
        	if(finalPrice>=limitPrice){
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
	        	let orderDiv = $("#order-content-2");
	        	if($(oContent).children('#order-content-1').length>0){
	        		$(oContent).children('#order-content-1').hide();
	        	}
	        	let orderContent = '<div class="s-store-order-button">';
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
	        	orderContent += '<input type="hidden" name="count" value="'+menuCount+'">';
	        	orderContent += '<div class="s-store-order-count-controller-div">';
	        	orderContent += '<button class="btn btn-success" onclick="orderDeleteThis(this)">X</button>';
	        	orderContent += '<span class="s-store-order-menu-price">'+numberFormatting(finalPrice)+"</span>";
	        	orderContent += '<div><button class="btn" onclick="orderCountMinus()">-</button>';
	        	orderContent += '<span class="order-count-check">'+menuCount+'</span>';
	        	orderContent += '<button class="order-count-btns" onclick="orderCountPlus()"><img src="${path}/resources/img/menuDetail/plus_icon.png" width="30px" height="30px"/></button></div>';
	        	orderContent += '</div>';
	        	orderContent += '</div>';
	        	let finalPriceCheck = Number($(".order-final-price").val());
	        	finalPriceCheck += finalPrice
	        	$("#s-store-order-final-price").html(numberFormatting(finalPriceCheck));
	        	$(".order-final-price").val(finalPriceCheck);
	        	$("#s-store-order-title-delete-btn").show();
	        	orderDiv.append(orderContent);
	        	oContent.append(orderDiv);
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
	        	let newOrders = [new newOrder(menuImgSrc,menuName,reqOp,unReqOp,menuCount,finalPrice,finalPrice)];
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
        
        function newOrder(src,name,reqOp,unReqOp,count,price,allPrice){
        	this.src = src; // 메뉴이미지이름
        	this.name = name; // 메뉴이름
        	this.reqOp = reqOp; // 메뉴 필수옵션(no,필수옵션명)
        	this.unReqOp = unReqOp; // 메뉴 추가옵션(no,추가옵션명)
        	this.count = count; // 메뉴 갯수
        	this.price = price; // 메뉴 가격
        	this.allPrice = allprice // 총합가격
        }
        
        function ShowlimitPriceTooTip(){
        	let tootip = $("#menu-modal-footer-tootip");
        	console.log(tootip);
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
        	console.log(loc);
        	location.replace(loc);
        }
        
        /* 주문표 주문메뉴 전체삭제 */
        function deleteAllOrder(){
        	let flag = confirm("모든 주문표를 삭제하시겠습니까?");
        	if(flag){
        		$(".s-store-order-button").remove();
        		$("#order-content-1").show();
        		$("#order-content-2").css("height","auto");
        		$("#s-store-order-title-delete-btn").hide();
        		orderListHeightCheck();
        	}
        }
        
        /* 주문표 주문메뉴 개별삭제 */
        function orderDeleteThis(e){
        	let flag = confirm("해당 주문을 취소하시겠습니까?");
        	if(flag){
        		$(e).parent().parent().remove();
        		orderListHeightCheck();
        		let length = $(".s-store-order-button").length;
        		if(length==0){
        			$("#order-content-1").show();
        		} else if(length<3){
        			$("#order-content-2").css("height","auto");
        		}
        	}
        }
        
        function orderCountMinus(){
        	let tar = $(event.target).parent().find(".order-count-check");
        	console.log(tar);
        }
        
        function orderCountPlus(){
        	let tar = $(event.target).parent().find("strong");
        	console.log(tar);
        }
        
        
        /* 주문표 가격계산 함수 */
        function orderAllFinalPriceCacr(){
        	let orderFinalPriceCheck = $(".s-store-order-prices");
        	console.log(orderFinalPriceCheck);
        	let orderFinalPrice = 0;
        	for(let i=0;i<orderFinalPriceCheck.length;i++){
        		orderFinalPrice += Number($(orderFinalPriceCheck[i]).val());
        	}
        	console.log(orderFinalPrice);
        	$("#order-final-price").val(orderFinalPrice);
        	$(".s-store-order-final-price").text("합계 : " + numberFormatting(orderFinalPrice));
        }
        
        /* 주문표에서 주문하기 */
        function orderListEnd(){
        	let newOrders = new Array();
        	let finalPrice = Number($("#order-final-price").val());
        	let limitPrice = Number($("#order-limit-price").val());
        	if(finalPrice>=limitPrice){
        		let orderMenuList = $(".s-store-order-button");
        		for(let i=0;i<orderMenuList.length;i++){
		        	let menuImgSrc = $(orderMenuList[i]).find("#modal-menu-img-src").val();
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
		        	let orders = new newOrder(menuImgSrc,menuName,reqOp,unReqOp,menuCount,finalPrice);
		        	newOrders.push(orders);
        		}
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
        
    
    </script>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

