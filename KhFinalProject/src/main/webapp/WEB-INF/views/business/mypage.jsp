<%@page import="com.kh.fp.model.vo.Sales"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	List<List<Sales>> sales = (List)request.getAttribute("sales");
%>
<style>
		*{
		 	  /* border : 1px solid red;    */
		}

div#main {
            border: 1px soild black;
            height: atuo; 
        }
        
        .first-storepage{
        	height: auto;
        	margin-top: 40px;
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
      
      .graph{
      	display: flex;
       	justify-content: center;
       	align-items: center;
       	margin-top: 80px;
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
 				<hr/>
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
 				<h2>매장 매출 그래프</h2><hr/>
	 			<div class="graph">
	 				<c:if test="${not empty sales}">
	 				<div id="columnchart_material" style="width: 1000px; height: 500px;"></div>
	 				</c:if>
	 				<c:if test="${empty sales}">
	 					<h1>준비중</h1>
	 				</c:if>	
	 			</div>
 			</div>
 			
 			
 			<div class="first-storepage">
 			<h2>주문 현황</h2><hr/>
 			</div>
 			
 			
 		</div>
 		
 	</div>
 	</section>
 	
 	
 	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
    <c:if test="${not empty sales}">
      google.charts.load('current', {'packages':['bar']});
      google.charts.setOnLoadCallback(drawChart);
      
	      function drawChart() {
	    	  
	        	var data = google.visualization.arrayToDataTable([
	        		['month-day', 'Sales'],
		      
			      <c:forEach items="${sales}" var="l" varStatus="vs">
			      	<c:if test='${vs.last}'>
				      	['${l.orderDate.date}',${l.price}]
			      	</c:if>
			      	<c:if test='${not vs.last}'>
			      		['${l.orderDate.date}',${l.price}],
			      	</c:if>			      	
			      	  </c:forEach>
		      
		    ]);
			
	        var options = {
	          chart: {
	            title: 'Delivery King Performance',
	            subtitle: 'Sales : 2020 - ${sales[0].orderDate.month}',
	          }
	        };
	  
	

        var chart = new google.charts.Bar(document.getElementById('columnchart_material'));

        chart.draw(data, google.charts.Bar.convertOptions(options));
        
      }
	  	</c:if>
    </script>
 	
 	<%@ include file="../common/footer.jsp" %> 