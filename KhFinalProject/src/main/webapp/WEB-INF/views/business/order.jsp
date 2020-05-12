<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@include file="../common/header.jsp" %>
	<link rel="stylesheet" type="text/css" href="${path }/resources/css/order.css"/> 
    <section style="width:1366px;height:768px;">
 	<div class="container" >
 	
 		<div class="row" >
 		
 		<%@ include file="sideBar.jsp" %>
 		
            <div class="col-lg-10" id="main">
            
                    <ul class="ss nav nav-tabs nav-justified">
                        <li class="nav-item"><a href="${path }/licensee/order" class="list nav-link active">주문 요청</a></li>					
                		<li class="nav-item"><a href="${path }/licensee/orderEnd" class="list nav-link  ">주문 완료(결제 완료)</a></li>
                    </ul>
                    
                    <div class="col-12 s-order-history">
	
                    	<table>
                    	
                    		<tr>
                    			<th>주문일시</th>
                    			<th>메뉴명</th>
                    			<th>주문금액</th>
                    			<th>배달주소</th>
                    			<th>전화번호</th>
								<th>현황</th>
								<th>상세보기</th>
                    		</tr>
                    		
                    		<c:forEach items="${list }" var="o">
	                    		<tr>
	                    			<td><c:out value="${o.O_DATE }"/></td>
	                    			<td><c:out value="${o.O_NO }"/></td>
	                    			<td><c:out value="${o.O_ORIPRICE }"/></td>
	                    			<td><c:out value="${o.O_ADDR}"/></td>
	                    			<td><c:out value="${o.O_DATE }"/></td>
	                    			<c:if test="${o.O_STATUS eq '주문대기' }">
	                    			<td><input type="button" value="승인">&nbsp;<input type="button" value="거절"></td>
	                    			</c:if>
	                    			<td>
	                    			<input type="button" data-toggle="modal" data-target="#myModal" onclick="order_detail(${o.O_NO });" value="상세보기">
	                    			</td>
	                    		</tr>
                    		</c:forEach>
                    	</table>                    	
                    </div>
                    
                    <div>
                    	${pageBar }
                    </div>
                    
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
		        				<td>주문상태</td><td></td>
		        			</tr>
		        			
		        			<tr>
		        				<td>주문일시</td><td></td>
		        			</tr>
		        			
		        			<tr>
		        				<td>주문메뉴</td><td></td>
		        			</tr>
		        			
		        			<tr>
		        				<td>결제금액</td><td></td>
		        			</tr>
		        			
		        			<tr>
		        				<td>배달주소</td><td></td>
		        			</tr>
		        			
		        			<tr>
		        				<td>전화번호</td><td></td>
		        			</tr>
		        			
		        			<tr>
		        				<td>요청사항</td><td></td>
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
   		
   		
   		
   	</section>
   	
   	
   	<script>
   		
   		function order_detail(no){
   			$.ajax({
   				url : "${path}/}/licensee/getdetailorder",
   				data : {no:no},
   				success : function(data){
   					
   				}
   			})
   		}
   	
   	</script>

   	
   	<%@include file="../common/footer.jsp" %>