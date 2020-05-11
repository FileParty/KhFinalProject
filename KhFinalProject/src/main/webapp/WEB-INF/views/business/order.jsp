<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@include file="../common/header.jsp" %>
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
	                    			<td><input type="button" value="상세보기"></td>
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
   	</section>
   	
   	   <style>
   	   
   	  /* *{
   	  	border : 1px solid red;
   	  } 
   	    */
      a.list{
      	 font-weight: 700;
      	 color:black;
      }

      
      #main{
      	margin-left:250px;
      	margin-top:150px;
  		width:1000px;
      	height:600px;
      	padding : 0;
      }
      
      .s-order-history{
      	height:400px;
      	width:1000px;
      	padding : 0;
      	margin-top : 30px;
      }
      
      table{
      	width : 100%;
      	border-top : 3px solid #168;
      }
      
      table th {
      color: #168;
      background: #f0f6f9;
      text-align: center;
      }
      
      table th, table td {
      padding: 10px;
      border: 1px solid #ddd;
      text-align: center;
      font-weight: 550;
      }
      
      input[type="button"]{
      	  border-radius: 20px;
      	  background-color: #f0f6f9;
      	  color: #168;
      	  border-style: hidden;
      }

      </style>
   	
   	<%@include file="../common/footer.jsp" %>