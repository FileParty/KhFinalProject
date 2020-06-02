<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0c4555610509aaa6cfd5fae61f00a23f&libraries=services"></script>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<%-- <c:set var="now" value="<%=new Date()%>" />
<c:set var="o" value="<%=new Date(new GregorianCalendar(2020,4,12).getTimeInMillis())%>" />
<fmt:parseDate value="2020/05/01 00:00:00" pattern="yyyy/MM/dd HH:mm:ss" var="odate"/>
${(o.time-odate.time)/(24*60*60*1000)}
<fmt:formatDate value="${now}" pattern="yyyy/MM/dd HH:mm:ss" var="sysdate"/>  --%>

<c:set var="o" value="<%=new Date(new GregorianCalendar().getTimeInMillis())%>" />
<fmt:parseDate value="2020/05/18 00:00:00" pattern="yyyy/MM/dd HH:mm:ss" var="odate"/>
<%-- <fmt:formatDate value="${(o.time-odate.time)/(24*60*60*1000)}" pattern="yyyy/MM/dd HH:mm:ss" var="sysdate"/>
${sysdate }  --%>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<style>
	    /*중복아이디체크관련*/
		    div#idMsg-container{position:relative; padding:0px;}
		    div#idMsg-container span.idMsg{display:none;font-size: 12px;position:absolute; top:12px; right:10px;}
		    div#idMsg-container span.ok{color:green;}
		    div#idMsg-conta  iner span.no{color:red;}
		    
		    .table {
					    border-top-style: none;
					    border-left-style: none;
					    border-right-style: none;
					    border-bottom-style: none;
					}
					
			#order{
		    	color:rgb(34, 190, 241);
		    }
		    * {
		    font-family:'Do Hyeon';
		    }
		    
</style>


<section>

    <div class="row">
        <div class="col-md-1"></div>

        <div class="row col-md-10">

            <jsp:include page="/WEB-INF/views/mypage/mypageSidebar.jsp"/>
            <div class="col-md-10 row">
            
            	<div class="col-md-12 style="margin-bottom:10px;"></div>
            
				<c:forEach items="${list }" var="m">
					<div class="col-md-6 row" style="margin-bottom:15px;">

                       <div class="col-md-2"></div>
                       <div class="col-md-8 order_content" style="border: 1px solid black; height:170px;">
                       	
							<input class="orderNo" type="hidden" value="${m['O_NO']}"/>
							<input class="storeNo"type="hidden" value="${m['S_NO']}"/>
							<input class="storeName" type="hidden" value="${m['S_NAME'] }"/>
							<input class="storeAddr" type="hidden" value="${m['S_ADDR'] }"/>
							<input class="clientAddr" type="hidden" value="${m['O_ADDR'] }"/>
							
							
                           <p style="text-align: center;"><strong style="font-size:20px;">${m['S_NAME'] }</strong></p>
                           <fmt:formatDate value="${m['O_DATE'] }" pattern="yyyy/MM/dd HH:mm" var="zdate"/>
                           <fmt:formatDate value="${m['O_DATE'] }" pattern="yyyy/MM/dd HH:mm:ss" var="ndate"/>
                           <fmt:parseDate value="${ndate }" pattern="yyyy/MM/dd HH:mm:ss" var="rdate"/>
                           <table style="width:100%;">
                           <tr>
                           		<td style="text-align: left" >
                           			<button class="${(o.time-rdate.time)/(60*1000)<180 && m['O_STATUS']=='배달완료' && m['O_REVIEW_FLAG']=='false' ?'':'d-none'} reviewInsertButton" onclick="reviewInsertModal('${m['S_NO']}', '${m['M_NO'] }', '${m['O_NO'] }');">리뷰쓰기</button>	
                           		</td>
                         		<c:choose>
                          			<c:when test="${m['O_STATUS']=='주문취소' }">
		                          		<td id="o_state_${m['O_NO']}" style="text-align:right; color:red;">
		                           			${m['O_STATUS'] }
		                               	</td>
                               		</c:when>
                               		<c:when test="${m['O_STATUS']=='배달완료' }">
	                               		<td id="o_state_${m['O_NO']}" style="text-align:right; color:blue;">
	                               			${m['O_STATUS'] }
	                               		</td>
                               		</c:when>
                               		<c:when test="${m['O_STATUS']=='주문완료' }">
	                               		<td id="o_state_${m['O_NO']}" style="text-align:right; color:green;" class="state-${orderNo}">
	                               			주문접수
	                               		</td>
	                               		<input type="hidden" value="${m['O_NO'] }" class="order-state"/>
                               		</c:when>
                               		<c:otherwise>
                               			<td id="o_state_${m['O_NO']}" style="text-align:right; color:green;" class="state-${orderNo}">
	                               			${m['O_STATUS'] }
	                               		</td>
	                               		<input type="hidden" value="${m['O_NO'] }" class="order-state"/>
                               		</c:otherwise>
                              	</c:choose>
                           </tr>
                           </table>
                           <table style="width:100%">
                               <tr>
                                   <td><img width="80" height="80" src="${path }/resources/upload/store/${m['S_LOGIMG']}"/></td>
                                   <td style="text-align: right;">
                                       <p style="text-align: right;"><strong>${zdate}</strong></p>
                                       <p style="text-align: right;"><strong class="money">${m['O_PAYPRICE'] }</strong></p>
                                   </td>
                               </tr>
                           </table>

                       </div>
                       <div class="col-md-2"></div>
                   </div>
				</c:forEach>
				
                </div>
                
                


            </div>

            <div class="col-md-1"></div>
            
            <c:if test="${fn:length(list)>1 }">
	            <div id="page-container" class="col-md-12">
	        		${pageBar }
		        </div>
	        </c:if>

        </div>
        
