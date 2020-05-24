<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <style>
    	*{
    		/* border : 1px solid red; */
    	}
    </style>
	<%@include file="../common/header.jsp" %>
	<link rel="stylesheet" type="text/css" href="${path }/resources/css/order.css"/> 
    <section style="width:auto;height:auto;">
 	<div class="container" >
 	
 		<div class="row" >
 		
 		<%@ include file="sideBar.jsp" %>
 		
            <div class="col-lg-10" id="main">
            
                    <h1>주문 내역</h1>
                    
                    <div class="col-12 s-order-history">
						<div style="margin-bottom: 50px;">
							<select id="storeNo">
								<c:forEach items="${sno }" var="n"> 
									<option value="${n.s_No }" ${n.s_No eq check ? "selected" : " " }>${n.s_Name }</option> 
								</c:forEach>
							</select>
						</div>
						<c:if test="${empty list }">
                    		<h1>주문내역을 준비중입니다.</h1>
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
	                    			<td><fmt:formatDate value="${o.O_DATE }" pattern="yy/MM/dd HH:mm:SS"/></td>
	                    			<td><c:out value="${o.O_ORIPRICE }"/></td>
	                    			<td><c:out value="${o.O_ADDR}"/></td>
	                    			<td><c:out value="${o.O_PHONE }"/></td>
	                    			<c:choose>
	                    				<c:when test="${o.O_STATUS eq '주문대기' }">
			                    			<td><input type="button" value="승인">&nbsp;<input type="button" value="거절"></td>
			                    		</c:when>
			                    		<c:when test="${o.O_STATUS eq '주문취소' }">
			                    			<td>주문취소</td>
			                    		</c:when>
			                    		<c:when test="${o.O_STATUS eq '주문완료' }">
			                    			<td><input type="button" value="배달출발"></td>
			                    		</c:when>
			                    		<c:when test="${o.O_STATUS eq '배달중' }">
			                    			<td>배달중</td>
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
   		
   		
   		function order_detail(data){
   			$.ajax({
   				url : "${path}/store/orderdetail.do",
   				data : {no:data},
   				success : function(data){
   					console.log(data);
   				}
   			})
   		}

   		$("#storeNo").change(function(){
   			var no=this.value;
   			location.replace('${path}/licensee/order?no='+no);
   		})

   	
   	</script>

   	
   	<%@include file="../common/footer.jsp" %>