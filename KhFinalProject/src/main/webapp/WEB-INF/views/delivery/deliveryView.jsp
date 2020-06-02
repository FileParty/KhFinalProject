<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<link rel="stylesheet" href="${path }/resources/css/menulist.css" type="text/css">
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="${path }/resources/css/index.css"/>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0c4555610509aaa6cfd5fae61f00a23f&libraries=services"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" type="text/css" href="${path }/resources/css/boot.css"/>
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="${path }/resources/css/header.css"/> 
</head>
<body>
  <style>
  	div{
  		/*  border: solid 1px red;  */
  	}
  	
  	/* .container{ width: 100%; height: 100vh; display: -webkit-box; display: -ms-flexbox; display: flex; -webkit-box-align: center; -ms-flex-align: center; align-items: center; -webkit-box-pack: center; -ms-flex-pack: center; justify-content: center; }
 */

  </style>
	<section class="w-100 h-100 row align-items-center">
		
		<c:set value="${del.d_Status}" var="deliveryStatus"/>
		<c:set value="${del.m_No}" var="deliveryNo"/>
		
		<div class="container" id="delevery-container">
			<div class="row justify-content-center">
				<div class="col-sm-12">
					<nav class="navbar navbar-expand-lg navbar-light bg-light justify-content-between">
					  <div class="align-items-center">
					  	  <img src="${pageContext.request.contextPath}/resources/img/delivery.png" />
						  <span class="navbar-brand">${loginMember.m_Name } 배달원</span>
						  <input type="hidden" id="del-name" value="${loginMember.m_Name }"/>
						  <input type="hidden" id="del-no" value="${loginMember.m_No }"/>
					  </div>
					  <div>
					  	<a class="navbar-brand" href="#">메뉴</a>
					  	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
					    
					    <span class="navbar-toggler-icon"></span>
					  	</button>
					  </div>
					  <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
					    <ul class="navbar-nav text-right mr-auto mt-lg-0">
					      <li class="nav-item active">
					        <a class="nav-link" href="#">Home<span class="sr-only">(current)</span></a>
					      </li>
					      <li class="nav-item">
					        <a class="nav-link" href="#">개인정보 수정</a>
					      </li>
					    </ul>
					  </div>
					</nav>
				</div>
			</div>
			
		  
		  <div id="deliveryman-info" class="alert alert-dismissible alert-info pb-4 pt-4">
		  
		  <c:if test="${deliveryStatus eq 'N'}">
		    <div class="index-search-container ml-5">
				<div class="">
					<strong class="h2">
			    			현재 위치
			    	</strong>
				</div>			
					
				<div class="index-search d-flex justify-content-center align-items-center mt-3">
					
					<div class="search-btn mr-3"><button class="location-button" onclick="getbrowserxy();"><i style='font-size:30px' class='fas'>&#xf14e;</i></button></div>
					
				
					<div>
						<form name="form" id="form" method="post"  onsubmit="return false">
							<input type="hidden" name="currentPage" value="1"/> 
							<input type="hidden" name="countPerPage" value="5"/>
							<input type="hidden" name="resultType" value="json"/> 
							<input type="hidden" name="confmKey" value="devU01TX0FVVEgyMDIwMDUxMjIwMDA0MTEwOTc1MjQ="/>
							<div class="keyword-box">
								<input class="is-valid" type="text" name="keyword" id="keyword" value="" onkeydown="enterSearch();" autocomplete="off" size="40px"/>
							</div>
						</form>
					</div>
	
				</div>
				
				<div class="index-search-autosearch d-none">
					<div id="list">
					</div> 
					<div>
						<input type="hidden" value="" name="xl" id="xl"/>
						<input type="hidden" value="" name="yl" id="yl"/>
			
					</div>
				</div>
				
			</div>     
		    
		    <div class="d-flex ml-5 mr-5 mt-5 phone-container">
		    
		    	<div class="list-group d-flex flex-column">
				  	<div class="mr-5">
			    		<strong class="h2">
			    			전화번호
			    		</strong>
			    	</div>
		    	
			    	<div class="mt-3">
			    		<span class="h3 alert-link">
			    			${loginMember.m_Phone }		    			
			    		</span>  		
			    	</div>
				</div>
    
		    </div>
		  </c:if>
		    
		  <c:if test="${deliveryStatus eq 'Y'}">
		  	<div class="card text-white bg-info mb-3">
        		<div class="card-header justify-content-between d-flex">
            		<div>
                		<span>${del.store_Name}</span>
            		</div>
            	<div>
                	<span>배달비 : 2500원</span>
            	</div>
        	</div>
		        <div class="card-body">
		            <div class="slider1">
		                <div class="order-container">
		                    <div class="item text-center">
		                        <div class="row justify-content-between align-items-center alert-info p-3">
		                            <div class="store-info col border border-dark p-0 mr-3 ">
		                                <div class="store-name d-flex flex-column">
		                                    <span class="h4">가게 명</span>
		                                    <span class="h5">${del.store_Name}</span>
		                                </div>
		                                
		                                <div class="store-addr d-flex flex-column">
		                                    <span class="h4">가게 주소</span>
		                                    <span class="h5">${del.store_Address }</span>
		                                </div>
		                            </div>
		
		                            <div class="client-info col border border-dark ml-3 p-0">
		                                <div class="client-addr d-flex flex-column">
		                                    <span class="h4">배달 주소</span>
		                                    <span class="h5">${del.client_Address }</span>
		                                </div>   
		                            </div>
		                        </div>
		                    </div>
		                </div>
		            </div>
		        </div>
	      	</div>
		  </c:if>  
		    
		  </div>
		  
		  <c:if test="${deliveryStatus eq 'N'}">
		  	<button id="bt-deliverProxy" class="btn btn-info btn-lg btn-block" type="button">배달 검색</button>
		  	<button id="bt-delivery"type="button" style="display:none;" data-toggle="modal" data-target="#del-modal"></button>
		  </c:if>
  
  		  <c:if test="${deliveryStatus eq 'Y'}">
  		  	<button id="bt-deliveryComplete" class="btn btn-info btn-lg btn-block" type="button">배달 완료</button> 
  		  </c:if>
		</div>
		
		<!-- Modal -->
		<div class="modal fade" id="del-modal" tabindex="-1" role="dialog" aria-labelledby="del-modal" aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">배달 검색</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div id="modal-body" class="modal-body container text-center">
		      	<div id="loading">
		        	<div id="search-delivery" class="mt-3 mb-3">
		        		<strong class="h2"> 검색 중입니다... </strong>
		        	</div>
		        	
		        	<div id="loading-container" class="row justify-content-center mt-4 mb-3">
		        		<div id="loading-col" class="col-6 text-center">
		        			<img src="${path }/resources/img/loading.gif" class="img-thumbnail w-100"/>
		        		</div>
		        	</div>
		        </div>	
		        
		        <div id="order" class="d-none">
		        	<div class="slider">
		        		<div class="container" id="container-item">
		        			
		        		</div>
		        	</div>
		        </div>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
		      </div>
		    </div>
		  </div>
		</div>
	</section>
	<style>
		/* img{
			border : 1px solid red;
			
		}
		
		div{
			border : 1px solid black;
		} */
	</style>
	<script>
	let checkState;
	
	
	//var websocket = new WebSocket("wss://rclass.iptime.org${pageContext.request.contextPath}/delivery");				
	var websocket = new WebSocket("ws://localhost:9090${pageContext.request.contextPath}/delivery");
	
	websocket.onopen = function(data){
		
	}
	
	$(function(){
		//type
		var type = "delivery";
		//deliveryno
		var deliveryNo = ${loginMember.m_No };
		//배달원 이름
		var deliveryName = $("#del-name").val();
		//배달원 주소 (현재위치)
		var deliveryAddr;
		//배달원 x 좌표
		var xl;
		//배달원 y 좌표
		var yl;
		//고객 주소
		var clientAddr = "";
		//배달원의 메세지
		var phoneMessage = "${loginMember.m_Phone }";
		
		//배달원 상태
		var deliveryState;
		
		
		console.log("전화번호");
		console.log(phoneMessage);
		
		//modal(card item) 크기
		var width = 436;
		var height = 351;
		var count = 0;
		
		function SocketMessage(type, no, name, addr, xl, yl, clientAddr, state, msg){
			this.type = type;
			this.no = no;
			this.name = name;
			this.addr = addr;
			this.xl = xl;
			this.yl = yl;
			this.clientAddr = clientAddr;
			this.state = state;
			this.msg = msg;
		}
		
		$("#bt-deliverProxy").click(function(){
			if($("#keyword").val() ==''){
				alert("현재위치를 검색해주세요!!")
			}else{
				
				//loading 화면 보이게 하기
				$("#loading").removeClass("d-none");
				//order 화면 없애기
				$("#order").addClass("d-none");
				
				
				
				//서버가 실행되었을때				
				/* websocket.onopen = function(data){
					console.log(data);
					
					//배달원 주소 (현재위치)
					deliveryAddr = $("#keyword").val();
					//배달원 x 좌표
					xl = $("#xl").val();
					//배달원 y 좌표
					yl = $("#yl").val();
					//고객 주소
					clientAddr = "";
					
					deliveryState = "W";
					websocket.send(JSON.stringify(new SocketMessage("delivery", deliveryNo, deliveryName ,deliveryAddr, xl, yl, clientAddr, deliveryState, "")));
				} */
				
				//console.log(data);
				
				//배달원 주소 (현재위치)
				deliveryAddr = $("#keyword").val();
				//배달원 x 좌표
				xl = $("#xl").val();
				//배달원 y 좌표
				yl = $("#yl").val();
				//고객 주소
				clientAddr = "";
				
				deliveryState = "W";
				websocket.send(JSON.stringify(new SocketMessage("delivery", deliveryNo, deliveryName ,deliveryAddr, xl, yl, clientAddr, deliveryState, "")));
				
				//server에서 데이터 보냈을 때 실행하는 메소드
				websocket.onmessage = function(data){
					console.log("onmessage에서 실행");
					console.log(data);
					
					const msg = JSON.parse(data.data);
					
					console.log(msg.type);
					switch(msg.type){
						case "server":
							addMessage(msg);
							break;
						case "business":
							var orderNo = msg.no;
							var storeName = msg.name;				
							var storeAddr = msg.addr;
							var storeXl = msg.xl;
							var storeYl = msg.yl;
							var clientAddr = msg.clientAddr;					
							var state = msg.state;
							var message = msg.msg;
											
							checkState=msg.state;
							console.log("사업자 상태값");
							console.log(state);	//S
							
							switch(msg.state){
							//사업자의 상태가 요청상태 일때
							case "W":
								//loading 화면 없애주기
								$("#loading").addClass("d-none");
								//order 화면 보이게 하기
								$("#order").removeClass("d-none");
								
								
								var card = $("<div>").attr({
									"class" : "card text-white bg-info mb-3"	
								});
								
								var cardHeader = $("<div>").addClass("card-header justify-content-between d-flex");
								
								var header1 = $("<div>").html($("<span>").html(storeName));
								var header2 = $("<div>").html($("<span>").html("배달비 : 2500원"));
								
								$(cardHeader).append(header1).append(header2);
								
								//객체생성해서 새로운 div 만들어주기
								var cardBody = $("<div>").addClass("card-body");
								
								var slider = $("<div>").addClass("slider1");
								
								var orderContainer = $("<div>").addClass("order-container");
								
								var item = $("<div>").attr({
									"class" : "item1 text-center"
								});
								
								var row = $("<div>").addClass("row justify-content-between align-items-center alert-info p-3");
								
								var storeInfo = $("<div>").addClass("store-info col border border-dark p-0 mr-3");
								
								var storeNameDiv = $("<div>").addClass("store-name d-flex flex-column");
								var storeName1 = $("<span>").addClass("h4").html("가게 명");										
								var storeName2 = $("<span>").addClass("h5").html(storeName);
								
								$(storeNameDiv).append(storeName1).append(storeName2);
								
								var storeAddrDiv = $("<div>").addClass("store-addr d-flex flex-column");
								var storeAddr1 = $("<span>").addClass("h4").html("가게 주소");
								var storeAddr2 = $("<span>").addClass("h5").html(storeAddr);
								
								$(storeAddrDiv).append(storeAddr1).append(storeAddr2);
								
								storeInfo = $(storeInfo).append(storeNameDiv).append(storeAddrDiv);
								
								var clientInfo = $("<div>").addClass("client-info col border border-dark ml-3 p-0");
								
								var clientAddrDiv = $("<div>").addClass("client-addr d-flex flex-column");
								var clientAddr1 = $("<span>").addClass("h4").html("배달 주소");
								var clientAddr2 = $("<span>").addClass("h5").html(clientAddr);
								
								$(clientAddrDiv).append(clientAddr1).append(clientAddr2);
								
								clientInfo = $(clientInfo).append(clientAddrDiv);
								
								var btn = $("<div>").addClass("delivery-btn d-flex flex-row justify-content-center mt-3 mb-0");
								
								var btnAccept = $("<button>").attr({
									"class" : "btn btn-primary mr-3 btn-acept",
									"type" : "button"
								}).html("수락");
								
								var btnReject = $("<button>").attr({
									"class" : "btn btn-primary btn-reg",
									"id" : "btn-reg",
									"type" : "button"
								}).html("거절");
								
								btn = $(btn).append(btnAccept).append(btnReject);
								
								row = $(row).append(storeInfo).append(clientInfo);
								
								item = $(item).append(row).append(btn);
								
								orderContainer = $(orderContainer).append(item);
								
								slider = $(slider).append(orderContainer);
								
								cardBody = $(cardBody).append(slider);
								
								$(card).append(cardHeader).append(cardBody);
								
								var it =$("<div>").addClass("item d-flex flex-row");
								$(it).append(card);
								$("#container-item").append(it);	
								
								count = $(".container>.item").length;
								console.log("count", count);
								//modal style 적용
								$(".slider").css({
									"position" : "relative",
									"overflow" : "hidden",
									"width" : width,
									"height" : height
								}).find(".container").css({
									"position" : "absolute",
								
									"overflow" : "hidden"
								}).find(".item").css({
									"width" : width,
									"height" : height
								});
								
								//거절 눌렀을 때
								$(".btn-reg").click(function(e){
									
									console.log(currentPage);
									console.log(count);
									
									$(e.target).parents(".item").remove();
									
								});
								
								//수락 눌렀을 때
								$(".btn-acept").click(function(e){
									deliveryState = "Y";
									websocket.send(JSON.stringify(new SocketMessage("delivery", orderNo, deliveryName ,deliveryAddr, xl, yl, clientAddr, deliveryState, phoneMessage)));
									$('#del-modal').modal('hide');
									
									
									//$("#deliveryman-info").empty();
									$("#deliveryman-info").find(".index-search-container").addClass("d-none");
									
									$("#deliveryman-info").find(".phone-container").removeClass("d-flex");
									$("#deliveryman-info").find(".phone-container").addClass("d-none");
									
									$("#deliveryman-info").append(it);
									$("#deliveryman-info").find(".delivery-btn").remove();
									
									
									//버튼 안보이게
									$("#bt-deliverProxy").addClass("d-none");
									var deliveryCompleteBtn = $("<button>").attr({
										"id" : "bt-deliveryComplete",
										"class" : "btn btn-info btn-lg btn-block",
										"type" : "button"
									}).html("배달 완료");
									
									$("#delevery-container").append(deliveryCompleteBtn);
									
									//db에 삽입
									$.ajax({
										url:"${pageContext.request.contextPath}/delivery/updateDelivery.do",
										data:{
											"m_No" : ${loginMember.m_No},
											"d_Status" : deliveryState,
											"d_X" : xl,
											"d_Y" : yl,
											"o_No" : orderNo,
											"store_Name" : storeName,
											"store_Address" : storeAddr,
											"client_Address" : clientAddr
										},
										success: function(data){
											if(data['result']>0)
											console.log("delivery update 성공");
										}
									});
									
									
									//배달 완료 눌렀을 때
									$("#bt-deliveryComplete").click(function(e){
										console.log("business의 상태값");
										console.log(checkState);	//W
										
										switch(checkState){
										case "S":
											console.log("완료 눌렀을 떄 떠야 함");
											
											$("#deliveryman-info").find(".index-search-container").removeClass("d-none");
											
											$("#deliveryman-info").find(".phone-container").addClass("d-flex");
											$("#deliveryman-info").find(".phone-container").removeClass("d-none");
											
											$(".item").addClass("d-none");
											$(".item").removeClass("d-flex");
											
											//배달완료 버튼 안보이게
											$(e.target).addClass("d-none");
											
											//배달검색 버튼 보이게
											$("#bt-deliverProxy").removeClass("d-none");
											
											deliveryState = "C";
											websocket.send(JSON.stringify(new SocketMessage("delivery", orderNo, deliveryName ,deliveryAddr, xl, yl, clientAddr, deliveryState, phoneMessage)));
											
											$.ajax({
												url:"${pageContext.request.contextPath}/delivery/updateDeliveryComplete.do",
												data:{
													"m_No" : ${loginMember.m_No},
													"d_Status" : "N"
												},
												success: function(data){
													if(data['result']>0)
													console.log("delivery update 성공 배달 완료 ^^");
												}
											});
											
											break;
										
										default:
											alert("먼저 가게에서 음식을 수령해주세요.");
											break;
										}
											
									});
									
								});
								
								break;
								
							//사업자의 상태가 출발상태 일때
							case "S":
								break;
							}
							
									
							break;
							
						case "client":
							
							if(msg.state == 'A'){
								
								var orderNoC = msg.no;
								var storeNameC = msg.name;
								var storeAddrC = msg.addr;
								var clientAddrC = msg.clientAddr;
								
								console.log("고객한테 온 메시지");
								console.log(storeNameC);
								console.log(storeAddrC);
								console.log(clientAddrC);
								
								navigator.geolocation.getCurrentPosition(function(pos) {
								    var latitude = pos.coords.latitude;
								    var longitude = pos.coords.longitude;
								    
								    //websocket.send(JSON.stringify(new SocketMessage("delivery", deliveryNo, deliveryName ,deliveryAddr, xl, yl, clientAddr, deliveryState, "")));
								    websocket.send(JSON.stringify(new SocketMessage("delivery", orderNoC, storeNameC, storeAddrC, longitude, latitude, clientAddrC, "A", "")));
								});
							}
							
							
							break;
					}
				}
				
				
				
				$("#bt-delivery").click();
			}
			
			
		});
		
		var currentPage = 0;
		var changePage = function(){
			$("#container-item").animate({
				"height" : -currentPage * 351
			}, 500);
		};
		
		
		
		function addMessage(msg){
			switch(msg.type){
				case "server":
					console.log(msg.msg);
					$("#server-msg").html(msg.msg);
					break;
			}
		}	
		
		
		
	})
	
	var geocoder = new kakao.maps.services.Geocoder();
	
	var callback2 = function(result, status) {
	    if (status === kakao.maps.services.Status.OK) {
	        $("#list").css("visibility","hidden");
	        $("#list").css("z-index","-1");
			$("#keyword").prop("value",result[0].address.address_name);
	    }
	};
	
	function getbrowserxy(){
		navigator.geolocation.getCurrentPosition(function(pos) {
		    var latitude = pos.coords.latitude;
		    var longitude = pos.coords.longitude;
		   
		    $("#xl").attr("value",longitude);
			$("#yl").attr("value",latitude);
			 
			
			var coord = new kakao.maps.LatLng(latitude, longitude);

			geocoder.coord2Address(coord.getLng(), coord.getLat(), callback2);
			
		});

	}
	</script>
</body>
</html>
