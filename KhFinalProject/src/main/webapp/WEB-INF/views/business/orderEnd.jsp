<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <style>
      a.list{
      	 font-weight: 700;
      	 color:black;
      }
      div#main{
      	margin-left:200px;
      	border:1px solid black;
      	height:700px;
      }
      table tr th,td{
      	text-align:center;
      }
      table tr td {
      	padding:20 0 0 10;
      }
      

      </style>
     
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <section style="width:1366px;height:968px;">
 	<div class="container" >
 		<div class="row">
 		<%@ include file="sideBar.jsp" %>
            <div class="col-lg-10" id="main">
                    <ul class="ss nav nav-tabs nav-justified">
                        <li class="nav-item"><a href="${path }/licensee/order" class="list nav-link">주문 요청</a></li>					
                		<li class="nav-item"><a href="${path }/licensee/orderEnd" class="list nav-link active">주문 완료(결제 완료)</a></li>
                    </ul>
                    <div class="col-12" style="border:1px solid black;height:650px;">
                    <br><br>
                    	<input style="margin-left:300px;"type="text"><input type="button" value='검색'>
                    <br><br>
                    	<table align=center>
                    		<tr style="font-size:20px;">
                    			<th>주문번호</th>
                    			<th>주문일시</th>
                    			<th>메뉴명</th>
                    			<th>주문금액</th>
                    			<th>결제금액</th>
                    			<th>배달주소</th>
                    			<th>전화번호</th>
                    			<th>요청사항</th>
                    		</tr>
                    		<tr>
                    			<td>123abc123</td>
                    			<td>20-04-12</td>
                    			<td>후라이드 치킨</td>
                    			<td>18,000원</td>
                    			<td>16,000원</td>
                    			<td>서울시 강남구 남도빌딩</td>
                    			<td>010-1234-1234</td>
                    			<td>잘 부탁드립니다.</td>
                    			<td><input type="button" value="상세보기"></td>
                    			<td>
                    				<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#del-modal">
									  배달 요청
									</button>
                    			</td>		
                    		</tr>
                    	</table>                    	
                    </div>
                 </div>   
            </div>
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
   	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0c4555610509aaa6cfd5fae61f00a23f&libraries=services"></script>
  <script>
  $(function(){
	  //type, 위도, 경도, 배달(주문)상태 state, sender
	  function SocketMessage(type, xl, yl, state, sender){
			this.type = type;
			this.xl = xl;
			this.yl = yl;
			this.state = state;
			this.sender = sender;
		}
	  
		//모달창 클릭하고 실행하기전
		$('#del-modal').on('show.bs.modal', function (e) {
			console.log(e.relatedTarget);	// 이거 클릭한 element
			//이걸 이용해서 storeNo, confirm 에 값 대입
			//주소가져오고
			//주소 이용해서 위도경도로 바까줘야함
			var addr = "";
			var xl = "";
			var yl = "";
			
			var geocoder = new kakao.maps.services.Geocoder();

			var callback = function(result, status) {
			    if (status === kakao.maps.services.Status.OK) {
			        xl = (result[0]['x']);
			        yl = (result[0]['y']);
			    }
			};
			
			//geocoder.addressSearch(addr, callback);
			geocoder.addressSearch('해남군 송지면', callback);
			
			//배달요청 버튼 가져오고 여기에 값에 따라 state 나눔
			var state ="W";
			
			const websocket = new WebSocket("ws://localhost:9090${pageContext.request.contextPath}/delivery");
			//서버가 실행되었을때
			websocket.onopen = function(data){
				console.log(data);
				
				websocket.send(JSON.stringify(new SocketMessage("business", xl, yl ,state, "123")));
			}
	  		
	   		//server에서 메시지 보냈을 때
	   		//메시지 수신
	   		websocket.onmessage = function(data){
	   			console.log(data);
	   			
	   			const msg = JSON.parse(data.data);
	   			const count = 0;
	   			
	   			switch(msg.type){
	   			case "business":
	   				break;
	   			
	   			case "delivery":
	   				//카운트 증가 or 수락 여부
	   				if(msg.state=='W'){
	   					count++;
	   					$("#search-delivery").html("배달원 " + count + "명을 찾았습니다.");
	   				}
	   				
	   				if(msg.state=='Y'){
	   					$("#search-delivery").addClass("invisible");
	   					$("accept-delivery").removeClass("invisible");
	   				}
	   				break;
	   			}
	   		}   		
	   	});
		
  });
 
  
   	
   	</script> 