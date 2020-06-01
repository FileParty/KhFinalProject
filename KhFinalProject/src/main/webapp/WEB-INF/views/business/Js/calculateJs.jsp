<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
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
				
				
				
				$(".graph>div").remove();
				if(data.length==0){
					$("#salesMonth>div").remove();
					var h2 = $("<div>").html("<img id='ready' src='${path}/resources/img/index/ready.jpg'>");
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