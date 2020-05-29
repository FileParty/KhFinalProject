<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
   <%@include file="../common/header.jsp" %>
   <link rel="stylesheet" type="text/css" href="${path }/resources/css/order.css"/> 
    <section style="width:auto;height:auto;">
    <div class="container" >
    
       <div class="row" >
       
       <%@ include file="sideBar.jsp" %>
       
            <div class="col-lg-10" id="main">
            
                    <h1>주문 내역</h1>
                    <pre>* 최근순으로 주문내역이 나타납니다.<br>* 상세보기를 통하여 자세한 내용을 확인 할 수 있습니다.
                    </pre>
               
                    <div class="col-12 s-order-history">
                  <div id="select_box" style="margin-bottom: 50px;">
                     <label for="storeNo">${sno[0].s_Name }</label>
                     <select id="storeNo">
                        <c:forEach items="${sno }" var="n"> 
                           <option value="${n.s_No }" ${n.s_No eq check ? "selected" : " " }>${n.s_Name }</option> 
                           
                            <!-- 수정 jsy -->
                           <c:if test="${n.s_No eq check}">
										<c:set var="sNo" value="${n.s_No}"/>
							</c:if>	
							 <!-- 수정 jsy -->
                        </c:forEach>
                     </select>
                     
                     <!-- 수정 jsy -->
                     <c:forEach items="${sno }" var ="s">
								<c:if test="${sNo eq s.s_No}">
									<input id="store-no" type="hidden" value="${s.s_No }"/>
									<input id="store-name" type="hidden" value="${s.s_Name }"/>
									<input id="store-addr" type="hidden" value="${s.s_Addr }"/>
									<input id="store-xl" type="hidden" value="${s.s_X }"/>
									<input id="store-yl" type="hidden" value="${s.s_Y }"/>
									<input id="store-time" type="hidden" value="${s.s_Time }"/>
								</c:if>
					 </c:forEach>
                     <!-- 수정 jsy -->
                  </div>
                  <c:if test="${empty list }">
                          <img alt="주문내역준비중" src="${path }/resources/img/index/ready.jpg" width="1000px" height="500px">
                  </c:if>
                  <c:if test="${not empty list }">
                       <table>
                       
                          <tr>
                             <th>주문일시</th>
                             <th>주문금액</th>
                             <th>배달주소</th>
                             <th>전화번호</th>
                        <th>현황</th>
                        <th>상세보기</th>
                          </tr>
                          
                          
                          <c:forEach items="${list }" var="o">
                             <tr>
                                <td><fmt:formatDate value="${o.O_DATE }" pattern="yy/MM/dd HH:mm"/></td>
                                <td><fmt:formatNumber value="${o.O_ORIPRICE }" maxFractionDigits="3"/>원</td>
                                <td><c:out value="${o.O_ADDR}"/></td>
                                <td><c:out value="${o.O_PHONE }"/></td>
                                <c:choose>
                                   <c:when test="${o.O_STATUS eq '주문대기' }">
                                      <td><input type="button" value="승인" onclick="orderSelect(1,${o.O_NO });">&nbsp;<input type="button" value="거절" onclick="orderSelect(0,${o.O_NO });"></td>
                                   </c:when>
                                   <c:when test="${o.O_STATUS eq '주문취소' }">
                                      <td>주문취소</td>
                                   </c:when>
                                   <c:when test="${o.O_STATUS eq '주문완료' }">
                                      <td>                                      	
	                                      <!-- jsy 수정 -->
	                                      <input type="hidden" id="order-no" value="${o.O_NO }">			                    						                    				
				                    	  <input type="hidden" id="order-addr" value="${o.O_ADDR }">		                  			
				                    	  <input type="button" value="배달요청" data-toggle="modal" data-target="#del-modal" id="bt-del" class="bt-del">
	                                       <!-- jsy 수정 -->	                                       
                                      </td>
                                   </c:when>
                                   <c:when test="${o.O_STATUS eq '배달중' }">
                                      <td>
                                      	<input type="hidden" id="order-no" value="${o.O_NO }">			                    						                    				
				                    	 <input type="hidden" id="order-addr" value="${o.O_ADDR }">
                                      	<input type="button" value="배달중" data-toggle="modal" data-target="#del-modal" id="bt-del" class="bt-del">
                                       </td>
                                   </c:when>
                                   <c:when test="${o.O_STATUS eq '배달완료' }">
                                      <td>배달완료</td>
                                   </c:when>
                                </c:choose>
                                
                                <td>
                                <input type="button" data-toggle="modal" data-target="#myModal" onclick="order_detail(${o.O_NO });" value="상세보기">
                                </td>
                             </tr>
                          </c:forEach>
                       </table>
                       </c:if>                  
                    </div>
                    <c:if test="${not empty list }">
                    <div>
                       ${pageBar }
                    </div>
                    </c:if> 
                 </div>   
            </div>
            
         </div>
         
         
               <!-- The Modal -->
      <div class="modal" id="myModal">
        <div class="modal-dialog">
          <div class="modal-content">
      
            <!-- Modal Header -->
            <div class="modal-header">
              <h4 class="modal-title">주문내역</h4>
              <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
      
            <!-- Modal body -->
            <div class="modal-body">
                 <div>
                    
                    <table>
                       
                       <tr>
                          <td>주문상태</td><td id="order_status"></td>
                       </tr>
                       
                       <tr>
                          <td>주문일시</td><td id="order_date"></td>
                       </tr>
                       
                       <tr>
                          <td>주문메뉴</td><td id="order_menu"></td>
                       </tr>
                       
                       <tr>
                          <td>결제금액</td><td id="order_price"></td>
                       </tr>
                       
                       <tr>
                          <td>배달주소</td><td id="order_addr"></td>
                       </tr>
                       
                       <tr>
                          <td>주문자</td><td id="order_member"></td>
                       </tr>
                       
                       <tr>
                          <td>전화번호</td><td id="order_phone"></td>
                       </tr>
                       
                       <tr>
                          <td>요청사항</td><td id="order_text"></td>
                       </tr>

                    </table>
                 
                 </div>
            </div>
      
            <!-- Modal footer -->
            <div class="modal-footer">
              <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
            </div>
      
          </div>
        </div>
      </div>
         
         <!-- by jsy -->
      <!-- ----------------------------------------------------- -->
   		<!-- Modal -->
		<div class="modal fade bd-example-modal-xl" tabindex="-1" role="dialog" aria-labelledby="del-modal" aria-hidden="true" id="del-modal">
		  <div class="modal-dialog modal-xl">
		    <div class="modal-content" style="width:800px">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">배달 요청 현황</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body" class="container text-center">
		        <div id="loading">
		        	<div id="search-delivery" class="mt-3 mb-3">
		        		<strong class="h3"> 가까운 배달원에게 요청중입니다. </strong>
		        	</div>
		        	
		        	<div id="loading-container" class="row justify-content-center mt-4 mb-3">
		        		<div id="loading-col" class="col-6 text-center">
		        			<img src="${path }/resources/img/loading.gif" class="img-thumbnail w-100"/>
		        		</div>
		        	</div>
		        	
		        	<div id="delivery-count" class="row justify-content-center">
	        			<div class="col text-center">
	        				<strong id="del-count" class="h3 del-count">
	        					0 명의 배달원을 찾았습니다.
	        				</strong>
	        			</div>
	        		</div>
		        </div>
		        	
		        <div id="accept-delivery" class="d-none">
		        	
		        </div>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
		      </div>
		    </div>
		  </div>
		</div>   
          <!-- by jsy -->
          
      </section>
      
     <script>
   		$(function(){
   			var type= "business";
			var orderNo;	//주문 번호
			var clientAddress;	//배달 주소
				
			var storeName = $("#store-name").val();	//가게명
			var storeAddress = $("#store-addr").val();; //가게주소
			var storeXl = $("#store-xl").val();;	//위도
			var storeYl = $("#store-yl").val();;	//경도
   			
			
   			
   			$(".bt-del").click(function(e){
   				//interval flag
   				var stopFlag = false;
   				
   				console.log("클릭한 객체의 값");
   				console.log($(e.target).val());
   				
   				orderNo = $(e.target).siblings("input").eq(0).val();	//주문 번호
   				clientAddress = $(e.target).siblings("input").eq(1).val();	//배달 주소
   				
   				if($(e.target).val()=="배달현황"){
   					$("#loading").addClass("d-none");
   					$("#accept-delivery").removeClass("d-none");
   					$("#accept-delivery").children().addClass("d-none");
   	   				$("#accept-delivery").children(".container-"+orderNo).removeClass("d-none");
   				}
   				
   				if($(e.target).val()=="배달요청"){
   					
   					$("#loading").removeClass("d-none");
   					$("#accept-delivery").addClass("d-none");
   					$(".del-count").html("0 명의 배달원을 찾았습니다.");
   					
   				//웹소켓 객체 생성
   	   	   			//const websocket = new WebSocket("wss://rclass.iptime.org${pageContext.request.contextPath}/delivery");
   	   	   			const websocket = new WebSocket("ws://localhost:9090${pageContext.request.contextPath}/delivery");
   	   	   	
   	   	   			//웹소켓 onopen 함수
   	   	   			websocket.onopen = function(data){
   	   					console.log(data);
   	   					console.log("찍힘?"+orderNo);
   	   					console.log(clientAddress);
   	   					var repeat = setInterval(function()
   	   						    {
   	   								websocket.send(JSON.stringify(new SocketMessage(type, orderNo, storeName, storeAddress, storeXl, storeYl, clientAddress, "W", "")));
   	   						    	if(stopFlag){
   	   						    		console.log("setInterval 종료");
   	   						    		clearInterval(repeat);
   	   						    	}
   	   						    },10000);			
   	   				}
   	   	   			
   	   	   			websocket.onmessage = function(data){
   	   	   				const msg = JSON.parse(data.data);
   	   	   				
   	   	   				console.log("타입");
   	   	   				console.log(msg.type);
   	   	   				
   	   	   				switch(msg.type){
   	   	   				
   	   	   				
   	   	   				case "server":
   	   	   					var serverMsg = msg.msg;
   	   	   					console.log(serverMsg);
   	   	   					
   	   	   					$(".del-count").html(serverMsg);
   	   	   					break;
   	   	   				
   	   	   				case "delivery":
   	   	   					
   	   	   					stopFlag = true;
   	   	   					
   		   	   				var orderNo = msg.no;
   							var deliveryName = msg.name;
   							var deliveryAddr = msg.addr;
   							var deliveryXl = msg.xl;
   							var deliveryYl = msg.yl;
   							var clientAddr = msg.clientAddr;
   							var state = msg.state;
   							var message = msg.msg;
   							
   							console.log("과연 두근두근");
   							console.log("상태값");
   							console.log(state);
   							
   							//배달원이 수락했을 때 처리
   							if(state=='Y'){
	   							$("#loading").addClass("d-none");
	   							$("#accept-delivery").removeClass("d-none");
	   							
	   							var containerDiv = $("<div>").addClass("container-"+orderNo);
	   							
	   							var deliveryInfo = $("<div>").attr({
	   								"id" : "delivery-info",
	   								"class" : "row justify-content-center align-items-center"
	   							});
	   							
	   							var deliveryImg = $("<div>").attr({
	   								"id" : "delivery-img",
	   								"class" : "col text-center"
	   							}).html($("<img>").attr({
	   								"src" : "${pageContext.request.contextPath}/resources/img/delivery.png"
	   							}));
	   							
	   							var deliveryName = $("<div>").attr({
	   								"id" : "delivery-name",
	   								"class" : "col text-center"
	   							}).html($("<strong>").html(deliveryName+" 배달원"));
	   							
	   							var deliveryPhone =$("<div>").attr({
	   								"id" : "delivery-phone",
	   								"class" : "col text-center"
	   							}).html($("<strong>").html(message));
	   							
	   							$(deliveryInfo).append(deliveryImg).append(deliveryName).append(deliveryPhone);
	   							
	   							var deliveryInfo2 = $("<div>").addClass("delivery-info2 mt-5");
	   							
	   							var row = $("<div>").addClass("row justify-content-center align-items-center");
	   							
	   							var deliveryAddrDiv = $("<div>").addClass("col shadow border border-dark d-flex flex-column text-center mr-2 p-5");
	   							
	   							var deliveryAddr1 = $("<strong>").html("배달원 주소");
	   							var deliveryAddr2 = $("<strong>").html(deliveryAddr);
	   							
	   							$(deliveryAddrDiv).append(deliveryAddr1).append(deliveryAddr2);
	   							
	   							var delImg = $("<div>").addClass("mr-2");
	   							var delImg1 = $("<img>").attr({
	   								"src" : "${pageContext.request.contextPath}/resources/img/del.png",
	   								"class" : "img-fluid"
	   							});
	   							$(delImg1).addClass("delivery-img1-"+orderNo);
	   							
	   							//오토바이 이미지
	   							delImg.append(delImg1);
	   							
	   							var storeAddrDiv = $("<div>").addClass("col shadow border border-dark d-flex flex-column text-center mr-2 p-5");
	   							
	   							var storeAddr1 = $("<strong>").html("가게 주소");
	   							var storeAddr2 = $("<strong>").html(storeAddress);
	   							
	   							$(storeAddrDiv).append(storeAddr1).append(storeAddr2);
	   							
	   							var clientAddrDiv = $("<div>").addClass("col shadow border border-dark d-flex flex-column text-center mr-2 p-5");
	   							
	   							var clientAddr1 = $("<strong>").html("고객 주소");
	   							var clientAddr2 = $("<strong>").html(clientAddr);
	   							
	   							clientAddrDiv.append(clientAddr1).append(clientAddr2);
	   							
	   							var delImg2 = $("<div>").addClass("mr-2");
	   							var delImg3 = $("<img>").attr({
	   								"src" : "${pageContext.request.contextPath}/resources/img/del.png",
	   								"class" : "img-fluid"
	   							});
	   							$(delImg3).addClass("delivery-img2-"+orderNo);
	   							
	   							//오토바이 이미지
	   							delImg2.append(delImg3);
	   							
	   							row.append(deliveryAddrDiv).append(delImg).append(storeAddrDiv).append(delImg2).append(clientAddrDiv);
	   							deliveryInfo2.append(row);
	   							
	   							var deliveryStart = $("<div>").attr({
	   								"id" : "delivery-start",
	   								"class" : "mt-3"
	   							});
	   							
	   							var deliveryStartBtn = $("<button>").addClass("btn btn-info btn-lg btn-block btn-start").html("배달 출발");
	   							
	   							$(deliveryStart).append(deliveryStartBtn)
	   							
	   							containerDiv.append(deliveryInfo).append(deliveryInfo2).append(deliveryStart);
	   							
	   							$("#accept-delivery").append(containerDiv);
	   							
	   							//수락눌렀을때
	   							$("#accept-delivery").children().addClass("d-none");
	   		   	   				$("#accept-delivery").children(".container-"+orderNo).removeClass("d-none");
	   							$(e.target).val("배달현황");
	   		   	   				
	   							//애니메이션 추가
	   							var imgEnimation = setInterval(function(){
	   								$(".delivery-img1-"+orderNo).fadeToggle(1000);
	   							},1000);   							
	   							
	   							//배달출발 눌렀을때   							
	   							$(".btn-start").click(function(){
	   								
	   								console.log(orderNo);
	   								
	   								$.ajax({
	   									url:"${pageContext.request.contextPath}/orderInfo/updateState.do",
	   									data:{
	   										orderNo : orderNo
	   									},
	   									success: function(data){
	   										if(data['result']>0){
	   											console.log("성공");
	   											console.log($(e.target).val());
	   											
	   											$(e.target).val("배달중");
	   											$(".btn-start").html("배달중");
	   											
	   											//서버에게 배달출발을 한다고 알려주고 서버는 배달원에게 배달출발 상태라고 알려줘야함
	   											
	   											//배달 시간
	   											var deliveryTime = $("#store-time").val();
	   											console.log("배달 시간");
	   											console.log(deliveryTime);
	   											
	   											websocket.send(JSON.stringify(new SocketMessage(type, orderNo, storeName, storeAddress, storeXl, storeYl, clientAddress, "S", "배달이 출발했습니다. 약 " + deliveryTime + " 소요 예정")));
	   											
	   											//애니메이션 추가
	   											$(".delivery-img1-"+orderNo).fadeIn(1000);
	   											clearInterval(imgEnimation);
 											
	   				   							var imgEnimation2 = setInterval(function(){
	   				   								$(".delivery-img2-"+orderNo).fadeToggle(1000);
	   				   							},1000);
	   										}
	   									}
	   								});
	   								
	   								$('#del-modal').modal('hide');
	   							});
   							}
   							
   							//배달원이 배달을 완료했을 때 처리
   							if(state=='C'){
   								console.log($(e.target));
   								var target = $(e.target).parent();
   								
   								
   								$.ajax({
   									url:"${pageContext.request.contextPath}/orderInfo/updateStateComplete.do",
   									data:{
   										orderNo : orderNo
   									},
   									success: function(data){
   										if(data['result']>0){
   											console.log("타겟이 몬가요");
   											console.log(e.target);
   											$(e.target).remove();
   			   								$(target).html("배달완료");
   			   								
   			   								//툴팁
   			   								$(target).attr({
   			   									"data-toggle" : "tooltip",
   			   									"data-placement" : "top",
   			   									"title" : deliveryName+" 배달원이 배달을 완료했습니다.\n전화번호 : "+message
   			   								});
   			   								
   			   								$(target).tooltip('show');

											var toggleHide = function(){
												$(target).tooltip('hide');
											}
											
											//3초뒤에 없애기
											setTimeout(toggleHide, 3000);
   			   								
   										}
   									}
   								});
   								
   								//$(e.target).remove();
   								//$(target).html("배달완료");
   							}
   							
   							break;
   						}	
   	   				}
   	   	   			
   	   	   		
   	   	   		
				
   	   	   		
   	   			
   				}
   			//배달중일 때 예외처리
				if($(e.target).val()=="배달중"){
					console.log("뭔데");
					console.log(orderNo);
					
   					$("#loading").addClass("d-none");
   					$("#accept-delivery").removeClass("d-none");
   					$("#accept-delivery").children().addClass("d-none");
   	   				$("#accept-delivery").children(".container-"+orderNo).removeClass("d-none");
   				}
   	   			
   			})
   			
   			function SocketMessage(type, no, name, addr, xl, yl, clientAddr, state, msg){
   				this.type = type;	//배달자인지, 사업자 인지
   				this.no = no;	//orderno, deliveryno, clientno
   				this.name = name;	//가게명, 이름
   				this.addr = addr;	//가게주소, 배달원 주소
   				this.xl = xl;	//위도
   				this.yl = yl;	//경도
   				this.clientAddr = clientAddr;	//고객 주소
   				this.state = state;	//대기, 수락, 거절(W, Y, N)
   				this.msg = msg;	//메시지
   			}
   			
   			
   		})
   	</script>
      
      
      <script>
         
         
         function order_detail(data){
            $.ajax({
               url : "${path}/store/orderdetail.do",
               data : {no:data},
               success : function(data){
                  console.log(data);
                  $("#order_status").html(data.o_status);
                  $("#order_date").html(data.date);
                  var menu = "";
                  var length = data.o_menu.length;
                   for(var i=0;i<length;i++){
                     if(i==length-1){
                        menu += data.o_menu[i].me_name+"-"+data.o_menu[i].sd_array;
                        break;
                     }
                     menu += data.o_menu[i].me_name+"-"+data.o_menu[i].sd_array+"<br>";
                  } 
                  
                  $("#order_menu").html(menu);
                  $("#order_price").html(data.price+"원");
                  $("#order_addr").html(data.o_addr);
                  $("#order_member").html(data.o_name);
                  $("#order_phone").html(data.o_phone);
                  $("#order_text").html(data.o_request);
               }
            })
         }

         $("#storeNo").change(function(){
            var no=this.value;
            location.replace('${path}/licensee/order?no='+no);
         })
         
         function orderSelect(data,no){
            var result;
            if(data==1){
                result = confirm('주문수락 하시겠습니까?');
            }else{
                result = confirm('주문 취소 하시겠습니까?');
            }
            
            if(result){
               var sno=$("#storeNo option:selected").val();
               var pageno = $("#pageno").val();
               location.replace('${path}/order/orderSelect.do?flag='+data+"&no="+no+"&sno="+sno+"&cPage="+pageno);
            }else{
               return false;
            }
         }
         
         var select = $("select#storeNo");

       select.change(function() {
         var select_name = $(this).children("option:selected").text();
         $(this).siblings("label").text(select_name);
       });

      
      </script>

      
      <%@include file="../common/footer.jsp" %>