<!--         <div id="modal" style="display: none;">
          
            <div class="modal_content">
                <div class="row">
                    <div class="col-md-2"></div>
                    <div class="col-md-8 info-container">
                        <p style="text-align: center;"><strong></strong></p>
                        <table id="modal-tbl" style="width:100%">
                            <tr>
                                <td><img/></td>
                                <td style="text-align: right;">
                                    <p style="text-align: right;"><strong></strong></p>
                                    <p style="text-align: right;"><strong></strong></p>
                                </td>
                            </tr>
                        </table>
                        <br>
                        <table class="table" id="menu-tbl">
                        </table>
                        
                    </div>
                    <div class="col-md-2"></div>
            	</div>
            <div class="modal_layer"></div>
        	</div>
        
        </div> -->
        
        <!--  -->
        
        <div id="modalBox" class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
					</div>
					<div class="modal-body info-container">
                        <p style="text-align: center;"><strong></strong></p>
                        <table id="modal-tbl" style="width:100%">
                            <tr>
                                <td><img/></td>
                                <td style="text-align: right;">
                                    <p style="text-align: right;"><strong></strong></p>
                                    <p style="text-align: right;"><strong></strong></p>
                                </td>
                            </tr>
                        </table>
                        <br>
                        <table class="table" id="menu-tbl">
                        </table>
                        
                       
					</div>
					<div class="modal-footer">
					</div>
				</div>
			</div>
		</div>
		
		<!--  -->
        
        <div id="modal2" style="display: none;">
            <div class="modal_content">
                <div class="row">
                    <div class="col-md-2"></div>
                    <div class="col-md-8">
                    	<form name="review" action="${path}/mypage/insertReview.do" method="post" onsubmit="return confirm();"  enctype="multipart/form-data" >
                    		<input id="s_no" name="s_no" type="hidden" /><input id="m_no" name="m_no" type="hidden" /><input id="o_no" name="o_no" type="hidden" />
	                        <p style="text-align: center;"><strong></strong></p>
	                        <table id="modal-tbl" style="width:100%">
	                            <tr>
	                                <th style="text-align:center;"><h3>${loginMember.m_Nickname }</h3></th>
	                            </tr>
	                            
	                            <tr><td><br></td></tr>
	                            
	                            <tr>  
	                                <th id="scoreTaste" style="text-align:center;">
	                                	<h3 style="display:inline; vertical-align:middle">맛: </h3>
	                                	<input type="hidden" id="taste" name="taste" value="0">
	                                </th>
	                            </tr>
	                            <tr>  
	                                <th id="scoreAmount" style="text-align:center;">
	                                	<h3 style="display:inline; vertical-align:middle">양: </h3>
	                                	<input type="hidden" id="amount" name="amount" value="0">
	                                </th>
	                            </tr>
	                            <tr>  
	                                <th id="scoreDelivery" style="text-align:center;">
	                                	<h3 style="display:inline; vertical-align:middle">배달: </h3>
	                                	<input type="hidden" id="delivery" name="delivery" value="0">
	                                </th>
	                            </tr>
	                            
	                            <tr><td><br></td></tr>
	                            
	                            <tr>
	                            	<td><textarea style="font-weight:300" cols="38" rows="10" id="reviewCon" name="reviewCon" placeholder="          솔직한 리뷰 작성해주세요~"></textarea></td>
	                            </tr>
	                        </table>
	                        
	                        <div id="preview" style="width:130%; height:100%; text-align:center; margin-left:50%; transform:translateX(-50%);" >
	                        	
	                        </div>
	                        
	                        <div id="fileUp" class="border border-dark rounded row justify-content-center align-items-center" style="width:100px; height:100px; margin-left:50%; transform:translateX(-50%); margin-top:10px;">
	                        
	                        	<div style="margin-top:20px">
	                        		<img src="${path }/resources/img/mypage/picture.PNG" />
	                        	</div>
	                        	<p>사진추가</p>
	                        </div>
	                        <div style="text-align:center; margin-top:10px;">
	                        	<input type="hidden" value="">
	                        	<input type="submit" value="작성완료">
							</div>
	                        <!-- <input id='upload0' type='file' name='upload' class='rounded d-none'>
	                        <input id='upload1' type='file' name='upload' class='rounded d-none'>
	                        <input id='upload2' type='file' name='upload' class='rounded d-none'> -->
	                        
	                        
	                        
	                        
	                        
	                    </div>
	                    <div class="col-md-2"></div>
            			</form>
            	</div>
            <div class="modal_layer"></div>
        </div>
        </div>

        
        <!--  -->
        
        
        <div id="modal3" style="display: none;">
            <div class="modal_content">
                <div class="row">
                    <div class="col-md-2"></div>
                    <div class="col-md-8">
                        <p style="text-align: center;"><strong></strong></p>
                        <table id="modal-tbl" style="width:100%">
                            <tr>
                                <td><img width="100px" height="100px"/></td>
                                <td style="text-align: right;">
                                    <p style="text-align: right;"><strong></strong></p>
                                    <p style="text-align: right;"><strong></strong></p>
                                </td>
                            </tr>
                        </table>
                        <br>
                        <table class="table" id="menu-tbl">
                        </table>
                    </div>
                    <div class="col-md-2"></div>
            	</div>
            <div class="modal_layer"></div>
        	</div>
        </div>
        
        
        <!--  -->
        
        <script>
	
			/* navigator.geolocation.getCurrentPosition(function(pos) {
			    var latitude = pos.coords.latitude;
			    var longitude = pos.coords.longitude;
			    alert("현재 위치는 : " + latitude + ", "+ longitude);
			}); */


			//현재 페이지의 모든 td 값 가져옴
			//주문대기 배달중 .. 
			
			//숫자 count 주문대기 접수 or 배달중 인애들 만 
			
			
			var orderState = $(".order-state");
			
			//주문접수 or 배달중인 상태의 orderNo 값
			var orderNo="";
			
			$.each(orderState, function(i,v){
				if(i==0) orderNo += $(v).val();
				else orderNo += ","+$(v).val();
			});
			
			console.log(orderNo);
			
			var type = "client";
			//고객번호
			var clientNo = ${loginMember.m_No};
			//고객이름
			var clientName = "${loginMember.m_Name}";
			//고객 주소
			var clientAddress;
			//고객 x좌표
			var clientXl;
			//고객 y좌표
			var clientYl;
			//가게 주소
			var storeAddress;
			//가게 
			var clientState = "W";
			//메시지
			var clientMessage = orderNo;
			
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
			
			const websocket = new WebSocket("wss://rclass.iptime.org${pageContext.request.contextPath}/delivery");
  	   		//const websocket = new WebSocket("ws://localhost:9090${pageContext.request.contextPath}/delivery");
		
			websocket.onopen = function(data){
				websocket.send(JSON.stringify(new SocketMessage(type, clientNo, clientName, clientAddress, clientXl, clientYl, storeAddress, clientState, clientMessage)));
			}  
		
			
			
			websocket.onmessage = function(data){
				const msg = JSON.parse(data.data);
				
				console.log("왜안와");
				console.log(msg);
				console.log(msg.type);
				

				switch(msg.type){
				
				case "server":
					console.log("서버에서 온 메세지");
					console.log(msg.msg);
					alert(msg.msg);
					break;
				
				case "business":
					var businessMsg = msg.msg;
					var orderNoFromBusiness = msg.no;
					var storeNameFromBusiness = msg.name;
					var storeAddressFromBusiness = msg.addr;
					var storeXlFromBusiness = msg.xl;
					var storeYlFromBusiness = msg.yl;
					var clientAddressFromBusiness = msg.clientAddr;
				
					console.log("메시지가 왓나요");
					console.log(businessMsg);
					console.log()
					
					var order = $(".order-state");
					
					$.each(order, function(i,v){
						if(i==0) orderNo += $(v).val();
						else orderNo += ","+$(v).val();
						
						if($(v).val() == orderNoFromBusiness){
						
						
							$(v).siblings("td").eq(1).html("배달중");
							
							if(orderNoFromBusiness == $(v).val()){
								$(v).siblings("td").eq(1).attr({
									"data-toggle" : "tooltip",
	  								"data-placement" : "top",
	  								"title" : businessMsg
								})
							
								$(v).siblings("td").eq(1).tooltip("show");
								
								var toggleHide = function(){
									$(v).siblings("td").eq(1).tooltip('hide');
								}
								
								//3초뒤에 없애기
								setTimeout(toggleHide, 3000);
							}
						
						}				
					});
					
					break;
					
				case "delivery":
					
					console.log("몬가요");
					console.log(msg.state);
					
					
					switch(msg.state){
					case "C":
						
						console.log("배달 완료 햇을 때");
						console.log(msg);
						console.log(msg.no);
						
						$("#o_state_"+msg.no).html("배달완료");
						
						break;
						
					default :
						
						console.log(msg);
					console.log(msg.xl);
					console.log(msg.yl);
					console.log("배달원한테 온 no 갑승ㄴ?");
					console.log(msg.no);
					
					var orderNoD = msg.no;
					var storeNameD = msg.name;
					var storeAddrD = msg.addr;
					var deliveryXl = msg.xl;
					var deliveryYl = msg.yl;
					var clientAddrD = msg.clientAddr;
					var stateD = msg.state;
					
					console.log("배달원 지도 마크 찍을 때");
					console.log(deliveryXl);
					console.log(deliveryYl);
					console.log(orderNoD);
					
					$.ajax({
						//배달원 위도 경도 update
						//지도 배달원 마크 찍어줌
						url : "${pageContext.request.contextPath}/delivery/updateDeliveryPosition.do",
						data:{
							"d_X":deliveryXl,
							"d_Y":deliveryYl,
							"o_No":orderNoD
						},	
						success:function(data){
							if(data['result']>0){
								//delivery x,y도 가져와야한다.
								
								var thdata = $("#modalBox").data("thdata");
	        	
					        	var orderNoDiv = $(thdata).find(".orderNo").val();
					        	console.log("지워질떄");
					        	console.log(orderNoDiv);
					        	$("#wrap-"+orderNoDiv).remove();
								
			        			var deliveryXy;
			        			
			        			var mapWrap = $("<div>").attr({
			        				"class" : "map_wrap d-flex flex-column align-items-center",
			        				"id" : "wrap-"+orderNoD
			        			});
			        			
			        			var buttonWrap = $("<div>").attr({
			        				"class" : "border border-success rounded mb-3 text-center w-50"
			        			});
			        			
			        			var buttonSpan = $("<span>").attr({
			        				"id":"delivery_position",
			        				"class":"btn delivery-position-btn"
			        			}).html("배달원 위치 보기");
			        			
			        			var mapDiv = $("<div>").attr({
			    					"id":"map-"+orderNoD,
			    					"style":"width:100%;height:350px"
			    				}) 
			    				
			    				buttonWrap.append(buttonSpan);
			        			mapWrap.append(buttonWrap).append(mapDiv);
			    				
			    				$(".info-container").append(mapWrap);
			    				
			    				$(".delivery-position-btn").click(function(){
			    	        		var thdata = $("#modalBox").data("thdata");
			    	        		var orderNoDiv = $(thdata).find(".orderNo").val();
			    	        		var storeNameDiv = $(thdata).find(".storeName").val();
			    	        		var storeAddrDiv = $(thdata).find(".storeAddr").val();
			    	        		var clientAddrDiv = $(thdata).find(".clientAddr").val();
			    	        		var orderStateDiv = $.trim($("#o_state_"+orderNoDiv).html());
		    	        			
									console.log("주문 상태 출력 해바");
									console.log(orderStateDiv);
			    	        		console.log("버튼 클릭했을 떄");
			    	        		console.log(orderNoDiv);
			    	        		console.log(storeNameDiv);
			    	        		console.log(clientAddrDiv);
			    	        		console.log(orderStateDiv);
			    	        		
			    	        		websocket.send(JSON.stringify(new SocketMessage("client", orderNoDiv, storeNameDiv, storeAddrDiv, "", "", clientAddrDiv, "A", "")));
			            		});
			    				
			            		//
			            		
			            		//$(".info-container").children("div").addClass("d-none");
			            		//$(".info-container").children("#map-"+orderNoFromBusiness).removeClass("d-none");
			    				
			            		var geco = new kakao.maps.services.Geocoder();
			            		var stoa;
			            		var stoy;
			            		var stox;
			            		
			            		geco.addressSearch(storeNameD, function(result, status) {

			            		    // 정상적으로 검색이 완료됐으면 
			            		     if (status === kakao.maps.services.Status.OK) {

			            		        stoa = new kakao.maps.LatLng(result[0].y, result[0].x);
			            		        stoy = result[0].y;
			            		        stox = result[0].x;
			            		     }
			            		});
			            		
			    				var mapContainer = document.getElementById("map-"+orderNoD), // 지도를 표시할 div 
			    				
			    				mapOption = {
			    				        center: new kakao.maps.LatLng(stoy, stox), // 지도의 중심좌표
			    				        level:3 // 지도의 확대 레벨
			    				    };  

			    				// 지도를 생성합니다    
			    				var map = new kakao.maps.Map(mapContainer, mapOption); 

			    				// 주소-좌표 변환 객체를 생성합니다
			    				var geocoder = new kakao.maps.services.Geocoder();

			    				var coords;			    				 
			        			
			        			deliveryXy= new kakao.maps.LatLng(deliveryYl, deliveryXl);
			        			
			    				// 주소로 좌표를 검색합니다
			    				geocoder.addressSearch(clientAddrD, function(result, status) {

			    				    // 정상적으로 검색이 완료됐으면 
			    				     if (status === kakao.maps.services.Status.OK) {

			    				        coords = new kakao.maps.LatLng(result[0].y, result[0].x);
			    						
			    				         var bounds = new kakao.maps.LatLngBounds();    
			    				         
			    				         var positions = [
			    									{
			    										title: '우리집',
			    										latlng: coords
			    									},
			    									{
			    										title: storeNameD,
			    										latlng: stoa
			    									},
			    									{
			    										title: '배달원',
			    										latlng: deliveryXy
			    									}
			    								];
			    				         
			    				         for(var i=0; i<positions.length; i++){
			    				        	 
			    				        	 if(positions[i].latlng != null){
			    									var marker = new kakao.maps.Marker({
			    										map: map,
			    										position: positions[i].latlng,
			    										title: positions[i].title,
			    									});
			    									
			    									marker.setMap(map);
			    									markers.push(marker);
			    				       				bounds.extend(positions[i].latlng);
			    				        	 }
			    				        	 
			    				             		

			    				        // 인포윈도우로 장소에 대한 설명을 표시합니다
			    				        
			    				        if(positions[i].latlng != null){
			    				        var infowindow = new kakao.maps.InfoWindow({
			    				            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+positions[i].title+'</div>'
			    				        });
			    				        	infowindow.open(map, marker);
			    				        }   
			    				         }
			    				        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			    				        //map.setCenter(coords);
			    				         map.setBounds(bounds);
			    				    } 
			    				    
			    				    
			    				});
							}
						}
					})
						
						break;
						
					}
					
					
					
					break;
				}
			}
 
		
       		 var markers =[];
        	
        	var img_count = 0;
        	
        	var preview = $("#preview");
        	
        	 function chk_file_type(obj) {
        		 var file_kind = obj.value.lastIndexOf('.');
        		 var file_name = obj.value.substring(file_kind+1,obj.length);
        		 var file_type = file_name.toLowerCase();



        		 var check_file_type = check_file_type=['jpg','gif','png','jpeg','bmp'];

        		 



       			if(check_file_type.indexOf(file_type)==-1){
        		  alert('이미지 파일만 선택할 수 있습니다.');
        		  var parent_Obj=obj.parentNode
        		  var node=parent_Obj.replaceChild(obj.cloneNode(true),obj);
        		  return false;
       			}
       			
       			return true;
       		} 
        	
        	function confirm(){
        		if($("#taste").val()==0 || $("#amount").val()==0 || $("#delivery").val()==0){
        			alert("별점을 입력해주세요!");
        			return false;
        		}
        		
        		if($("#reviewCon").val()==""){
        			alert("리뉴 내용을 작성해주세요");
        			return false;
        		}
        	}
        	
        	
        	$("#fileUp").on("click", function(){
        		$("#upload"+img_count).remove();
        		$("#fileUp").after("<input id='upload"+ img_count +"' type='file' name='upload' class='rounded d-none' accept='image/jpeg,image/gif,image/png' onchange='img_preview(this);'/>");
        		$("#upload" + img_count).click();
        		
        		console.log($("#upload" + img_count));
        		console.log(img_count);
        		
        		
        		if(document.getElementById("upload"+img_count).files.length==0){
					        			
        		}
        		
        	});
        	
        	
        	function img_preview(obj){
        		
        		var flag = chk_file_type(obj);
        		if(!flag){
        			return;
        		}
        		
        		var upload = $("#upload"+img_count);
        		
        		var getFile = event.target.files;
        		
        		var image = document.createElement('img');
        		
        		var reader = new FileReader();
        		
        		 /* reader 시작시 함수 구현 */
                reader.onload = (function (aImg) {
                    console.log(1);
         
                    return function (e) {
                        console.log(3);
                        /* base64 인코딩 된 스트링 데이터 */
                        aImg.src = e.target.result;
                        aImg.width = 100;
                        aImg.height = 100;
                        aImg.style.marginTop = 10;
                    }
                })(image)
         
                if(getFile){
                    /* 
                        get_file[0] 을 읽어서 read 행위가 종료되면 loadend 이벤트가 트리거 되고 
                        onload 에 설정했던 return 으로 넘어간다.
                                                        이와 함게 base64 인코딩 된 스트링 데이터가 result 속성에 담겨진다.
                    */
                    reader.readAsDataURL(getFile[0]);
                    console.log(2);
                }
        		
        		if(img_count%3==0){
        			$("#preview").append("<div id='img_"+ img_count +"' style='width:100%; height:100%; display:inline;'></div>");
        			$("#img_"+img_count).append(image);
        		}
        		else if(img_count%3==1){
        			image.style.marginLeft = 10;
        			$("#img_"+(img_count-1)).append(image);
        		}else{
        			image.style.marginLeft = 10;
        			$("#img_"+(img_count-2)).append(image);
        		}
        		
        		
        		if(event.target.files.length == 0){
        			
        			
        		}else{
        			img_count++;
        		}
        	}
        	
        	
        	
        
	        function scoreTasteSet(no){
	        	
	        	$("#scoreTaste").children("svg").remove();
	        	
	        	if(no==0){
	        		
	        		for(var i=0; i<1; i++){
	        			$("#scoreTaste").append("<svg style='margin-right:3px;' onclick='scoreTasteSet("+ i +")' id='score' class='bi bi-star-fill' width='30px' height='30px' viewBox='0 0 16 16' fill='currentColor' xmlns='http://www.w3.org/2000/svg'><path d='M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z'/></svg>");	        			
	        		}
	        		for(var i=1; i<5; i++){
	        			$("#scoreTaste").append("<svg style='margin-right:3px;' onclick='scoreTasteSet("+ i +")' id='score"+ i +"' class='bi bi-star' width='30px' height='30px' viewBox='0 0 16 16' fill='currentColor' xmlns='http://www.w3.org/2000/svg'><path fill-rule='evenodd' d='M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.523-3.356c.329-.314.158-.888-.283-.95l-4.898-.696L8.465.792a.513.513 0 00-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767l-3.686 1.894.694-3.957a.565.565 0 00-.163-.505L1.71 6.745l4.052-.576a.525.525 0 00.393-.288l1.847-3.658 1.846 3.658a.525.525 0 00.393.288l4.052.575-2.906 2.77a.564.564 0 00-.163.506l.694 3.957-3.686-1.894a.503.503 0 00-.461 0z' clip-rule='evenodd'/></svg>");
	        		}
	        		$("#taste").val(1);
	        		
	        	}else if(no==1){
	        		
	        		for(var i=0; i<2; i++){
	        			$("#scoreTaste").append("<svg style='margin-right:3px;' onclick='scoreTasteSet("+ i +")' id='score"+ i +"' class='bi bi-star-fill' width='30px' height='30px' viewBox='0 0 16 16' fill='currentColor' xmlns='http://www.w3.org/2000/svg'><path d='M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z'/></svg>");	        			
	        		}
	        		for(var i=2; i<5; i++){
	        			$("#scoreTaste").append("<svg style='margin-right:3px;' onclick='scoreTasteSet("+ i +")' id='score"+ i +"' class='bi bi-star' width='30px' height='30px' viewBox='0 0 16 16' fill='currentColor' xmlns='http://www.w3.org/2000/svg'><path fill-rule='evenodd' d='M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.523-3.356c.329-.314.158-.888-.283-.95l-4.898-.696L8.465.792a.513.513 0 00-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767l-3.686 1.894.694-3.957a.565.565 0 00-.163-.505L1.71 6.745l4.052-.576a.525.525 0 00.393-.288l1.847-3.658 1.846 3.658a.525.525 0 00.393.288l4.052.575-2.906 2.77a.564.564 0 00-.163.506l.694 3.957-3.686-1.894a.503.503 0 00-.461 0z' clip-rule='evenodd'/></svg>");
	        		}
	        		$("#taste").val(2);
	        	}else if(no==2){
	        		
	        		for(var i=0; i<3; i++){
	        			$("#scoreTaste").append("<svg style='margin-right:3px;' onclick='scoreTasteSet("+ i +")' id='score"+ i +"' class='bi bi-star-fill' width='30px' height='30px' viewBox='0 0 16 16' fill='currentColor' xmlns='http://www.w3.org/2000/svg'><path d='M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z'/></svg>");	        			
	        		}
	        		for(var i=3; i<5; i++){
	        			$("#scoreTaste").append("<svg style='margin-right:3px;' onclick='scoreTasteSet("+ i +")' id='score"+ i +"' class='bi bi-star' width='30px' height='30px' viewBox='0 0 16 16' fill='currentColor' xmlns='http://www.w3.org/2000/svg'><path fill-rule='evenodd' d='M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.523-3.356c.329-.314.158-.888-.283-.95l-4.898-.696L8.465.792a.513.513 0 00-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767l-3.686 1.894.694-3.957a.565.565 0 00-.163-.505L1.71 6.745l4.052-.576a.525.525 0 00.393-.288l1.847-3.658 1.846 3.658a.525.525 0 00.393.288l4.052.575-2.906 2.77a.564.564 0 00-.163.506l.694 3.957-3.686-1.894a.503.503 0 00-.461 0z' clip-rule='evenodd'/></svg>");
	        		}
	        		$("#taste").val(3);
	        	}else if(no==3){
	        		
	        		for(var i=0; i<4; i++){
	        			$("#scoreTaste").append("<svg style='margin-right:3px;' onclick='scoreTasteSet("+ i +")' id='score"+ i +"' class='bi bi-star-fill' width='30px' height='30px' viewBox='0 0 16 16' fill='currentColor' xmlns='http://www.w3.org/2000/svg'><path d='M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z'/></svg>");	        			
	        		}
	        		for(var i=4; i<5; i++){
	        			$("#scoreTaste").append("<svg style='margin-right:3px;' onclick='scoreTasteSet("+ i +")' id='score"+ i +"' class='bi bi-star' width='30px' height='30px' viewBox='0 0 16 16' fill='currentColor' xmlns='http://www.w3.org/2000/svg'><path fill-rule='evenodd' d='M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.523-3.356c.329-.314.158-.888-.283-.95l-4.898-.696L8.465.792a.513.513 0 00-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767l-3.686 1.894.694-3.957a.565.565 0 00-.163-.505L1.71 6.745l4.052-.576a.525.525 0 00.393-.288l1.847-3.658 1.846 3.658a.525.525 0 00.393.288l4.052.575-2.906 2.77a.564.564 0 00-.163.506l.694 3.957-3.686-1.894a.503.503 0 00-.461 0z' clip-rule='evenodd'/></svg>");
	        		}
	        		$("#taste").val(4);
	        	}else if(no==4){
	        		
	        		for(var i=0; i<5; i++){
	        			$("#scoreTaste").append("<svg style='margin-right:3px;' onclick='scoreTasteSet("+ i +")' id='score"+ i +"' class='bi bi-star-fill' width='30px' height='30px' viewBox='0 0 16 16' fill='currentColor' xmlns='http://www.w3.org/2000/svg'><path d='M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z'/></svg>");	        			
	        		}
	        		$("#taste").val(5);
	        	}
	        }
	        
			function scoreAmountSet(no){
	        	
	        	$("#scoreAmount").children("svg").remove();
	        	
	        	if(no==0){
	        		
	        		for(var i=0; i<1; i++){
	        			$("#scoreAmount").append("<svg style='margin-right:3px;' onclick='scoreAmountSet("+ i +")' id='score' class='bi bi-star-fill' width='30px' height='30px' viewBox='0 0 16 16' fill='currentColor' xmlns='http://www.w3.org/2000/svg'><path d='M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z'/></svg>");	        			
	        		}
	        		for(var i=1; i<5; i++){
	        			$("#scoreAmount").append("<svg style='margin-right:3px;' onclick='scoreAmountSet("+ i +")' id='score"+ i +"' class='bi bi-star' width='30px' height='30px' viewBox='0 0 16 16' fill='currentColor' xmlns='http://www.w3.org/2000/svg'><path fill-rule='evenodd' d='M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.523-3.356c.329-.314.158-.888-.283-.95l-4.898-.696L8.465.792a.513.513 0 00-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767l-3.686 1.894.694-3.957a.565.565 0 00-.163-.505L1.71 6.745l4.052-.576a.525.525 0 00.393-.288l1.847-3.658 1.846 3.658a.525.525 0 00.393.288l4.052.575-2.906 2.77a.564.564 0 00-.163.506l.694 3.957-3.686-1.894a.503.503 0 00-.461 0z' clip-rule='evenodd'/></svg>");
	        		}
	        		$("#amount").val(1);
	        	}else if(no==1){
	        		
	        		for(var i=0; i<2; i++){
	        			$("#scoreAmount").append("<svg style='margin-right:3px;' onclick='scoreAmountSet("+ i +")' id='score"+ i +"' class='bi bi-star-fill' width='30px' height='30px' viewBox='0 0 16 16' fill='currentColor' xmlns='http://www.w3.org/2000/svg'><path d='M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z'/></svg>");	        			
	        		}
	        		for(var i=2; i<5; i++){
	        			$("#scoreAmount").append("<svg style='margin-right:3px;' onclick='scoreAmountSet("+ i +")' id='score"+ i +"' class='bi bi-star' width='30px' height='30px' viewBox='0 0 16 16' fill='currentColor' xmlns='http://www.w3.org/2000/svg'><path fill-rule='evenodd' d='M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.523-3.356c.329-.314.158-.888-.283-.95l-4.898-.696L8.465.792a.513.513 0 00-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767l-3.686 1.894.694-3.957a.565.565 0 00-.163-.505L1.71 6.745l4.052-.576a.525.525 0 00.393-.288l1.847-3.658 1.846 3.658a.525.525 0 00.393.288l4.052.575-2.906 2.77a.564.564 0 00-.163.506l.694 3.957-3.686-1.894a.503.503 0 00-.461 0z' clip-rule='evenodd'/></svg>");
	        		}
	        		$("#amount").val(2);
	        	}else if(no==2){
	        		
	        		for(var i=0; i<3; i++){
	        			$("#scoreAmount").append("<svg style='margin-right:3px;' onclick='scoreAmountSet("+ i +")' id='score"+ i +"' class='bi bi-star-fill' width='30px' height='30px' viewBox='0 0 16 16' fill='currentColor' xmlns='http://www.w3.org/2000/svg'><path d='M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z'/></svg>");	        			
	        		}
	        		for(var i=3; i<5; i++){
	        			$("#scoreAmount").append("<svg style='margin-right:3px;' onclick='scoreAmountSet("+ i +")' id='score"+ i +"' class='bi bi-star' width='30px' height='30px' viewBox='0 0 16 16' fill='currentColor' xmlns='http://www.w3.org/2000/svg'><path fill-rule='evenodd' d='M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.523-3.356c.329-.314.158-.888-.283-.95l-4.898-.696L8.465.792a.513.513 0 00-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767l-3.686 1.894.694-3.957a.565.565 0 00-.163-.505L1.71 6.745l4.052-.576a.525.525 0 00.393-.288l1.847-3.658 1.846 3.658a.525.525 0 00.393.288l4.052.575-2.906 2.77a.564.564 0 00-.163.506l.694 3.957-3.686-1.894a.503.503 0 00-.461 0z' clip-rule='evenodd'/></svg>");
	        		}
	        		$("#amount").val(3);
	        	}else if(no==3){
	        		
	        		for(var i=0; i<4; i++){
	        			$("#scoreAmount").append("<svg style='margin-right:3px;' onclick='scoreAmountSet("+ i +")' id='score"+ i +"' class='bi bi-star-fill' width='30px' height='30px' viewBox='0 0 16 16' fill='currentColor' xmlns='http://www.w3.org/2000/svg'><path d='M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z'/></svg>");	        			
	        		}
	        		for(var i=4; i<5; i++){
	        			$("#scoreAmount").append("<svg style='margin-right:3px;' onclick='scoreAmountSet("+ i +")' id='score"+ i +"' class='bi bi-star' width='30px' height='30px' viewBox='0 0 16 16' fill='currentColor' xmlns='http://www.w3.org/2000/svg'><path fill-rule='evenodd' d='M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.523-3.356c.329-.314.158-.888-.283-.95l-4.898-.696L8.465.792a.513.513 0 00-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767l-3.686 1.894.694-3.957a.565.565 0 00-.163-.505L1.71 6.745l4.052-.576a.525.525 0 00.393-.288l1.847-3.658 1.846 3.658a.525.525 0 00.393.288l4.052.575-2.906 2.77a.564.564 0 00-.163.506l.694 3.957-3.686-1.894a.503.503 0 00-.461 0z' clip-rule='evenodd'/></svg>");
	        		}
	        		$("#amount").val(4);
	        	}else if(no==4){
	        		
	        		for(var i=0; i<5; i++){
	        			$("#scoreAmount").append("<svg style='margin-right:3px;' onclick='scoreAmountSet("+ i +")' id='score"+ i +"' class='bi bi-star-fill' width='30px' height='30px' viewBox='0 0 16 16' fill='currentColor' xmlns='http://www.w3.org/2000/svg'><path d='M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z'/></svg>");	        			
	        		}
	        		$("#amount").val(5);
	        	}
	        }
	        
			function scoreDeliverySet(no){
				
				$("#scoreDelivery").children("svg").remove();
				
				if(no==0){
					
					for(var i=0; i<1; i++){
						$("#scoreDelivery").append("<svg style='margin-right:3px;' onclick='scoreDeliverySet("+ i +")' id='score' class='bi bi-star-fill' width='30px' height='30px' viewBox='0 0 16 16' fill='currentColor' xmlns='http://www.w3.org/2000/svg'><path d='M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z'/></svg>");	        			
					}
					for(var i=1; i<5; i++){
						$("#scoreDelivery").append("<svg style='margin-right:3px;' onclick='scoreDeliverySet("+ i +")' id='score"+ i +"' class='bi bi-star' width='30px' height='30px' viewBox='0 0 16 16' fill='currentColor' xmlns='http://www.w3.org/2000/svg'><path fill-rule='evenodd' d='M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.523-3.356c.329-.314.158-.888-.283-.95l-4.898-.696L8.465.792a.513.513 0 00-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767l-3.686 1.894.694-3.957a.565.565 0 00-.163-.505L1.71 6.745l4.052-.576a.525.525 0 00.393-.288l1.847-3.658 1.846 3.658a.525.525 0 00.393.288l4.052.575-2.906 2.77a.564.564 0 00-.163.506l.694 3.957-3.686-1.894a.503.503 0 00-.461 0z' clip-rule='evenodd'/></svg>");
					}
					$("#delivery").val(1);
				}else if(no==1){
					
					for(var i=0; i<2; i++){
						$("#scoreDelivery").append("<svg style='margin-right:3px;' onclick='scoreDeliverySet("+ i +")' id='score"+ i +"' class='bi bi-star-fill' width='30px' height='30px' viewBox='0 0 16 16' fill='currentColor' xmlns='http://www.w3.org/2000/svg'><path d='M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z'/></svg>");	        			
					}
					for(var i=2; i<5; i++){
						$("#scoreDelivery").append("<svg style='margin-right:3px;' onclick='scoreDeliverySet("+ i +")' id='score"+ i +"' class='bi bi-star' width='30px' height='30px' viewBox='0 0 16 16' fill='currentColor' xmlns='http://www.w3.org/2000/svg'><path fill-rule='evenodd' d='M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.523-3.356c.329-.314.158-.888-.283-.95l-4.898-.696L8.465.792a.513.513 0 00-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767l-3.686 1.894.694-3.957a.565.565 0 00-.163-.505L1.71 6.745l4.052-.576a.525.525 0 00.393-.288l1.847-3.658 1.846 3.658a.525.525 0 00.393.288l4.052.575-2.906 2.77a.564.564 0 00-.163.506l.694 3.957-3.686-1.894a.503.503 0 00-.461 0z' clip-rule='evenodd'/></svg>");
					}
					$("#delivery").val(2);
				}else if(no==2){
					
					for(var i=0; i<3; i++){
						$("#scoreDelivery").append("<svg style='margin-right:3px;' onclick='scoreDeliverySet("+ i +")' id='score"+ i +"' class='bi bi-star-fill' width='30px' height='30px' viewBox='0 0 16 16' fill='currentColor' xmlns='http://www.w3.org/2000/svg'><path d='M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z'/></svg>");	        			
					}
					for(var i=3; i<5; i++){
						$("#scoreDelivery").append("<svg style='margin-right:3px;' onclick='scoreDeliverySet("+ i +")' id='score"+ i +"' class='bi bi-star' width='30px' height='30px' viewBox='0 0 16 16' fill='currentColor' xmlns='http://www.w3.org/2000/svg'><path fill-rule='evenodd' d='M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.523-3.356c.329-.314.158-.888-.283-.95l-4.898-.696L8.465.792a.513.513 0 00-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767l-3.686 1.894.694-3.957a.565.565 0 00-.163-.505L1.71 6.745l4.052-.576a.525.525 0 00.393-.288l1.847-3.658 1.846 3.658a.525.525 0 00.393.288l4.052.575-2.906 2.77a.564.564 0 00-.163.506l.694 3.957-3.686-1.894a.503.503 0 00-.461 0z' clip-rule='evenodd'/></svg>");
					}
					$("#delivery").val(3);
				}else if(no==3){
					
					for(var i=0; i<4; i++){
						$("#scoreDelivery").append("<svg style='margin-right:3px;' onclick='scoreDeliverySet("+ i +")' id='score"+ i +"' class='bi bi-star-fill' width='30px' height='30px' viewBox='0 0 16 16' fill='currentColor' xmlns='http://www.w3.org/2000/svg'><path d='M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z'/></svg>");	        			
					}
					for(var i=4; i<5; i++){
						$("#scoreDelivery").append("<svg style='margin-right:3px;' onclick='scoreDeliverySet("+ i +")' id='score"+ i +"' class='bi bi-star' width='30px' height='30px' viewBox='0 0 16 16' fill='currentColor' xmlns='http://www.w3.org/2000/svg'><path fill-rule='evenodd' d='M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.523-3.356c.329-.314.158-.888-.283-.95l-4.898-.696L8.465.792a.513.513 0 00-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767l-3.686 1.894.694-3.957a.565.565 0 00-.163-.505L1.71 6.745l4.052-.576a.525.525 0 00.393-.288l1.847-3.658 1.846 3.658a.525.525 0 00.393.288l4.052.575-2.906 2.77a.564.564 0 00-.163.506l.694 3.957-3.686-1.894a.503.503 0 00-.461 0z' clip-rule='evenodd'/></svg>");
					}
					$("#delivery").val(4);
				}else if(no==4){
					
					for(var i=0; i<5; i++){
						$("#scoreDelivery").append("<svg style='margin-right:3px;' onclick='scoreDeliverySet("+ i +")' id='score"+ i +"' class='bi bi-star-fill' width='30px' height='30px' viewBox='0 0 16 16' fill='currentColor' xmlns='http://www.w3.org/2000/svg'><path d='M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z'/></svg>");	        			
					}
					$("#delivery").val(5);
				}
			}
	        
	        
        
	        function reviewInsertModal(s_no, m_no, o_no){
	        	
	        	
	        	
	        	$("#scoreTaste").children("svg").remove();
	        	$("#scoreAmount").children("svg").remove();
	        	$("#scoreDelivery").children("svg").remove();
	        	
	        	$("#s_no").val(s_no);
	        	$("#m_no").val(m_no);
	        	$("#o_no").val(o_no);	        	
	        	
	        	
	        	for(var i=0; i<5; i++){
        			$("#scoreTaste").append("<svg style='margin-right:3px;' onclick='scoreTasteSet("+ i +")' id='score"+ i +"' class='bi bi-star' width='30px' height='30px' viewBox='0 0 16 16' fill='currentColor' xmlns='http://www.w3.org/2000/svg'><path fill-rule='evenodd' d='M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.523-3.356c.329-.314.158-.888-.283-.95l-4.898-.696L8.465.792a.513.513 0 00-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767l-3.686 1.894.694-3.957a.565.565 0 00-.163-.505L1.71 6.745l4.052-.576a.525.525 0 00.393-.288l1.847-3.658 1.846 3.658a.525.525 0 00.393.288l4.052.575-2.906 2.77a.564.564 0 00-.163.506l.694 3.957-3.686-1.894a.503.503 0 00-.461 0z' clip-rule='evenodd'/></svg>");	        			
        		}
	        	
	        	for(var i=0; i<5; i++){
        			$("#scoreAmount").append("<svg style='margin-right:3px;' onclick='scoreAmountSet("+ i +")' id='score"+ i +"' class='bi bi-star' width='30px' height='30px' viewBox='0 0 16 16' fill='currentColor' xmlns='http://www.w3.org/2000/svg'><path fill-rule='evenodd' d='M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.523-3.356c.329-.314.158-.888-.283-.95l-4.898-.696L8.465.792a.513.513 0 00-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767l-3.686 1.894.694-3.957a.565.565 0 00-.163-.505L1.71 6.745l4.052-.576a.525.525 0 00.393-.288l1.847-3.658 1.846 3.658a.525.525 0 00.393.288l4.052.575-2.906 2.77a.564.564 0 00-.163.506l.694 3.957-3.686-1.894a.503.503 0 00-.461 0z' clip-rule='evenodd'/></svg>");	        			
        		}
	        	
	        	for(var i=0; i<5; i++){
					$("#scoreDelivery").append("<svg style='margin-right:3px;' onclick='scoreDeliverySet("+ i +")' id='score"+ i +"' class='bi bi-star' width='30px' height='30px' viewBox='0 0 16 16' fill='currentColor' xmlns='http://www.w3.org/2000/svg'><path fill-rule='evenodd' d='M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.523-3.356c.329-.314.158-.888-.283-.95l-4.898-.696L8.465.792a.513.513 0 00-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767l-3.686 1.894.694-3.957a.565.565 0 00-.163-.505L1.71 6.745l4.052-.576a.525.525 0 00.393-.288l1.847-3.658 1.846 3.658a.525.525 0 00.393.288l4.052.575-2.906 2.77a.564.564 0 00-.163.506l.694 3.957-3.686-1.894a.503.503 0 00-.461 0z' clip-rule='evenodd'/></svg>");	        			
				}
	        	
	        	
	        	
	        	$("#modal2").attr("style", "display:flex");
	            $("body").attr("style","overflow-y:hidden");
	            event.stopPropagation();
	            
	        }
	        
	        
	        $(".order_content").on("click", function(){
	        	$("#modalBox").data("thdata", this);
	        	$('#modalBox').modal('show');
	        });
	        
	        $('#modalBox').on('show.bs.modal', function (e) {
	        		        	
	        	var thdata = $("#modalBox").data("thdata"); 
	        	
	        	/* if(event.target.className==' reviewInsertButton' && event.target.className=='order_content'){
                    return;
	        	} */
	        	
            	
            	$("#menu-tbl").html("<tr><th style='text-align: center;' colspan='2'>메뉴정보</th></tr>");
            	           	
            	var o_no = ($(thdata).find("input"))[0].value;
            	
            	const strong = $(thdata).find("strong");
            	const modalStrong=$("#modalBox").find("strong");
            	let src = $(thdata).find("img").attr("src");
            	
            	
           		
           		$("#modalBox").find("img").attr("src", src);
           		$("#modalBox").find("img").attr("width", "100");
           		$("#modalBox").find("img").attr("height", "100");
            	
				$.ajax({
			
				    url: "${path}/mypage/orderMenu.do",
				    type: "POST",
				    data: {"o_no":o_no},
				    success: function(data){
				    	
				    	if(($($("#o_state_" + o_no)[0]).html().trim())=="주문완료"){
				    		//주문 완료일때 서버에 접속해야 함
				    		
				    		
				    	}
				    		
				    	
						/* console.log(data[0]['1_1']); */
						
						var option = new Array();
						
						var addOption="";
						
						
						for(let i=0; i<data.length; i++){
							option = data[i]['SD_ARRAY'].split(',');
							
							for(let j=0; j<option.length; j++){
								if(j>0)
									addOption += " / ";
								addOption += option[j]; 
							}
							
							$("#menu-tbl").append("<tr><td style='text-align: left;' class='menu_con'><img width='100' height='100' src='${path}/resources/upload/business/" + data[i]['ME_LOGIMG'] + "'></td><td style='text-align: right; vertical-align:middle;' class='menu_con'><h5 style='margin-top:-20px; margin-bottom:-20px;'> " + data[i]['ME_NAME'] + "</h5><br>" + addOption + "</td></tr>");
						}
						
						/* if(data.length>0){
							$("#menu-tbl").append("<tr><th colspan='2' style='text-align:center;'>추가옵션");
							$("#menu-tbl").append("<tr><td colspan='2' style='text-align:right;' class='modalOption' style='text-align: left'>");
						}
						
						for(let i=0; i<data.length; i++){
							option = data[i]['SD_ARRAY'].split(',');
							
							for(let j=0; j<option.length; j++){
								
								$($(".modalOption")[0]).append(option[j] + " / ");
								
							
							}
							
						}
						 */
						
						
						
						let sName = strong[0].innerHTML;
		            	let date = strong[1].innerHTML;
		            	let price = strong[2].innerHTML;
		           		
		           		modalStrong[0].innerHTML = sName;
		           		modalStrong[1].innerHTML = date;
		           		modalStrong[2].innerHTML = price;
		            	
		            	
		                $("#modal").attr("style", "display:flex");
		                $("body").attr("style","overflow-y:hidden");
		                
		                //by 승연
		                var type="client";
		                var orderNo = o_no;
		           		
		                //websocket.send(websocket.send(JSON.stringify(new SocketMessage(type, orderNo, "", "", "", "", "", "A", "")));)
				    },
			
				    error: function (request, status, error){
				    	
				    	alert("리뷰 조회 실패");
				    	
				    }
			
				});
	        	
        	});
	        
	        
	        
	        $('#modalBox').on('shown.bs.modal', function (e) {
		   		
	        	var thdata = $("#modalBox").data("thdata");
	        	
	        	var orderNoDiv = $(thdata).find(".orderNo").val();
	        	var	storeNoDiv = $(thdata).find(".storeNo").val();
	        		       
	        	//orderNo, storeNo 를 가지고 db 조회
	        	//가게 위도 경도, 배달할 주소 가지고 옴        	
	        	$.ajax({
	        		url : "${pageContext.request.contextPath}/orderInfo/selectOrderInfoStore.do",
	        		data : {
	        			"orderNo" : orderNoDiv,
	        			"storeNo" : storeNoDiv
	        		},
	        		success: function(data){
	        			console.log(data);
	        			console.log(data['clientAddress']);
	        			
	        			var clientAddress = data['clientAddress'];
	        			var storeX = data['storeX'];
	        			var storeY = data['storeY'];
	        			var storeName = data['storeName'];
	        			var deliveryX = data['deliveryX'];
	        			var deliveryY = data['deliveryY'];
	        			var deliveryState = data['deliveryState'];
	        			
	        			//delivery x,y도 가져와야한다.
	        			var deliveryXy;
	        			
	        			var mapWrap = $("<div>").attr({
	        				"class" : "map_wrap d-flex flex-column align-items-center",
	        				"id" : "wrap-"+orderNoDiv
	        			});
	        			
	        			var buttonWrap = $("<div>").attr({
	        				"class" : "border border-success rounded mb-3 text-center w-50"
	        			});
	        			
	        			var buttonSpan = $("<span>").attr({
	        				"id":"delivery_position",
	        				"class":"btn delivery-position-btn"
	        			}).html("배달원 위치 보기");
	        			
	        			var mapDiv = $("<div>").attr({
	    					"id":"map-"+orderNoDiv,
	    					"style":"width:100%;height:350px"
	    				}) 
	    				
	    				buttonWrap.append(buttonSpan);
	        			mapWrap.append(buttonWrap).append(mapDiv);
	    				
	    				$(".info-container").append(mapWrap);
	    				
	    				$(".delivery-position-btn").click(function(){
	    	        		var thdata = $("#modalBox").data("thdata");
	    	        		var orderNoDiv = $(thdata).find(".orderNo").val();
	    	        		var storeNameDiv = $(thdata).find(".storeName").val();
	    	        		var storeAddrDiv = $(thdata).find(".storeAddr").val();
	    	        		var clientAddrDiv = $(thdata).find(".clientAddr").val();
	    	        		
	    	        		var orderStateDiv = $.trim($("#o_state_"+orderNoDiv).html());
    	        			
							console.log("주문 상태 출력 해바");
							console.log(orderStateDiv);
	    	        		console.log("버튼 클릭했을 떄");
	    	        		console.log(orderNoDiv);
	    	        		console.log(storeNameDiv);
	    	        		console.log(clientAddrDiv);
	    	        		console.log(orderStateDiv);
	    	        		
	    	        		
	    	        		console.log("버튼 클릭했을 떄");
	    	        		console.log(orderNoDiv);
	    	        		
	    	        		websocket.send(JSON.stringify(new SocketMessage("client", orderNoDiv, storeNameDiv, storeAddrDiv, "", "", clientAddrDiv, "A", orderStateDiv)));
	            		});
	    				
	            		//
	            		
	            		//$(".info-container").children("div").addClass("d-none");
	            		//$(".info-container").children("#map-"+orderNoFromBusiness).removeClass("d-none");
	    				
	    				var mapContainer = document.getElementById("map-"+orderNoDiv), // 지도를 표시할 div 
	    				
	    				mapOption = {
	    				        center: new kakao.maps.LatLng(storeY, storeX), // 지도의 중심좌표
	    				        level:3 // 지도의 확대 레벨
	    				    };  

	    				// 지도를 생성합니다    
	    				var map = new kakao.maps.Map(mapContainer, mapOption); 

	    				// 주소-좌표 변환 객체를 생성합니다
	    				var geocoder = new kakao.maps.services.Geocoder();

	    				var coords;
	    				  
	    				if(deliveryState == 'N'){
	        				deliveryXy=null;
	        			}else{
	        				deliveryXy= new kakao.maps.LatLng(deliveryY, deliveryX);
	        			}
	    				
	    				console.log("확인");
	    				console.log(deliveryXy);
	    				// 주소로 좌표를 검색합니다
	    				geocoder.addressSearch(clientAddress, function(result, status) {

	    				    // 정상적으로 검색이 완료됐으면 
	    				     if (status === kakao.maps.services.Status.OK) {

	    				        coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	    						
	    				         var bounds = new kakao.maps.LatLngBounds();    
	    				         
	    				         var positions = [
	    									{
	    										title: '우리집',
	    										latlng: coords
	    									},
	    									{
	    										title: storeName,
	    										latlng: new kakao.maps.LatLng(storeY, storeX)
	    									},
	    									{
	    										title: '배달원',
	    										latlng: deliveryXy
	    									}
	    								];
	    				         
	    				         for(var i=0; i<positions.length; i++){
	    				        	 
	    				        	 if(positions[i].latlng != null){
	    									var marker = new kakao.maps.Marker({
	    										map: map,
	    										position: positions[i].latlng,
	    										title: positions[i].title,
	    									});
	    									
	    									marker.setMap(map);
	    									markers.push(marker);
	    				       				bounds.extend(positions[i].latlng);
	    				        	 }
	    				        	 
	    				             		

	    				        // 인포윈도우로 장소에 대한 설명을 표시합니다
	    				        
	    				        if(positions[i].latlng != null){
	    				        var infowindow = new kakao.maps.InfoWindow({
	    				            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+positions[i].title+'</div>'
	    				        });
	    				        	infowindow.open(map, marker);
	    				        }   
	    				         }
	    				        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	    				        //map.setCenter(coords);
	    				         map.setBounds(bounds);
	    				    } 
	    				    
	    				    
	    				});
	        			
	        		}
	        	});
	        	
	        	
        		  
					
        	});
        	
	        $('#modalBox').on('hidden.bs.modal', function (e) {
				var thdata = $("#modalBox").data("thdata");
	        	
	        	var orderNoDiv = $(thdata).find(".orderNo").val();
	        	console.log("지워질떄");
	        	console.log(orderNoDiv);
	        	$("#wrap-"+orderNoDiv).remove();
	        });

	        
	        
    
        
             $(".order_content_order_content").on("click",function(e){
            	
            	if(event.target.className!='')
                    return;
            	
            	$("#menu-tbl").html("<tr><th style='text-align: center;' colspan='2'>메뉴정보</th></tr>");
            	
            	console.log(e.target.className);
            	
            	var o_no = ($(this).find("input"))[0].value;
            	
            	const strong = $(this).find("strong");
            	const modalStrong=$("#modal").find("strong");
            	let src = $(this).find("img").attr("src");
            	
            	
           		
           		$("#modal").find("img").attr("src", src);
           		$("#modal").find("img").attr("width", "100");
           		$("#modal").find("img").attr("height", "100");
            	
				$.ajax({
			
				    url: "${path}/mypage/orderMenu.do",
				    type: "POST",
				    data: {"o_no":o_no},
				    success: function(data){
				    	
				    	if(($($("#o_state_" + o_no)[0]).html().trim())=="주문완료"){
				    		//주문 완료일때 서버에 접속해야 함
				    		
				    		
				    	}
				    		
				    	
						/* console.log(data[0]['1_1']); */
						
						var option = new Array();
						
						var addOption="";
						
						
						for(let i=0; i<data.length; i++){
							option = data[i]['SD_ARRAY'].split(',');
							
							for(let j=0; j<option.length; j++){
								if(j>0)
									addOption += " / ";
								addOption += option[j]; 
							}
							
							$("#menu-tbl").append("<tr><td style='text-align: left;' class='menu_con'><img width='100' height='100' src='${path}/resources/upload/business/" + data[i]['ME_LOGIMG'] + "'></td><td style='text-align: right; vertical-align:middle;' class='menu_con'><h5 style='margin-top:-20px; margin-bottom:-20px;'> " + data[i]['ME_NAME'] + "</h5><br>" + addOption + "</td></tr>");
						}
						
						/* if(data.length>0){
							$("#menu-tbl").append("<tr><th colspan='2' style='text-align:center;'>추가옵션");
							$("#menu-tbl").append("<tr><td colspan='2' style='text-align:right;' class='modalOption' style='text-align: left'>");
						}
						
						for(let i=0; i<data.length; i++){
							option = data[i]['SD_ARRAY'].split(',');
							
							for(let j=0; j<option.length; j++){
								
								$($(".modalOption")[0]).append(option[j] + " / ");
								
							
							}
							
						}
						 */
						
						
						
						let sName = strong[0].innerHTML;
		            	let date = strong[1].innerHTML;
		            	let price = strong[2].innerHTML;
		           		
		           		modalStrong[0].innerHTML = sName;
		           		modalStrong[1].innerHTML = date;
		           		modalStrong[2].innerHTML = price;
		            	
		            	
		                $("#modal").attr("style", "display:flex");
		                $("body").attr("style","overflow-y:hidden");
		                
		                //by 승연
		                console.log("모찍히냐");
		                console.log();
				    },
			
				    error: function (request, status, error){
				    	
				    	alert("리뷰 조회 실패");
				    	
				    }
			
				});
            	

                
            });
    
            $("#modal").click(function(){
                $("#modal").attr("style", "display:none");
                $("body").attr("style","overflow-y:scroll");
            });
            
           /*  function reviewInsert(o_no, m_no){
            	
				$.ajax({
					
				    url: "${path}/mypage/insertReview.do",
				    type: "POST",
				    data: {"o_no":o_no, "m_no":m_no},
				    success: function(data){
				    	
				    },
			
				    error: function (request, status, error){
				    	
				    	alert("리뷰 조회 실패");
				    	
				    }
			
				});
            } */
            
            $("#modal2").click(function(){
            	
            	if(event.target.className!="modal_layer")
            		return;
            		
            	
            	
            	 $("#modal2").attr("style", "display:none");
                 $("body").attr("style","overflow-y:scroll");
            })
            
           $(function(){
        	
        		var money = $(".money");
        		
        		for(let i=0; i<money.length; i++){
        			var m = money[i].innerHTML;
        			money[i].innerHTML = parseInt(m).toLocaleString()+'원';
        		}
        	   
           });
            
            
        </script>
    
    
    <!-- by 승연 -->
	
	

