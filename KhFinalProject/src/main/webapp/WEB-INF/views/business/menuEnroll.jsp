<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

  <style>
 
	
	#xBtn {
		box-shadow:inset 0px 1px 0px 0px lightgray;
		background:linear-gradient(to bottom, black 5%, black 100%);
		background-color:lightgray;
		border:3px solid lightgray;
		display:inline-block;
		cursor:pointer;
		color:lightgray;
		font-family:Arial;
		font-size:8px;
		font-weight:800;
		padding:0px 11px;
		text-decoration:none;
		text-shadow:0px 1px 0px #cc9f52;
	}
	#xBtn {
		background:linear-gradient(to bottom, lightgray 5%, black 100%);
		background-color:lightgray;
	}
	#xBtn {
		position:relative;
		top:1px;
	}
	.deleteBtn{
		background-color:white;
		display:inline-block;
		border:none;
		cursor:pointer;
		color:black;
		font-family:Arial;
		font-size:13px;
		font-weight:800;
		padding:0px 11px;
		text-decoration:none;
		margin-top:10px;
		
	}
	 div#main{
      	margin-top:130px;
      }
      div.col-12{
      	width:900px;
      	
      }
      th#h2{
      padding: 20 0 20 0;
      }
      th#h3{
      padding: 20 0 20 0;
      }
      td.d1{
      padding:0 0 0 10;
      }
      td.d2{
      padding:10 0 0 0;
      }
      th#h1{
       padding:0 0 20 0;
      }
      .btnC {
      margin-left:300px;
      }
      #storeInfo{
      background-color:lightgray;
      box-shadow :3px 3px 5px #333333;
      color:white;
      text-shadow:3px 3px 5px #333333;
      font-family: 'Do Hyeon';
      text-align :center;
      }
      
      option.opCol{
      color:white;
      text-shadow:3px 3px 5px #333333;
      font-family: 'Do Hyeon';
      text-align :center;
      }
      #optionEnroll{
	    box-shadow:3px 3px 5px white;
		background:linear-gradient(to bottom, lightgray 5%, black 100%);
		background-color:white;
		border-radius:10px;
		border:1px solid white;
		font-weight:0;
		display:inline-block;
		cursor:pointer;
		color:#ffffff;
		font-family:Arial;
		font-size:15px;	
		padding:6px 24px;
		text-decoration:none;
		font-family: 'Do Hyeon';
      }
      #subBtn{
    box-shadow:3px 3px 5px white;
	background:linear-gradient(to bottom, lightgray 5%, black 100%);
	background-color:white;
	border-radius:10px;
	border:1px solid white;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:15px;	
	padding:6px 24px;
	text-decoration:none;
	font-family: 'Do Hyeon';
	
	-webkit-animation: scale-up-center 0.4s cubic-bezier(0.390, 0.575, 0.565, 1.000) both;
	        animation: scale-up-center 0.4s cubic-bezier(0.390, 0.575, 0.565, 1.000) both;
	
      }
      
      /* ----------------------------------------------
 * Generated by Animista on 2020-5-25 21:21:32
 * Licensed under FreeBSD License.
 * See http://animista.net/license for more info. 
 * w: http://animista.net, t: @cssanimista
 * ---------------------------------------------- */

/**
 * ----------------------------------------
 * animation scale-up-center
 * ----------------------------------------
 */
@-webkit-keyframes scale-up-center {
  0% {
    -webkit-transform: scale(0.5);
            transform: scale(0.5);
  }
  100% {
    -webkit-transform: scale(1);
            transform: scale(1);
  }
}
@keyframes scale-up-center {
  0% {
    -webkit-transform: scale(0.5);
            transform: scale(0.5);
  }
  100% {
    -webkit-transform: scale(1);
            transform: scale(1);
  }
}

	#subBtn1{
	
	box-shadow:3px 3px 5px white;
	background:linear-gradient(to bottom, lightgray 5%, black 100%);
	background-color:white;
	border-radius:10px;
	border:1px solid white;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:15px;	
	padding:6px 24px;
	text-decoration:none;
	font-family: 'Do Hyeon';
	
	-webkit-animation: tracking-in-contract-bck-bottom 1s cubic-bezier(0.215, 0.610, 0.355, 1.000) both;
	        animation: tracking-in-contract-bck-bottom 1s cubic-bezier(0.215, 0.610, 0.355, 1.000) both;
	}
      /* ----------------------------------------------
 * Generated by Animista on 2020-5-25 23:27:37
 * Licensed under FreeBSD License.
 * See http://animista.net/license for more info. 
 * w: http://animista.net, t: @cssanimista
 * ---------------------------------------------- */

