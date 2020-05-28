<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
   <style>
   div{
		font-family: 'Do Hyeon';
	}
	span{
		font-family: 'Do Hyeon';
	}
	span.font{
		font-size:40px;
		
	}
	span.font1{
		font-size:20px;
		color:red;
	}
      a.list{
      	 font-weight: 700;
      	 color:black;
      }
 	div#main{
      	margin-top:130px;

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
      .reviewReply{
      	box-shadow:inset 0px 1px 31px -2px #ffffff;
	background:linear-gradient(to bottom, #ededed 5%, #dfdfdf 100%);
	background-color:#ededed;
	border-radius:30px;
	border:1px solid #dcdcdc;
	display:inline-block;
	cursor:pointer;
	color:#777777;
	font-family:Arial;
	font-size:15px;
	font-weight:bold;
	padding:5px 10px;
	text-decoration:none;
	text-shadow:0px 0px 0px #ffffff;
      }
      #enroll{
    box-shadow:inset 0px 1px 31px -2px black;
	/* background:linear-gradient(to bottom, black 5%, black 100%); */
	background-color:black;
	border-radius:30px;
	border:1px solid #dcdcdc;
	display:inline-block;
	cursor:pointer;
	color:white;
	font-family:Arial;
	font-size:15px;
	font-weight:bold;
	padding:5px 10px;
	text-decoration:none;
	
      }
      #cancle{
    box-shadow:inset 0px 1px 31px -2px red;
	background:linear-gradient(to bottom, red 5%, red	 100%);
	background-color:red;
	border-radius:30px;
	border:1px solid #dcdcdc;
	display:inline-block;
	cursor:pointer;
	color:white;
	font-family:Arial;
	font-size:15px;
	font-weight:bold;
	padding:5px 10px;
	text-decoration:none;
	text-shadow:0px 0px 0px #ffffff;
      }
  

 
      </style>
	<%@ include file="../common/header.jsp" %>
    <section style="width:auto;margin-bottom:400px;">
 	<div class="container" >
 		<div class="row">
 		<%@ include file="sideBar.jsp" %>
            <div class="col-lg-10" id="main">
                    <ul class="ss nav nav-tabs nav-justified">
                     <li class="nav-item">
                        <span class="font">* 리뷰 보기</span>	<br>
                        <span class="font1">* 리뷰1개당 댓글은 한번만 가능합니다. </span>	
                      </li>				
                    </ul>
                    <br>
                    <br>
                    		<select id="storeInfo" name="storeNo" class="form-control" style="margin-left:370px;width:auto;display:block;">
                    		<c:forEach items="${store}" var="s">
                    			<option for="storeInfo" value="${s.s_No }"><c:out value="${s.s_Name }" /></option>
                    		</c:forEach> 
                    		</select>
                    	<br>
                    	<br>
                    	<div id="reviewList">
                    	
                    	</div>
                 </div>
                 
            </div>
   		</div>
   		<script>
   		
   			 $(function() {
   				$("#reviewList").children().remove();
   				$.ajax({
   					url:"${path}/licensee/reviewSelect",
   					data:{s_no:$("#storeInfo").val()},
   					
   					success:function(data) {
   						console.log('ㅎㅎ',data);
   						console.log(data[0].r_img);
   						
   					 	var d = new Date();
						var d1 = new Date(data[0].r_date);
						var dd = d-d1;
						var day = 24 * 60 * 60 * 1000;
							
   						if(data.length == 0) {
   							alert('등록 된 리뷰가 없습니다!');
   						}
   						for(let i=0;i<data.length;i++) {
   							console.log(data[i].r_img);
   							let div = $("<div>").attr('class','row');
   							let tbl = $("<table>").attr('class','tbl');
   							let tr = "<tr><td>";
   							let date = new Date(data[i].r_date);
   							let date1 = d-date;   							
   							let date2 = parseInt(date1/day);  							
   							tr+= "<span>*"+(data[i].m_nickname)+"*님 </span>&nbsp;&nbsp;&nbsp;";
   							if(date2 == 0) {
   								tr+="<span>"+'오늘'+"</span>";
   							}else if(date2 == 1) {
   								tr+="<span>"+'어제'+"</span>";
   							}else {
   							
   							tr+="<span>"+parseInt(date2/day)+'일전'+"</span></td><tr>";
   							
   							}
   							let tr1 = "<tr><td>";
   							
   							for(let j=0;j<5;j++) {
   								if(data[i].r_score <= j){
   									tr1+="<span style='color:red'>"+'☆'+"</span>";
   								}else{
   									tr1+="<span style='color:red'>"+'★'+"</span>";
   								}
   							}
   							tr1+="&nbsp;<span>"+'맛★&nbsp;'+data[i].r_score_taste+"</span>";
   							tr1+="&nbsp;<span>"+'양★&nbsp;'+data[i].r_score_amout+"</span>";
   							tr1+="&nbsp;<span>"+'배달★&nbsp;'+data[i].r_score_delivery+"</span>";
   							
   					 		let tr2 = "<tr><td>";   							
  							  	tr2+= "<input type='hidden' value='"+data[i].r_no+"' class='gdgd' />";
  							  	tr2+= "<div id='demo"+i+"' class='demo carousel slide' data-interval='true' data-ride='carousel'><div style='width:450px' class='carousel-inner'>";	
  							 
  							 for(let k=0;k<data[i].r_img.length;k++) {
   						 	if(data[i].r_img !=null) {  
   						 		if(k==0) {   								
   								tr2+= "<div style='width:450px' class='carousel-item active'><img src='${path}/resources/img/mypage/review/"+data[i].r_img[k]+"' width='450px' height='200px'/></div>";
   						 		}else {
   						 		tr2+= "<div style='width:450px' class='carousel-item'><img src='${path}/resources/img/mypage/review/"+data[i].r_img[k]+"' width='450px' height='200px'/></div> ";
   						 			
   						 		}
   								
   							}else {
   								tr2+="<img alt='첨부 된 사진이없어요!'width='450px' height='200px'/>";
   								
   							}
   						 	
  							 }
  							 tr2+=" <a class='carousel-control-prev' href='#demo"+i+"' data-slide='prev'><span class='carousel-control-prev-icon'></span> </a>";
  							 tr2+="<a class='carousel-control-next' href='#demo"+i+"' data-slide='next'><span class='carousel-control-next-icon'></span> </a>";    	   						 
  								tr2+="</div></div> ";
   							let tr3 = "<tr><td>"; 
   							for(let k=0;k<data[i].order_menu.length;k++) {
   							tr3 += "<span>"+data[i].order_menu[k].me_name+'/'+data[i].order_menu[k].sd_array+"</span></tr></td>";
   							}
   							let tr4 = "<tr><td>"; 
   							tr4+="<span>"+data[i].r_text+"</span>";
   							let tr5 = "<tr><td>";
   							if(data[i].r_reply == null) {
   							tr5+="<input style='margin-left:400px' class='reviewReply' type='button' value='답글' onclick='reviewReply();'/></td></tr>";
   							}else {
   								tr5+="<span style='font-weight:700'>사장님 댓글  -></span> <span>"+data[i].r_reply+"</span></td></tr>";
   							}
   							let tr6 = $("<input>").attr({
   								'type':'hidden',
   								'class':'r_no'+i,
   								'value':data[i].r_no
   							});
   							tbl.append(tr).append(tr1).append(tr2).append(tr3).append(tr4).append(tr5).append(tr6).after($("<br>"));
   							if(i%2==0) {
   							var divv = $("<div>").attr('class','row');
   							}
   							
   							divv.append(tbl);
   							let me_name = $("<span>").html(data[i].me_name);
   							let span1 = $("<span>").html(data[i].sd_array);
   							let span2 = $("<span>").html(data[i].r_text);
   							
   							$("#reviewList").append(divv);
   						} 
   					}
   				})
   			})
   			function reviewReply() {
   				 let text = $("<textarea>").attr({
   					 'cols':'50',
   					 'rows':'3',
   					 'class':'form-control',
   					 'id':'text'
   				 }).css('border','2px solid orange');
   				 let enroll = $("<input>").attr({
   					 'type':'button',
   					 'value':'등록',
   					 'onclick':'reviewEnroll();',
   					 'id':'enroll'
   				 }).css('margin-left','330');
   				 
   				 let cancle = $("<input>").attr({
   					 'type':'button',
   					 'value':'취소',
   					 'onclick':'cancle();',
   						'id':'cancle'
   				 }).css('margin-left','10');
   				 console.log($(event.target).parent());
   				 $(event.target).hide();
   				$(event.target).parent().append(text).append(enroll).append(cancle);
   				
   				
   			 }
   			 function cancle() {
   				$(".reviewReply").show();
   				$("#text").remove();
   				$("#enroll").remove();
				$("#cancle").remove();
   			 }
   			 function reviewEnroll() {
   				console.log($(event.target).prev().val());
   				var td = $(event.target).parent();
   				 $.ajax({
   					 url:'${path}/licensee/reviewReplyEnroll',
   					 data:{
   						 r_no:$(event.target).parent().parent().next().val(),
   						 r_reply:$(event.target).prev().val()
   						 },
   					 success:function(data) {
   						 
   					 	 $("#text").hide();
   						$("#enroll").hide();
   						$("#cancle").hide();
   						let reply = $("<span>").html(data.r_REPLY);
   						let span = $("<span>").html('사장님 댓글 ->').css('font-weight','500');
   						td.append(span).append(reply); 
   					 }
   				 }) 
   			 }
   			 
   			 $("#storeInfo").change(function(){
   				$("#reviewList").children().remove();
   				$.ajax({
   					url:"${path}/licensee/reviewSelect",
   					data:{s_no:$("#storeInfo").val()},
   					
   					success:function(data) {
   						console.log('ㅎㅎgggg',data);
   					 	var d = new Date();
						var day = 24 * 60 * 60 * 1000;
							
   						if(data.length == 0) {
   							alert('등록 된 리뷰가 없습니다!');
   						}
   						for(let i=0;i<data.length;i++) {
   							
   							let div = $("<div>").attr('class','row');
   							let tbl = $("<table>").attr('class','tbl');
   							let tr = "<tr><td>";
   							let date = new Date(data[i].r_date);
   							let date1 = d-date;   							
   							let date2 = parseInt(date1/day);  							
   							tr+= "<span>*"+(data[i].m_nickname)+"*님 </span>&nbsp;&nbsp;&nbsp;";
   							if(date2 == 0) {
   								tr+="<span>"+'오늘'+"</span>";
   							}else if(date2 == 1) {
   								tr+="<span>"+'어제'+"</span>";
   							}else {
   							
   							tr+="<span>"+parseInt(date2/day)+'일전'+"</span></td><tr>";
   							
   							}
   							let tr1 = "<tr><td>";
   							
   							for(let j=0;j<5;j++) {
   								if(data[i].r_score <= j){
   									tr1+="<span style='color:red'>"+'☆'+"</span>";
   								}else{
   									tr1+="<span style='color:red'>"+'★'+"</span>";
   								}
   							}
   							tr1+="&nbsp;<span>"+'맛★&nbsp;'+data[i].r_score_taste+"</span>";
   							tr1+="&nbsp;<span>"+'양★&nbsp;'+data[i].r_score_amout+"</span>";
   							tr1+="&nbsp;<span>"+'배달★&nbsp;'+data[i].r_score_delivery+"</span>";
   							
   					 		let tr2 = "<tr><td>";   							
  							  	tr2+= "<input type='hidden' value='"+data[i].r_no+"' class='gdgd' />";
  							  	tr2+= "<div id='demo"+i+"' class='carousel slide' data-interval='true' data-ride='carousel'><div style='width:450px' class='carousel-inner'>";	
  							 
  							 for(let k=0;k<data[i].r_img.length;k++) {
   						 	if(data[i].r_img !=null) {  
   						 		if(k==0) {   								
   								tr2+= "<div style='width:450px' class='carousel-item active'><img src='${path}/resources/img/mypage/review/"+data[i].r_img[k]+"' width='450px' height='200px'/></div>";
   						 		}else {
   						 		tr2+= "<div style='width:450px' class='carousel-item'><img src='${path}/resources/img/mypage/review/"+data[i].r_img[k]+"' width='450px' height='200px'/></div> ";
   						 			
   						 		}
   								
   							}else {
   								tr2+="<img alt='첨부 된 사진이없어요!'width='450px' height='200px'/>";
   								
   							}
   						 	
  							 }
  							 tr2+=" <a class='carousel-control-prev' href='#demo"+i+"' data-slide='prev'><span class='carousel-control-prev-icon'></span> </a>";
  							 tr2+="<a class='carousel-control-next' href='#demo"+i+"' data-slide='next'><span class='carousel-control-next-icon'></span> </a>";    	   						 
  								tr2+="</div></div> ";
   							let tr3 = "<tr><td>"; 
   							for(let k=0;k<data[i].order_menu.length;k++) {
   							tr3 += "<span>"+data[i].order_menu[k].me_name+'/'+data[i].order_menu[k].sd_array+"</span></tr></td>";
   							}
   							let tr4 = "<tr><td>"; 
   							tr4+="<span>"+data[i].r_text+"</span>";
   							let tr5 = "<tr><td>";
   							if(data[i].r_reply == null) {
   							tr5+="<input style='margin-left:100px' class='reviewReply' type='button' value='답글' onclick='reviewReply();'/></td></tr>";
   							}else {
   								tr5+="<span style='font-weight:700'>사장님 댓글  -></span> <span>"+data[i].r_reply+"</span></td></tr>";
   							}
   							let tr6 = $("<input>").attr({
   								'type':'hidden',
   								'class':'r_no'+i,
   								'value':data[i].r_no
   							});
   							tbl.append(tr).append(tr1).append(tr2).append(tr3).append(tr4).append(tr5).append(tr6).after($("<br>"));
   							if(i%2==0) {
   							var divv = $("<div>").attr('class','row');
   							}
   							
   							divv.append(tbl);
   							let me_name = $("<span>").html(data[i].me_name);
   							let span1 = $("<span>").html(data[i].sd_array);
   							let span2 = $("<span>").html(data[i].r_text);
   							
   							$("#reviewList").append(divv);
   						} 
   					}
   				})
   			
   			 })
   		</script>
   	</section>
   	
   	<%@ include file="../common/footer.jsp" %>