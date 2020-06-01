<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>

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
	      };
	  	
	      function removeData(){
			data.removeRow(0);
			chart.draw(data, opstions)
	      };


	  	$("#orderselect").change(function(){
	  		var no = this.value
	  	
	  		$.ajax({
	  			url : "${path}/store/orderInfoGet.do",
	  			data : {no:no},
	  			success : function(data){
	  				
	  				$('#ordertable').remove();
	  				if(data.length==0){
	  					
	  					
	  					
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
	  	});
	  	
	  	
	  	$("#saleselect").change(function(){
	  		var no = this.value
	  		$.ajax({
	  			url : "${path}/store/saleInfo.do",
	  			data : {no:no},
	  			success : function(data){
	  				
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
	  	});
	  	
	  	
	  	var select = $("select#saleselect");

		  select.change(function() {
		    var select_name = $(this).children("option:selected").text();
		    $(this).siblings("label").text(select_name);
		  });
		  
		  var select2 = $("select#orderselect");

		  select2.change(function() {
		    var select_name = $(this).children("option:selected").text();
		    $(this).siblings("label").text(select_name);
		  });
			  	
    </script>