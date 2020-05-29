<%@page import="com.kh.fp.model.vo.Sales"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<style>
		*{
		 	  /*  border : 1px solid red;   */  
		}

	div#main {
            
	      	margin-top:130px;
	  		width:1000px;
	      	height : auto;
	      	padding : 0;
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
      	flex-direction : column;
       	justify-content: center;
       	align-items: center;
		width: 900px; height: 500px;
      }
      
      #ordertable{
      	width: 900px; height: 500px;
      }
      
      .orderselect{
      	text-align:  center;
      }
      
      div#select_box {
		  position: relative;
		  width: 200px;
		  height: 32px;
		  background: url(http://cfile1.uf.tistory.com/image/27423E43565F8EF627B215) 0 center no-repeat;
		  /* 화살표 이미지 */
		}
		
		div#select_box label {
		  position: absolute;
		  font-size: 14px;
		  color: #fff;
		  top: 7px;
		  left: 12px;
		  letter-spacing: 1px;
		}
		
		div#select_box select#saleselect ,div#select_box select#orderselect{
		  width: 100%;
		  height: 32px;
		  min-height: 32px;
		  line-height: 32px;
		  padding: 0 10px;
		  opacity: 0;
		  filter: alpha(opacity=0);
		  /* IE 8 */
		}
      	
      	
