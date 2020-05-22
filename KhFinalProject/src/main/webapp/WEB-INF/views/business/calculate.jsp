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
 div#main{
      	margin-left:300px;
      	margin-top:150px;
      	height:600px;
      	width:500px;
      }
      
      *{ 
      	/* border : 1px solid red; */
      }
      
      #main>div{
      	margin-bottom: 50px;
      	text-align:  center;
      }

      </style>
	<%@include file="../common/header.jsp" %>
    <section style="width:1366px;height:768px;">
 	<div class="container" >
 		<div class="row">
 		<%@ include file="sideBar.jsp" %>
            <div class="col-lg-10" id="main">
            
	            	<div>
	                    <select  id="saleselect">
			 					<c:forEach items="${stores }" var="s">
			 						<option value="${s.S_NO }">${s.S_NAME }</option>
			 					</c:forEach>
			 			</select>
		 			</div>
		 			
		 			<div class="graph">
		 				<div id="columnchart_material" style="width: 800px; height: 500px;"></div>
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
				  data.addRow(["${l.orderDate.date}", ${l.price}]);
				  </c:forEach>
				  
		        var options = {
		          chart: {
		            title: 'Delivery King Performance',
		            subtitle: 'Sales : '+'<fmt:formatDate value="${sales[0].orderDate}" pattern="yyyy-MM"/>',
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
					console.log("??");
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
						            subtitle: 'Sales : '+'<fmt:formatDate value="${sales[0].orderDate}" pattern="yyyy-MM"/>',
						          }
						        };
						  
						
					
					        var chart = new google.charts.Bar(document.getElementById('columnchart_material'));
					
					      chart.draw(data, google.charts.Bar.convertOptions(options));

				
						
						  
				}
				
			}
		})
	})
   	
   	</script>
   	
   	<%@include file="../common/footer.jsp" %>