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
		                                    <div class="s-store-menu-content" onclick="storeBestMenuSelectModal('${index.index+1}')">
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
                                <input type="hidden" name="imgName" value="">
                                <input type="hidden" name="menuPrice" value="">
                                <input type="hidden" name="count" value="1">
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
<!-- modal -->
<div id="modalBox" class="modal" tabindex="-1" role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header menu-modal-header">
				<h5 style="margin-top:8px;margin-left:200px;">메뉴 상세</h5>
				<button class="menu-modal-header-close" data-dismiss="modal">X</button>
			</div>
			<div class="modal-content menu-modal-content">
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
						<p class="menu-modal-menu-count-button" style="color:lightgray;">-</p>
						<p id="menu-modal-menu-count-text">1</p>
						<p class="menu-modal-menu-count-button">+</p>
					</div>
				</div>
				<hr class="menu-modal-hr">
				<div class="menu-modal-content-final-price-div menu-modal-content-chilrde">
					<h4 class="menu-modal-content-h4">총 주문금액</h4>
					<div class="menu-modal-content-final-price-box">
						<h4 class="menu-modal-content-final-price">123</h4>
						<h5 class="menu-modal-menu-limitPrice">123</h5>
					</div>
				</div>
			</div>
			<div class="modal-footer menu-modal-footer">
				<button class="menu-modal-footer-button" style="background-color:red">주문표에 추가</button>
				<button class="menu-modal-footer-button" style="background-color:black">주문하기</button>
			</div>
		</div>
	</div>
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
		                		 "onclick":"storeMenuSelectModal("+(i+1)+")"
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
		        	$("#modal-menu-img").attr("src","${path}/resources/upload/menu/"+data['me_logimg']);
		        	$("#modal-menu-name").html(data['me_name']);
		        	if(data['me_text']!=null){
		        		$("#modal-menu-text").html(data['me_text']);
		        	} else {
		        		$("#modal-menu-text").html("메뉴 설명이 없습니다.");
		        	}
		        	$("#modal-menu-price").html(numberFormatting(data['me_price']));
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
		        				"class":"menu-modal-content-required-option-radio"
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
		        			req.append(div);
		        		} else {
		        			div.attr("class","menu-modal-content-un-required-option-item");
		        			let lable = $("<label>").html("&nbsp;&nbsp;"+side['sd_name'])
	        				.attr("class","menu-modal-content-lable");
		        			let input = $("<input>").attr({
		        				type:"checkbox",
		        				name:"un-required-option",
		        				value:side['sd_no'],
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
        
        var menuCount = 1;
        
        $(".menu-modal-menu-count-button").on("click",function(){
        	let type = $(event.target).text();
        	console.log(type);
        	let text = $("#menu-modal-menu-count-text");
        	let value = $("#menu-modal-menu-count-text").text();
        	if(type=="+"){
        		text.text(Number(value)+1);
        	} else{
        		if(Number(value)>1){
        			text.text(Number(value)-1);
        		}
        	}
        	menuCount = Number(text.text());
        	console.log(menuCount);
        })
        
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