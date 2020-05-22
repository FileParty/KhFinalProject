<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <style>
      a.list{
      	 font-weight: 700;
      	 color:black;
      }
 div#main{
      	margin-left:200px;
      	margin-top:150px;
      	border:1px solid black;
      	
      }
      div.review {
      	border:1px solid black;
      	width:600px;
      	height:300px;
      	margin-left:20px;
      	
      }
      div.row1 {
      	margin-left:30px;
      	margin-top:50px;
      }
  

 
      </style>
	<%@ include file="../common/header.jsp" %>
    <section style="width:1366px;margin-bottom:400px;">
 	<div class="container" >
 		<div class="row">
 		<%@ include file="sideBar.jsp" %>
            <div class="col-lg-10" id="main">
                    <ul class="ss nav nav-tabs nav-justified">
                        <li class="nav-item"><a href="#" class="list nav-link active">일반 리뷰</a></li>					
                    </ul>
                    		<select id="storeInfo" name="storeNo" class="form-control" style="margin-left:400px;width:auto;display:block;">
                    		<c:forEach items="${store}" var="s">
                    			<option for="storeInfo" value="${s.s_No }"><c:out value="${s.s_Name }" /></option>
                    		</c:forEach> 
                    		</select>
                    	
                    	<div id="reviewList">
                    	
                    	</div>
                    
                 </div>
                 
            </div>
   		</div>
   		<script>
   		
   			 $(function() {
   				$.ajax({
   					url:"${path}/licensee/reviewSelect",
   					data:{s_no:$("#storeInfo").val()},
   					
   					success:function(data) {
   						console.log('??',data);
						var d = new Date();
						var d1 = new Date(data[0].r_date);
						var dd = d-d1;
						var day = 24 * 60 * 60 * 1000;
						
						console.log(parseInt(dd/day));
						
						
						
						
   						if(data.length == 0) {
   							alert('등록 된 리뷰가 없습니다!');
   						}
   						let star = $("<span>").html('★');
   						let star1 = $("<span>").html('☆');
   						for(let i=0;i<data.length;i++) {
   							let div = $("<div>");
   							let date = new Date(data[i].r_date);
   							let date1 = d-date;   							
   							let date2 = parseInt(date1/day);
   							let dateSpan = $("<span>");
   							if(date2 == 0) {
   								dateSpan.html('오늘');
   							}else if(date2 == 1) {
   								dateSpan.html('어제');
   							}else {
   							dateSpan.html(parseInt(date2/day)+'일전');
   							}
   							let span = $("<span>").html(data[i].m_email);
   							if(data[i].r_img !=null) {
   							var img = $("<img>").attr({
   								'src':'${path}/resources/upload/review/'+data[i].r_img,
   							}).css('width','100%');
   							}else {
   								var spanss = $("<span>").html('없어요;;');
   							}
   							let me_name = $("<span>").html(data[i].me_name);
   							let span1 = $("<span>").html(data[i].sd_array);
   							let span2 = $("<span>").html(data[i].r_text);
   							div.append(span).append(dateSpan).append(img).append(spanss).append(me_name).append(span1).append(span2);
   							$("#reviewList").append(div);
   						}
   					}
   				})
   			}) 
   		</script>
   	</section>
   	
   	<%@ include file="../common/footer.jsp" %>