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



출처: https://gocoder.tistory.com/798 [고코더 IT Express]
  </style>
	<section class="w-100 h-100 row align-items-center">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-sm-12">
					<nav class="navbar navbar-expand-lg navbar-light bg-light justify-content-between">
					  <div class="align-items-center">
					  	  <img src="${pageContext.request.contextPath}/resources/img/delivery.png" />
						  <span class="navbar-brand">${loginMember.m_Name } 배달원</span>
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
			
			
		  <div class="jumbotron pb-4 bg-primary ml-0 pl-0 pt-2">
		    <div class="index-search-container ml-5">
				<div class="mb-4">
					<span class="h3 text-white">
			    			현재 위치
			    	</span>
				</div>			
					
				<div class="index-search d-flex justify-content-center align-items-center">
					
					<div class="search-btn mr-3"><button class="location-button" onclick="getbrowserxy();"><i style='font-size:30px' class='fas'>&#xf14e;</i></button></div>
					
				
					<div>
						<form name="form" id="form" method="post"  onsubmit="return false">
							<input type="hidden" name="currentPage" value="1"/> 
							<input type="hidden" name="countPerPage" value="5"/>
							<input type="hidden" name="resultType" value="json"/> 
							<input type="hidden" name="confmKey" value="devU01TX0FVVEgyMDIwMDUxMjIwMDA0MTEwOTc1MjQ="/>
							<div class="keyword-box">
								<input type="text" name="keyword" id="keyword" value="" onkeydown="enterSearch();" autocomplete="off" size="40px"/>
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
		    
		    <div class="d-flex ml-5 mr-5">
		    
		    	<div class="list-group d-flex flex-row">
				  	<div class="mr-5">
			    		<span class="h3 text-white">
			    			전화번호 :
			    		</span>
			    	</div>
		    	
			    	<div>
			    		<span class="h3 text-white">
			    			${loginMember.m_Phone }
			    		</span>
			    	</div>
				</div>
				
		    	
		    </div>
		    
		    <div class="mt-4 row">
		  	 <div class="form-group ml-5 col-10">
			    <label for="del-textarea" class="h3 text-white mb-3">배달 요청 사항</label>
			    <textarea class="form-control mb-0 pb-0" id="del-textarea" rows="3"></textarea>
			  </div>
		  	</div>
		  </div>
		  <button id="bt-deliverProxy" class="btn btn-primary btn-lg btn-block" type="button">배달 검색</button>
		  <button id="bt-delivery"type="button" style="display:none;" data-toggle="modal" data-target="#del-modal"></button>
		  
  
		</div>
		
		<!-- Modal -->
		<div class="modal fade" id="del-modal" tabindex="-1" role="dialog" aria-labelledby="del-modal" aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		        	<div id="search-delivery">
		        	
		        	</div>
		        	
		        	<div id="accept-delivery" class="invisible">
		        	
		        	</div>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
		      </div>
		    </div>
		  </div>
		</div>
	</section>
	
	<script>
	
	$(function(){
		function SocketMessage(type, xl, yl, state, sender, msg){
			this.type = type;
			this.xl = xl;
			this.yl = yl;
			this.state = state;
			this.sender = sender;
			this.msg = msg;
		}

		$("#bt-deliverProxy").click(function(){
			if($("#keyword").val() ==''){
				alert("현재위치를 검색해주세요!!")
			}else{
				$("#bt-delivery").click();
			}
		});
		
		/* $("#del-modal").on('show.bs.modal', function(e){
			console.log("텍스트아리아");
			console.log($("#del-textarea").val());
			
			var msg = $("#del-textarea").val();
			const websocket = new WebSocket("ws://localhost:9090${pageContext.request.contextPath}/delivery");
			//서버가 실행되었을때
			websocket.onopen = function(data){
				console.log("data");
				console.log(data);
				
				console.log("xl");
				console.log(xl);
				console.log("yl");
				console.log(yl);
				
				websocket.send(JSON.stringify(new SocketMessage("delivery", xl, yl ,'W', ${loginMember.m_Id}, msg)));
			}
			
			var xl = $("#xl").val();
			var yl = $("#yl").val();
		}); */
		$("#del-modal").on('show.bs.modal', function(e){
			var xl = $("#xl").val();
			var yl = $("#yl").val();
			var msg = $("#del-textarea").val();
			
			const websocket = new WebSocket("ws://localhost:9090${pageContext.request.contextPath}/delivery");
			//서버가 실행되었을때
			websocket.onopen = function(data){
				console.log(data);
				
				websocket.send(JSON.stringify(new SocketMessage("business", xl, yl ,'W', "123", msg)));
			}
		});
		
		
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
