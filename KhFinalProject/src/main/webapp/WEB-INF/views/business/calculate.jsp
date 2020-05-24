<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    <c:set var="path" value="${pageContext.request.contextPath}" />
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
   <style>
      a.list{
      	 font-weight: 700;
      	 color:black;
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
      
	 div#main{
      	margin-left:300px;
      	margin-top:150px;
      	height:auto;
      	width:500px;
      }
      
      *{ 
      	/*  border : 1px solid red;  */
      }
      
      #main>div{
      	margin-bottom: 50px;
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
		
		div#select_box select#saleselect {
		  width: 100%;
		  height: 32px;
		  min-height: 32px;
		  line-height: 32px;
		  padding: 0 10px;
		  opacity: 0;
		  filter: alpha(opacity=0);
		  }
		  
		  

      </style>
	<%@include file="../common/header.jsp" %>
    <section style="width:1366px;height:auto;">
 	<div class="container" >
 		<div class="row">
 		<%@ include file="sideBar.jsp" %>
            <div class="col-lg-10" id="main">
            
	            	<div>
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
		 				<div id="columnchart_material" style="width: 800px; height: 500px;"></div>
		 				</c:if>
		 				<c:if test="${empty sales}">
		 					<h2>준비중입니다.</h2>
		 				</c:if>
		 			</div>
		 			
		 			<div id="salesMonth">
		 			<c:if test="${not empty salesmonth }">
						<div>
		 					<table>
		 						
		 						<tr>
		 							<th>년/월</th><th>매출</th>
		 						</tr>
		 						
		 						<c:forEach items="${salesmonth}" var="s">
		 							<tr>
		 								<td><c:out value="${s.O_DATE}"/></td>
		 								<td><fmt:formatNumber maxFractionDigits="3" type="number"  value="${s.PRICE}"/></td>
		 							</tr>
		 						</c:forEach>
		 						
		 					</table>
		 				</div>	
		 			</c:if>
		 			</div>
		 			
                 </div>   
            </div>
   		</div>
   	</section>
   	
   	<script>
   		
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





		  	
	
	
	
	
	$("#saleselect").change(function(){
		var no = this.value
		$.ajax({
			url : "${path}/store/saleInfo.do",
			data : {no:no},
			success : function(data){
				
				console.log(data);
				
				$(".graph>div").remove();
				if(data.length==0){
					$("#salesMonth>div").remove();
					var h2 = $("<div>").html("<h2 style='margin-bottom:100px;'>준비중입니다!</h2>");
					$(".graph").append(h2);
					
				}else{
					var div = $("<div>").html("<div id='columnchart_material' style='width: 1000px; height: 500px;'></div>");
					$(".graph").append(div);
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

					      $.ajax({
								url : "${path}/store/salesMonth.do",
								data : {no:no},
								success : function(data){
					
									$("#salesMonth>div").remove();
									
									if(data.length>0){
										$("#salesMonth>div").remove();
										var div=$("<div>");
										var table = $("<table>");
										var tr = $("<tr>").html("<th>년/월</th><th>매출</th>");
										table.append(tr);
										
										for(var i=0; i<data.length;i++){
											var td="<tr>";
											td +="<td>"+data[i].O_DATE+"</td>";
											td +="<td>"+AmountCommas(data[i].PRICE)+"</td>";
											td +="</tr>";
											table.append(td);
											
										}
										div.append(table);
										$("#salesMonth").append(div);
									}
									
									
								}
						
					      });
				}
				
			}
		})
	});
	
	var select = $("select#saleselect");

	  select.change(function() {
	    var select_name = $(this).children("option:selected").text();
	    $(this).siblings("label").text(select_name);
	  });
	  
	  function AmountCommas(val){
		    return val.toString().replace(/\B(?=(\d{3})+(?!\d))/g,",");
		}
	
	
   	
   	</script>
   	
   	<%@include file="../common/footer.jsp" %>