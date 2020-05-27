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
								</c:forEach>
							</select>
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
			                    			주문완료
			                    			<input type="hidden" value="${o.O_REQUEST }">
			                    			<input type="button" value="배달출발">
			                    			</td>
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
   		
   		
   		
   	</section>
   	
   	
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