<!-- by 승연 -->
    <style>
        #modal {
          position:fixed;
          top: 50px;
          width:100%;
          height:100%;
          z-index:10;
        }
        
        #modal h2 {
          margin:0;   
        }
        
        #modal button {
          display:inline-block;
          width:100px;
          margin-left:calc(100% - 100px - 10px);
        }
        
        #modal .modal_content {
          width:450px;
          height: 50%;
          margin:100px auto;
          padding:20px 10px;
          background:#fff;
          border:2px solid #666;
          overflow-y: scroll;
          overflow-x: hidden;
        }
        
        #modal .modal_layer {
          position:fixed;
          top:0;
          left:0;
          width:100%;
          height:100%;
          background:rgba(0, 0, 0, 0.5);
          z-index:-1;
        }   
        
         #modal2 {
          position:fixed;
          top: 50px;
          width:100%;
          height:100%;
          z-index:10;
        }
        
        #modal2 h2 {
          margin:0;   
        }
        
        #modal2 button {
          display:inline-block;
          width:100px;
          margin-left:calc(100% - 100px - 10px);
        }
        
        #modal2 .modal_content {
          width:450px;
          height: 50%;
          margin:100px auto;
          padding:20px 10px;
          background:#fff;
          border:2px solid #666;
          overflow-y: scroll;
          overflow-x: hidden;
        }
        
        #modal2 .modal_layer {
          position:fixed;
          top:0;
          left:0;
          width:100%;
          height:100%;
          background:rgba(0, 0, 0, 0.5);
          z-index:-1;
        }   
        
         #modal3 {
          position:fixed;
          top: 50px;
          width:100%;
          height:100%;
          z-index:1;
        }
        
        #modal3 h2 {
          margin:0;   
        }
        
        #modal3 button {
          display:inline-block;
          width:100px;
          margin-left:calc(100% - 100px - 10px);
        }
        
        #modal3 .modal_content {
          width:450px;
          height: 50%;
          margin:100px auto;
          padding:20px 10px;
          background:#fff;
          border:2px solid #666;
          overflow-y: scroll;
          overflow-x: hidden;
        }
        
        #modal3 .modal_layer {
          position:fixed;
          top:0;
          left:0;
          width:100%;
          height:100%;
          background:rgba(0, 0, 0, 0.5);
          z-index:-1;
        }   
        </style>

    </section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>