</style>
	<%@ include file="../common/header.jsp" %> 
 	<section style="width:auto;height:auto;">
 	<div class="container">
 		<div class="row" >
 			<%@ include file="sideBar.jsp" %>
 		
 	<div class="col-lg-10" id="main" >
 		
 		<div>
 			<div class="first-storepage" >
 			<h2>나의 매장</h2>
 				<hr/>
 				<c:if test="${empty stores }">
 				<div style="margin-bottom: 300px;">
 					<h1>현재 등록된 매장이 없습니다.</h1>
 				</div>
 				</c:if>
 				<c:if test="${not empty stores }">
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
                    			<td><fmt:formatDate value="${s.S_ENROLLDATE }" pattern="yyyy년 MM월 dd일"/></td>
                    			<td>${s.S_ENROLLSTATUS }</td>
                    		</tr>
                    		</c:forEach>
                </table>
 			
 				
 				</c:if>
 			</div>
 			<c:if test="${not empty stores }">
 			<div class="first-storepage">
 				<h2>매장 매출 그래프</h2><hr/>
 				<div style="margin-bottom: 40px;">
 					<div id="select_box">
 						<label for="saleselect">${stores[0].S_NAME }</label>
		 				<select  id="saleselect">
		 					<c:forEach items="${stores }" var="s">
		 						<option value="${s.S_NO }">${s.S_NAME }</option>
		 					</c:forEach>
		 				</select>
	 				</div>
	 				</div>
	 			<div class="graph">
	 				<c:if test="${not empty sales}">
	 				<div id="columnchart_material" style="width: 900px; height: 500px;"></div>
	 				</c:if>
	 				<c:if test="${empty sales}">
	 					<img src='${path}/resources/img/index/ready.jpg' width="900px" height="500px">
	 				</c:if>	
	 			</div>
 			</div>
 			
 			
 			<div class="first-storepage">
 			<h2>주문 현황</h2><hr/>
 					<div style="margin-bottom: 40px;">
 						<div id="select_box">
 						<label for="orderselect">${stores[0].S_NAME }</label>
		 				<select id="orderselect">
		 					<c:forEach items="${stores }" var="s">
		 						<option value="${s.S_NO }">${s.S_NAME }</option>
		 					</c:forEach>
		 				</select>
		 				</div>
	 				</div>
	 				<c:if test="${not empty orderinfo }">
		 				<table id="ordertable">
		                    	
		                    		<tr>
		                    			<th>주문자</th>
		                    			<th>주문자연락처</th>
		                    			<th>주소</th>
		                    			<th>가격</th>
										<th>주문시간</th>
										<th>상태</th>
		                    		</tr>
		                    		
		                    	
		                    	<c:forEach items="${orderinfo }" var="o">
		                    	
		                    		<tr>
		                    			<td><c:out value="${o.O_NAME }"/></td>
		                    			<td><c:out value="${o.O_PHONE }"/></td>
		                    			<td><c:out value="${o.O_ADDR }"/></td>
		                    			<td><c:out value="${o.O_ORIPRICE }"/></td>
		                    			<td><fmt:formatDate value="${o.O_DATE }" pattern="yy/MM/dd HH:mm:ss"/></td>
		                    			<td><c:out value="${o.O_STATUS }"/></td>
		                    		</tr>
		                    	</c:forEach>
		                    	
		                </table>
                	</c:if>
                   	<c:if test="${empty orderinfo }">
                   		<img id='ordertable' src='${path}/resources/img/index/ready.jpg'>
                   	</c:if>
 			
 			
 				</div>
 			
 			</c:if>
 			</div>
 			</div>
 		</div>
 	</div>
 	</section>
 	
 	
 	
    <script type="text/javascript">
    
		  var data;
		  var chart;
	      var options;
	      google.charts.load('current', {'packages':['bar']});
	      google.charts.setOnLoadCallback(drawChart);
	      
    	<c:if test="${not empty sales}">
		      
		      
			      function drawChart() {
			    	  
			        	
				    data = new google.visualization.DataTable();
					  data.addColumn('string', 'month-day');
					  data.addColumn('number', 'Sales');
					  <c:forEach items="${sales}" var="l" varStatus="vs">
					  data.addRow([(<fmt:formatNumber value='${l.orderDate.month}'/>+1)+"/${l.orderDate.date}", ${l.price}]);
					  </c:forEach>
					  
			        var options = {
			          chart: {
			            title: 'Delivery King Performance',
			            subtitle: 'Recent 31 Day Sales',
			          }
			        };
			  
			
		
		        var chart = new google.charts.Bar(document.getElementById('columnchart_material'));
		
		        chart.draw(data, google.charts.Bar.convertOptions(options));
		        
		      }
			      
			     
	  	</c:if>
	  	
	  	function addData(time,price){
			data.addRow([time, price]);
			chart.draw(data, options)
	      }
	  	
	      function removeData(){
			data.removeRow(0);
			chart.draw(data, opstions)
	      }





			  	
	  	
	  	$("#orderselect").change(function(){
	  		var no = this.value
	  		$.ajax({
	  			url : "${path}/store/orderInfoGet.do",
	  			data : {no:no},
	  			success : function(data){
	  				console.log(data[0]);
	  				$('#ordertable').remove();
	  				if(data.length==0){
	  					console.log($("#ordertable").parent());
	  					
	  					
	  					var img = $("<img id='ordertable' src='${path}/resources/img/index/ready.jpg'> ");
	  					$("#orderselect").parent().parent().append(img);
	  					
	  				}else{
	  					var table = $("<table id='ordertable'>");
	  					var tr=$("<tr>");
	  					
	  					table.append(tr.html("<th>주문자</th><th>주문자연락처</th><th>주소</th><th>가격</th><th>주문시간</th><th>상태</th>"));
	  					var tr2=$("<tr>");
	  					
	  					for(var i=0;i<data.length;i++){
	  						
	  						var td="<tr>";
	  						td += "<td>"+data[i].O_NAME+"</td>";
	  						td += "<td>"+data[i].O_PHONE+"</td>";
	  						td += "<td>"+data[i].O_ADDR+"</td>";
	  						td += "<td>"+data[i].O_ORIPRICE+"</td>";
	  						td += "<td>"+data[i].O_DATE+"</td>";
	  						td += "<td>"+data[i].O_STATUS+"</td>";
	  						td +="</tr>";
							
	  						table.append(td);	
	  					}
	  					
	  					
	  					$($(".first-storepage")[2]).append(table);
	  				}
	  			}
	  		})
	  	})
	  	
	  	
	  	$("#saleselect").change(function(){
	  		var no = this.value
	  		$.ajax({
	  			url : "${path}/store/saleInfo.do",
	  			data : {no:no},
	  			success : function(data){
	  				
	  				console.log(data);
	  				
	  				$(".graph").remove();
	  				if(data.length==0){
	  				
	  					var img = $("<img class='graph' src='${path}/resources/img/index/ready.jpg'> ");
	  					$($(".first-storepage")[1]).append(img);
	  					
	  				}else{
	  					var div = $("<div class='graph'>").html("<div id='columnchart_material' style='width: 900px; height: 500px;'></div>");
	  					$($(".first-storepage")[1]).append(div);
	  					 		var count=data.length;
	  					 		var time = new Array();
	  					 		var sales = new Array();
	  					 		for(var i=0;i<count;i++){ 
	  								 sales[i]=data[i].price;
	  							 }
	  					 		for(var i=0;i<count;i++){ 
	  					 			time[i]=data[i].time;
	  							 }
	  					 		
	  					 		
	  							 data = new google.visualization.DataTable();
	  							 data.addColumn('string', 'month-day');
	  							  data.addColumn('number', 'Sales');
	  							  
	  							 for(var i=0;i<count;i++){ 
	  								data.addRow([time[i],sales[i]]);
	  							 }
	  							 
	  							var options = {
	  						          chart: {
	  						            title: 'Delivery King Performance',
	  						            subtitle: 'Recent 31 Day Sales',
	  						          }
	  						        };
	  						  
	  						
	  					
	  					        var chart = new google.charts.Bar(document.getElementById('columnchart_material'));
	  					
	  					      chart.draw(data, google.charts.Bar.convertOptions(options));
 
	  				
	  						
	  						  
	  				}
	  				
	  			}
	  		})
	  	})
	  	
	  	
	  	var select = $("select#saleselect");

		  select.change(function() {
		    var select_name = $(this).children("option:selected").text();
		    $(this).siblings("label").text(select_name);
		  })
		  
		  var select2 = $("select#orderselect");

		  select2.change(function() {
		    var select_name = $(this).children("option:selected").text();
		    $(this).siblings("label").text(select_name);
		  })
			  	
    </script>
 	
 	<%@ include file="../common/footer.jsp" %> 