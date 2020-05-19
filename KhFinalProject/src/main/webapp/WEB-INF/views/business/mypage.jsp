<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
		*{
		 	border : 1px solid red; 
		}

div#main {
            border: 1px soild black;
            height: atuo; 
        }
        
        .first-storepage{
        	height: 300px;
        	margin-top: 20px;
        	text-align: center;
        }
        
        .s-order-history{
      	height:auto;
      	width:1000px;
      	padding : 0;
      	margin-top : 30px;
      	margin-bottom : 15px;
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
      
</style>
	<%@ include file="../common/header.jsp" %> 
 	<section style="width:auto;height:auto;">
 		<div class="row" style="margin-left: 300px;">
 			<%@ include file="sideBar.jsp" %>
 		</div>
 	<div class="container" id="main" >
 		
 		<div>
 			<div class="first-storepage" >
 			<h2>나의 매장</h2>
 				
 				<table>
                    	
                    		<tr>
                    			<th>상호명</th>
                    			<th>주소</th>
                    			<th>평점</th>
                    			<th>리뷰수</th>
								<th>등록일</th>
								<th>승인상태</th>
                    		</tr>
                    		<c:forEach items="${stores }" var="s"> 
                    		<tr>
                    			<td>${s.S_NAME }</td>
                    			<td>${s.S_ADDR }</td>
                    			<td>${s.SCORE }</td>
                    			<td>${s.S_REVIEWCOUNT }</td>
                    			<td>${s.S_ENROLLDATE }</td>
                    			<td>${s.S_ENROLLSTATUS }</td>
                    		</tr>
                    		</c:forEach>
                </table>
 			
 			
 			
 			</div>
 			<div class="first-storepage">
 			<h2>매장 매출 그래프</h2>
 			</div>
 			<div class="first-storepage">
 			<h2>주문 현황</h2>
 			</div>
 		</div>
 		
 	</div>
 	</section>
 	<%@ include file="../common/footer.jsp" %> 