/**
 * ----------------------------------------
 * animation tracking-in-contract-bck-bottom
 * ----------------------------------------
 */
@-webkit-keyframes tracking-in-contract-bck-bottom {
  0% {
    letter-spacing: 1em;
    -webkit-transform: translateZ(400px) translateY(300px);
            transform: translateZ(400px) translateY(300px);
    opacity: 0;
  }
  40% {
    opacity: 0.6;
  }
  100% {
    -webkit-transform: translateZ(0) translateY(0);
            transform: translateZ(0) translateY(0);
    opacity: 1;
  }
}
@keyframes tracking-in-contract-bck-bottom {
  0% {
    letter-spacing: 1em;
    -webkit-transform: translateZ(400px) translateY(300px);
            transform: translateZ(400px) translateY(300px);
    opacity: 0;
  }
  40% {
    opacity: 0.6;
  }
  100% {
    -webkit-transform: translateZ(0) translateY(0);
            transform: translateZ(0) translateY(0);
    opacity: 1;
  }
 }
 
 #subBtn2{
 		box-shadow:3px 3px 5px white;
	background:linear-gradient(to bottom, lightgray 5%, black 100%);
	background-color:white;
	border-radius:10px;
	border:1px solid white;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:15px;	
	padding:6px 24px;
	text-decoration:none;
	
	font-family: 'Do Hyeon';
 }
 
 #menuEnrollBtn{
 	box-shadow:3px 3px 5px white;
	background:linear-gradient(to bottom, lightgray 5%, black 100%);
	background-color:white;
	border-radius:10px;
	border:1px solid white;
	display:inline-block;
	cursor:pointer;
	color:#FFEE85;
	font-family:Arial;
	font-size:20px;	
	padding:6px 24px;
	text-decoration:none;	
	font-family: 'Do Hyeon';
 }
 #cateBtn {
 	box-shadow:3px 3px 5px white;
	background:linear-gradient(to bottom, lightgray 5%, black 100%);
	background-color:white;
	border-radius:10px;
	border:1px solid white;
	display:inline-block;
	cursor:pointer;
	color:white;
	font-family:Arial;
	font-size:20px;	
	padding:6px 24px;
	text-decoration:none;	
	font-family: 'Do Hyeon';
 }

	pre.ment {
		font-family: 'Do Hyeon';
		text-shadow:3px 3px 5px lightgray;
		font-size:30px;
		color:black;
	}
	 span{
	
	font-family: 'Do Hyeon';
	}
	
	label{
	
	font-family: 'Do Hyeon';
	}
	input{
	
	font-family: 'Do Hyeon';
	}
	select#selectCategory {
	font-family: 'Do Hyeon';
	}
	h3{
	font-family: 'Do Hyeon';
	}
	option.opCate{
	font-family: 'Do Hyeon';
	}
	input#plusOption2{
	font-family: 'Do Hyeon';
	}
	
	.plus{
	font-family: 'Do Hyeon';
	}
	.plus1{
	font-family: 'Do Hyeon';
	}
	table>tr>td{
	
	font-family: 'Do Hyeon';
	
	}
	
	table>tr>th{
	
	font-family: 'Do Hyeon';
	
	}
	
	input[type=text] {
	font-family: 'Do Hyeon';
	}
	
	input[type=file] {
	font-family: 'Do Hyeon';
	}
	
	input[type=number] {
	font-family: 'Do Hyeon';
	}
	textarea#textArea {
	font-family: 'Do Hyeon';
	}
	
	textarea.txt {
	font-family: 'Do Hyeon';
	}
	 
	
	
	








      </style> 
	<%@ include file="../common/header.jsp" %>
	
    <section id="section" style="width:auto;height:auto;margin-bottom:250px;">
 	<div class="container">
 		<div class="row">
 		<%@ include file="sideBar.jsp" %>
            <div class="col-lg-10" id="main">
                     <ul class="nav nav-tabs nav-justified">
                        <li class="nav-item">
               				<span style="font-size:40px;">*  메뉴 등록</span>
                        
                        </li>
                    </ul>
                    <br>                 
		
                    	<div class="col-12">
                    	<br>
                    		
                    		<select id="storeInfo" name="storeNo" class="form-control" style="margin-left:400px;width:auto;display:block;">
                    		<c:forEach items="${store}" var="s">
                    			<option for="storeInfo" class="opCol" value="${s.s_No }"><c:out value="${s.s_Name }" /></option>
                    		</c:forEach> 
                    		</select>
                    		         <br>
                    		          <marquee><div>
                       <span class="span">${store[0].s_Name}</span> <span class="span1">매장에 등록 된  </span><span class="span2"></span>
                        <br>
                         <span class="span4">${store[0].s_Name}</span> <span class="span5">매장에 등록 된  </span><span class="span10"></span>
                        <br>
                         <span class="span6">${store[0].s_Name}</span> <span class="span7">매장에 등록 된  </span><span class="span11"></span>
                        <br>
                        <span class="span8">${store[0].s_Name}</span> <span class="span9">매장에 등록 된  </span><span class="span12"></span>
                        <br>
                        <span style="color:black;">** 자세한 사항은 메뉴등록 창에서 확인해주세요! ** </span>
                         </div>
                         </marquee>
                    		<br>
                    		<br>
                    	   <button type="button" id="subBtn" class="btnC" onclick="categoryPlus();">카테고리 추가</button> 
                    	   <button type="button" id="subBtn1" class="btn btn-outline-warning btnC1" onclick="optionPlus();">옵션 추가</button>
                    	   <button type="button" id="subBtn2" class="btn btn-outline-primary" onclick="menuEnroll();">메뉴 등록</button>
                    		<button style="display:none;"type="button" class="hidBtn" onclick="hidBtn();"></button>
                    		<form action="${path }/licensee/menuEnrollEnd" method="post" id="menu-container" enctype="multipart/form-data" onsubmit="return menuEnrollEnd();">
                    		<div class="container addCategory">	
                    		<br>
                    		<br>
                    		</div>
                    		<br>
                    		<br>
                    		<button style="margin-left:400px;"  id="menuEnrollBtn" type="submit" id="subBtn3" class="btn btn-outline-warning">등록</button>
                    		</form>
                    		
                    	    </div>
                    	  </div>
                    	</div>                    				  
            	</div> <!-- 컨테이너 -->
            		
            			<!--카테고리 추가 모달 -->
            			<div class="modal" id="myModal3">
						    <div class="modal-dialog">
						      <div class="modal-content">
						        <div class="modal-header">
						          <h3 class="modal-title">카테고리 등록</h3>
						          <button style="margin-left:180px;"class="btn btn-outline-dark"type="button" onclick="add();">추가</button>
						          <button type="button" class="close" data-dismiss="modal">&times;</button>
						        </div>
						         
						        <div class="modal-body" align=center>	
						       
						        <form id="form" action="${path }/licensee/categoryEnroll" method="post" class="categoryForm" onsubmit="return categoryEnroll();"> 
						        
						        	<button id="cateBtn" type="submit">등록</button>
						        	<br>
						        </form>
						        </div>					        
						      </div>
						    </div>
						  </div>

						<!-- 추가옵션 등록 모달 -->
						  <div class="modal" id="myModal">
						    <div class="modal-dialog">
						      <div class="modal-content">
						        <div class="modal-header">
						          <h3 class="modal-title">추가옵션 등록</h3>
						          <button type="button" class="close" data-dismiss="modal">&times;</button>
						        </div>
						         
						        <div class="modal-body" align=center>	
						        	<form id="optionForm" action="${path }/licensee/optionEnroll" method="post" onsubmit="return optionForm();">	         	
						          	<input style="width:60px;display:inline" type="text" id="plusOption2" name="e_option" class="form-control" placeholder="필수" disabled>
						          	<button type="button" class="btn btn-light plus"  onclick="option();">옵션 추가</button>						     
						          	<br>
						          	<br>
						          	<div id="option1-container">
						          	</div>					          					          	
						          	<input style="width:60px;display:inline;" type="text" id="plusOption2" name="e_option2" class="form-control" placeholder="추가" disabled>        
						          	<button type="button" class="btn btn-light plus1" onclick="option1();">옵션 추가</button> 					          	
						          	<br>
						          	<br>
						          	<div id="option2-container"></div>
						          	 
						          	<button type="submit" class="btn btn-outline-secondary">등록</button>		
						          	</form>		        
						        </div>					        
						      </div>
						    </div>
						  </div>
						  <!-- 메뉴등록 모달 -->
						  <div class="modal" id="myModal2">
						    <div class="modal-dialog">
						      <div class="modal-content">
						        <div class="modal-header">
						          <h3 class="modal-title">메뉴 등록 <button id="xBtn" style="margin-left:300px;height:30px;"type="button"class="xxx btn btn-outline-dark" onclick="xx();" data-dismiss="modal">x</button></h3>
						        </div>
						        <div class="modal-body" align=center>	
						        	<div class="body-container custom-file">		
						        		<label class="custom-file-label fileName" for="modalFile"><strong>메뉴 이미지를 첨부해주세요.</strong></label>
						        		<input type="file" id="modalFile" class="custom-file-input">
						        				        		        
						        		<input type="text" placeholder="메뉴명" class="menu-name form-control" name="menu-name">
						        		<input type="number" placeholder="메뉴가격" class="menu-price form-control" name="menu-price">
						        		<textarea cols="20" rows="1" placeholder="메뉴간단설명(30자 제한)" id="textArea" class="menu-detail form-control" name="menu-detail"></textarea>
						        		<br>
						        	</div>
						        	<div style="margin-top:200px;"class="body-container2"></div>
						        	<div style=""class="body-container3"></div>
						        	<button type="button" id="optionEnroll" data-dismiss="modal" onclick="menu_enroll();">등록</button>			
						        </div>
						      </div>
						    </div>
						  </div>
	  		
		<script>
		function optionForm() {
			if($("input[name=sd_name]").val().trim()==""||$("input[name=sd_name]").length==0){
				return false;
			}else {
				return true;
			}
			
		}
		function categoryEnroll() {

			if($(".categoryPP").val().trim()=="" || $(".categoryPP").length==0){
				alert('카테고리를 1개이상 입력해야 등록이 가능합니다!');
				return false;
			}
			else{
				
				return true;
			}
		}
		function menuEnrollEnd() {
			if($("#menu-container").children().find('div').length==0) {
				alert('1개 이상의 메뉴를 넣어야 등록이 가능합니다!');
				return false;
			}else {
				
				return true;
			}
		}
		function text() {
			//옵션 폼
		/* 	let sd_name = $("input[name=sd_name]").val();
			let sd_price = $("input[name=sd_name]").val();
			if(sd_name.trim().length==0 || sd_price.trim().length==0) {
				
				return false;
			} */
		}
		$("#storeInfo").change(function() {
			$("#span").next().html('');
			$("#span1").next().html('');
			$("#span2").next().html('');
			$.ajax({
				url:'${path}/licensee/selectCategory',
				data:{s_no:$("#storeInfo").val()},
				success:function(data) {	
					console.log('카테',data);
					let span = $("<span>").html('카테고리는 '+data.length+'개  입니다.');
					$(".span2").html('카테고리는 '+data.length+'개  입니다.');
					
				}
			})
			
			$.ajax({
				url:'${path}/licensee/selectOption',
				data:{s_no:$("#storeInfo").val()},
				success:function(data) {	
					console.log('옵션ㅎㅎㅎ',data);
					let y = 0;
					let n = 0;
					for(let i=0;i<data.length;i++) {
						if(data[i].sd_division == 'Y') {
							y++;
						}else{
							n++;
						}
							
						}

					$(".span10").html('필수 옵션은 '+y+'개  입니다.');
					$(".span11").html('추가 옵션은 '+n+'개  입니다.');
					}

			})
			
			$.ajax({
				url:'${path}/licensee/menuCount',
				data:{s_no:$("#storeInfo").val()},
				success:function(data) {	
					console.log('메뉴카운트',data);
					
					$(".span").html('*  '+data.s_name).css('color','#FF5A5A');
				 	$(".span4").html('*  '+data.s_name).css('color','orange');
					$(".span6").html('*  '+data.s_name).css('color','#FFE08C');
					$(".span8").html('*  '+data.s_name).css('color','lightgreen');
					$(".span12").html('메뉴는    '+ data.count+   '개 입니다.');
				}
			})
			
			
		})
		$(function() {
			
		$("#textArea").on('keyup',function(){
			if($(this).val().length>20) {
				$(this).val($(this).val().substring(0,30));
			}
		});
		
		$("#span").next().html('');
		$("#span1").next().html('');
		$("#span2").next().html('');
		$.ajax({
			url:'${path}/licensee/selectCategory',
			data:{s_no:$("#storeInfo").val()},
			success:function(data) {	

				$(".span2").html('카테고리는 '+data.length+'개  입니다.');
				
			}
		})
		
		$.ajax({
			url:'${path}/licensee/selectOption',
			data:{s_no:$("#storeInfo").val()},
			success:function(data) {	
				
				let y = 0;
				let n = 0;
				for(let i=0;i<data.length;i++) {
					if(data[i].sd_division == 'Y') {
						y++;
					}else{
						n++;
					}
						
					}

				$(".span10").html('필수 옵션은 '+y+'개  입니다.');
				$(".span11").html('추가 옵션은 '+n+'개  입니다.');
				}

		})
		
		$.ajax({
			url:'${path}/licensee/menuCount',
			data:{s_no:$("#storeInfo").val()},
			success:function(data) {	
				console.log('메뉴카운트',data);
				
				$(".span").html('*  '+data.s_name).css('color','#FF5A5A');
			 	$(".span4").html('*  '+data.s_name).css('color','orange');
				$(".span6").html('*  '+data.s_name).css('color','#FFE08C');
				$(".span8").html('*  '+data.s_name).css('color','lightgreen');
				$(".span12").html('메뉴는    '+ data.count+   '개 입니다.');
			}
		})

			$.ajax({
				url:'${path}/licensee/businessStore',
				success:function(data) {
					
					if(data.length == 0) {
						var msg = confirm('등록된 가게가 없습니다.등록하시겠습니까?');
						if(msg) {
							location.replace('${path}/store/storeEnroll.do');
						}
					}
				}
			})
		});
			$(".close").click(function() {
			
				$("input[name=category]").remove();
				$("input[name=sd_name]").parent().parent().remove();
				$("input[name=sd_price]").parent().remove();
				$(".deleteBtn").remove();
				
			})
			var num = 0;			
			 $("#modalFile").change(function(){
				 console.log($("#modalFile").val());
				 
				let fileValue = $("#modalFile").val().split("\\");
				let fileName = fileValue[fileValue.length-1]; 
				console.log(fileName);
				if(fileName.trim().length==0) {
					$(".fileName").html('<strong>'+'메뉴 이미지를 첨부해주세요.'+'</strong>');
				}else { 
					$(".fileName").html(fileName);
				}

			}) 
			function xx() {
				$("#selectCategory").remove();
				$(".menu-name").val("");
				$(".menu-price").val("");
				$(".menu-detail").val("");
				$("#modalFile").val("");
				$(".fileName").html('<strong>'+'메뉴 이미지를 첨부해주세요.'+'</strong>');
			}
			 function categoryPlus() {

						 $("#myModal3").modal('show');
						 
						 $(".modal-body").children().find('input[name=storeNo]').remove();
						 let storeNo = $("<input>").attr({
							 'type':'hidden',
							 'name':'storeNo',
							 'value':$("#storeInfo").val()
						 });
						 $("#form").append(storeNo);

					 }
	 
			 
			 function optionPlus() {
			
							 $("#myModal").modal('show');
							 let storeNo = $("<input>").attr({
								 'type':'hidden',
								 'name':'storeNum',
								 'value':$("#storeInfo").val()
							 });
							 $("#option2-container").append(storeNo);
						 }

			 function menuEnroll() {

				$.ajax({
					url:'${path}/licensee/selectCategory',
					data:{s_no:$("#storeInfo").val()},
					success:function(data){
						
						$("#myModal2").modal({backdrop:'static'});
						
						var sel = $("<select>").attr({
							'id':'selectCategory',
							'class':'form-control',				
						}).css('width','auto');
						 
						
						for(let i=0;i<data.length;i++) {
							var op = $("<option>").attr({
								'for':'selectCategory',
								'class':'opCate',
								'value':data[i].mt_name,
								
								
							}).html(data[i].mt_name);
							
							var mtNo = $("<input>").attr({
								'type':'hidden',
								'value':data[i].mt_no,
								'name':'mt_no',
								'class':'mtNo'+data[i].mt_no
							})
							sel.append(op).append(mtNo);
						}
						
						$(".body-container").append(sel);
						
						
					}
				})
				num++;
			}
			 
			
			function add() {
				let categoryPP = $("<input>").attr({'type':'text','class':'categoryPP ','name':'category','placeholder':'카테고리를 입력해주세요.'}).css('width','350');
				let close = $("<input>").attr({
					'type':'button',
					'value':'x',
					'onclick':'closeX();'
				}).css({
					'margin-left':'30',
					'border':'none',
					'background-color':'white',
					'font-weight':'700'
					});
				let div = $("<div>").attr('class','categoryDiv');
				div.append(categoryPP).append(close).append($("<br>"));
				$("#form").append(div);
			}
			function closeX() {
				$(event.target).parent().remove();
				console.log($(".categoryDiv").length);
	
			}
	
			
			$("#myModal2").on('show.bs.modal',function(){
				
				let div = $(".body-container2").children();
				let div2 = $(".body-container3").children();
				 	$.ajax({
				url:'${path }/licensee/selectOption',
				data:{s_no:$("#storeInfo").val()},
				success:function(data) {
					div.remove();
					div2.remove();
					console.log('성공');
					console.log(data);
					if(data.length == 0 || data.sd_division == 'Y') {
						var xh = $("<h3>").html('등록 된  옵션이 없습니다!');						
						$(".body-container2").append(xh);					
					}
					else {
					var hh3 = $("<h3>").attr({
						'class':'hh3text'
					}).html('필수선택');
					var h3 = $("<h3>").attr({
						'class':'h3text'
					}).html('추가선택');
					
					$(".body-container2").append(hh3);
					$(".body-container3").append(h3);
					
					for(let i=0;i<data.length;i++) {
						if(data[i].sd_division=='Y') {
					var input =  $("<input>").attr({
						'type':'checkbox',
						'value':data[i].sd_name,
						'id':'sideOption'+i,
						'name':'radio'
						
					})
					var label = $("<label>").attr({
						'for':'sideOption'+i,
						
					}).html(data[i].sd_name);
					let sdNo = $("<input>").attr({
						'type':'hidden',
						'name':'sdNo',
						'value':data[i].sd_no
					})	
					var span = $("<span>").html(data[i].sd_price).css('margin-left','80');
				
						
					$(".hh3text").after(span).after(label).after(input).after(sdNo).after($("<br>"));
					
					}else { 
						var input =  $("<input>").attr({
							'type':'checkbox',
							'value':data[i].sd_name,
							'id':'sideOption'+i,
							'class':'sideOption',
							'name':'check'
							
						})
						var label = $("<label>").attr({
							'for':'sideOption'+i,
							
						}).html(data[i].sd_name);
						
						var span = $("<span>").html(data[i].sd_price).css('margin-left','100');
						let sdNo = $("<input>").attr({
							'type':'hidden',
							'name':'sdNo',
							'value':data[i].sd_no
						})
						$(".h3text").after(span).after(label).after(input).after(sdNo).after($("<br>"));
						
					}
					}
					
				}
				},
				error:function(){
					console.log("실패");
				}
			});	 
			})
			
			var tbl = $("<table>").attr('id','option1');
			var tr = $("<tr>");
			var th = $("<th>").html('옵션');
			var th1 = $("<th>").html('가격');
			tr.append(th).append(th1);
			tbl.append(tr);
			tbl.attr({
				'class':'table table-hover'
			})
			
			
			function option() {
				var tr = $("<tr>");
				var tr1 = $("<tr>");
				var td = $("<td>");
				var td1 = $("<td>");
				var td2 = $("<td>");
				var text = $("<input>").attr({
					'type':'text',
					'name':'sd_name',
					'class':'sd_name form-control',
					'placeholder':'옵션 입력 해주세요'
				})
				var number = $("<input>").attr({
					'type':'number',
					'name':'sd_price',
					'class':'sd_price form-control',
					'placeholder':'가격 입력 해주세요'
				});	
				var hidden = $("<input>").attr({
					'name':'sd_division',
					'type':'hidden',
					'value':'Y'
				})
				let deleteBtn = $("<input>").attr({
					'class':'deleteBtn',
					'type':'button',
					'value':'x',
					'onclick':'deleteX();'
					
				})
				td.append(text);
				td1.append(number).append(hidden);
				td2.append(deleteBtn);
				tr.append(td).append(td1).append(td2);
				tbl.append(tr);
				$("#option1-container").append(tbl);			
			}
			
			function deleteX() {				
				$(event.target).parent().parent().remove();
				
			}
			
			var tbl2 = $("<table>").attr('id','option2');
			var tr2 = $("<tr>");
			var th2 = $("<th>").html('옵션');
			var th3 = $("<th>").html('가격');
			tr2.append(th2).append(th3);
			tbl2.append(tr2);
			tbl2.attr({
				'class':'table table-hover'
			})
			
			function option1() {
				var tr = $("<tr>");
				var tr1 = $("<tr>");
				var td = $("<td>");
				var td1 = $("<td>");
				var td2 = $("<td>");
				var texts = $("<input>").attr({
					'type':'text',
					'name':'sd_name',
					'class':'form-control',
					'placeholder':'옵션 입력 해주세요'
					
				})
				var numbers = $("<input>").attr({
					'type':'number',
					'name':'sd_price',
					'class':'form-control',
					'placeholder':'가격 입력 해주세요'
				})
				var hidden = $("<input>").attr({
					'name':'sd_division',
					'type':'hidden',
					'value':'N'
				})
				
				let deleteBtn = $("<input>").attr({
					'class':'deleteBtn',
					'type':'button',
					'value':'x',
					'onclick':'deleteX();'
					
				})
				td.append(texts);
				td1.append(numbers).append(hidden);
				td2.append(deleteBtn);
				tr.append(td).append(td1).append(td2);
				tbl2.append(tr);
				$("#option2-container").append(tbl2);					
			}
		
			
			function menu_enroll() {
				if($("input[name=menu-name]").val().trim().length==0){
					alert('메뉴명을 적어주세요!');
					$("input[name=menu-name]").focus();
					$("#optionEnroll").removeAttr('data-dismiss');
					return;
				}else { 
					$("#optionEnroll").attr('data-dismiss','modal');
				}
				
				if($("input[name=menu-price]").val().trim().length==0){
					alert('메뉴 가격을 적어주세요!');
					$("input[name=menu-price]").focus();
					$("#optionEnroll").removeAttr('data-dismiss');
					return;
				}else { 
					$("#optionEnroll").attr('data-dismiss','modal');
				}
				let txt = document.getElementById('textArea').value;
				if(txt.length==0){
					alert('메뉴 간단 설명을 해주세요!');
					$("input[name=menu-detail]").focus();
					$("#optionEnroll").removeAttr('data-dismiss');
					return;
				}else { 
					$("#optionEnroll").attr('data-dismiss','modal');
				}
					
				let checkName = document.getElementsByName('check');
				let checkCount = 0;
				
			 for(let i=0;i<checkName.length;i++) {
					
					let check = checkName[i];
						
					if(check.checked==false) {
						checkCount+= 0;		
						
					}else {
						checkCount += 1;
						
					}
				}

				var cloneFile = $("#modalFile").clone();
				cloneFile.removeAttr('id');
				cloneFile.attr({
					'id':'cloneFile',
					'name':'me_logImg',
					
				}).css('display','none');


				var menuName = $(".menu-name").val();
				var menuPrice = $(".menu-price").val();
				var menuDetail = $(".menu-detail").val();
				
				var inputN = $("<input>").attr({
					'type':'text',
					'name':'me_name',
					'value':menuName,
					'class':'form-control'
				});
				var inputP = $("<input>").attr({
					'type':'number',
					'name':'me_price',
					'value':menuPrice,
					'class':'form-control'
				});
				var textD = $("<textarea>").attr({
					'cols':'20',
					'rows':'1',
					'name':'me_text',
					'class':'form-control txt'
				}).html(menuDetail);
				
				var hidNum = $("#hid").val();	
				var div = $("<div>").attr('class','col-lg-5 bodyOne');
				var div1 = $("<div>").attr('class','col-lg-4 bodyTwo'+num);
				var div2 = $("<div>").attr('class','col-lg-3 bodyThree');
				var div3 = $("<div>").attr('class','row categoryPlus'+num).append($("<input>").attr({'type':'button','value':'x','onclick':'canX();'}));
				
				
					var img = $("<img>").attr({
						'id':'preview'+num,
						'class':'preview'+num,
						'src':' ',
						'width':'150'
					})
					
				
					var file = document.querySelector('#modalFile');
					var fileList = file.files;
					var reader = new FileReader();
					if(fileList[0]!=null) {
					
					reader.readAsDataURL(fileList[0]);
					 
					}
					
					reader.onload = function  () {       
						
				        document.querySelector('#preview'+num).src = reader.result;
						
						};
					
					
				div.append(inputN);
				div.append(inputP);
				div.append(textD);

				if($("input[name=radio]:checked").length !=0) {
				 var strong = $("<strong>");
				 var pTag = $("<p>").html("필수");
				 strong.append(pTag);
				 div1.append(strong);	
				}else {
					div1.append($("<span>").css('display','block').html('선택 된 필수 옵션이 없습니다!'));
				}

				let mCheck = [];
				let mPrice = [];
				let sdNum = [];
				 $("input[name=radio]:checked").each(function(i) { 

					 mCheck[i]=$(this).val();
					 mPrice[i]=$(this).next().next().html();
					 sdNum[i]=$(this).prev().val();
					 console.log('옵옵'+sdNum[i]);
				        var mCheckbox = $("<input>").attr({
				        	'type':'checkbox',
				        	'name':'checked',
				        	'value':mCheck[i],
				        	'id':'addEnd'+i,
				        	'class':'form-control checkk',
				        	'checked':'true',
				        	'readonly':'true'
				        	
				        }).css({'display':'inline','width':'20'});
				        var mLabel = $("<label>").attr({
				        	'for':'addEnd'+i,
				        	
				        }).html(mCheck[i]).css({'display':'inline'});
				        var spanValues = $("<input>").attr({'type':'number','name':'endPrice','value':$("input[name=radio]:checked").next().next().html(),'class':'form-control','readonly':'true'}).css({'display':'inline','width':'100','height':'20'});
				    	
				       let sdNoInput = $("<input>").attr({
							'type':'hidden',
							'value':sdNum[i],
							'name':'sdNoEnd'
						});
				   
				        div1.append(sdNoInput).append(mCheckbox).append(mLabel).append(spanValues).append($("<br>"));
				 });
				 
					 let check = [];
					let price =[];
					let sdNo=[];
					if($("input[name=check]:checked").length !=0) {
					var strong1 = $("<strong>");
					var pTag1 = $("<p>").html("추가");
					strong1.append(pTag1);
					div1.append(strong1);
					}else {
						div1.append($("<span>").html('선택 된 추가 옵션이 없습니다!'));
					}
					
					
				 $("input[name=check]:checked").each(function(i) { 

				        check[i]=$(this).val();
				        price[i]=$(this).next().next().html();
				        sdNo[i]=$(this).prev().val();
				        var good = $("<input>").attr({
				        	'type':'checkbox',
				        	'name':'checked',
				        	'value':check[i],
				        	'id':'addEnd'+i,
				        	'class':'form-control checkk',
				        	'checked':'true',
				        	'readonly':'true'
				        	
				        }).css({'display':'inline','width':'20'});
				        var goods = $("<label>").attr({
				        	'for':'addEnd'+i,
				        	
				        }).html(check[i]).css({'display':'inline'});
				        var spanValues = $("<input>").attr({'type':'number','name':'endPrice','value':$("input[name=check]:checked").next().next().html(),'class':'form-control'}).css({'display':'inline','width':'80','height':'20'});
				    	
				       let sdNoInput = $("<input>").attr({
							'type':'hidden',
							'value':sdNo[i],
							'name':'sdNoEnds'
						});
	
				        div1.append(sdNoInput).append(good).append(goods).append(spanValues).append($("<br>"));
				 });
						
				 	var  cateInput = $("<input>").attr({
				 		'type':'text',
				 		'name':'categoryEnd',
				 		'value':$("#selectCategory").val(),
				 		'readonly':'true'
				 	}).css('margin-top','30');
				 	
				 	
				 	var mtNoInput = $("<input>").attr({
				 		'type':'hidden',
				 		'name':'mt_no',
				 		'value':$("#selectCategory option:selected").next().val(),
				 	})
				 	
				 	var testss = $(".bodyTwo"+num);
				 					
				 	 let storeNo = $("<input>").attr({
					 'type':'hidden',
					 'name':'storeNum',
					 'value':$("#storeInfo").val()
					 });

				var divv = $("<div>")
				divv.append(hiddenInput);
				div2.append(img);
				div3.append(div).append(div1).append(div2);
				$(".addCategory").append(cateInput).append(mtNoInput).append(cloneFile);
				$(".addCategory").append(div3);
				$(".menu-name").val("");
				$(".menu-price").val("");
				$(".menu-detail").val("");
				$("#modalFile").val("");
				$(".fileName").html('<strong>'+'메뉴 이미지를 첨부해주세요.'+'</strong>');
				$("#selectCategory").remove();
				console.log($(".categoryPlus"+num).find($("input[name=sdNoEnd]")).length);
				 var hiddenInput = $("<input>").attr({
				 		'type':'hidden',
				 		'name':'count',
				 		'value':$(".categoryPlus"+num).find($("input[name=sdNoEnd]")).length
				 	})
				 	var hiddenInput1 = $("<input>").attr({
				 		'type':'hidden',
				 		'name':'counts',
				 		'value':$(".categoryPlus"+num).find($("input[name=sdNoEnds]")).length
				 	})
				
				 div3.append(hiddenInput).append(hiddenInput1).append(storeNo);
				 

				 }

			
		
		
		
		</script>
    </section>
    
    <%@ include file="../common/footer.jsp" %>