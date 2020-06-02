<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
   <style>
	div{
		font-family: 'Do Hyeon';
	}
	span{
		font-family: 'Do Hyeon';
		
	}
	p{
		font-family: 'Do Hyeon';
				
	}
	h2{
		font-family: 'Do Hyeon';
		display : inline;
		margin-left:200px;
		
	}
	label{
			font-family: 'Do Hyeon';
	}
	modal-body1{
		font-family: 'Do Hyeon';
	}
 	div#main{
      	 	
      	margin-top:130px;
      	
      }
 
      div.row1 {
      	margin-left:30px;
      	margin-top:50px;
      }
      div.menuDiv  {
      margin-bottom:20px;
      }

  .xBtn {
		box-shadow:inset 0px 1px 0px 0px #fce2c1;
		background:linear-gradient(to bottom, #ffc477 5%, #fb9e25 100%);
		background-color:#ffc477;
		border:3px solid #eeb44f;
		display:inline;
		cursor:pointer;
		color:#ffffff;
		font-family:Arial;
		font-size:8px;
		font-weight:bold;
		
		text-decoration:none;
		text-shadow:0px 1px 0px #cc9f52;
	}
	.xBtn {
		background:linear-gradient(to bottom, #fb9e25 5%, #ffc477 100%);
		background-color:#fb9e25;
	}
	.updateBtn{
	box-shadow:3px 3px 5px white;
	background:linear-gradient(to bottom, lightgray 5%, black 100%);
	background-color:white;
	border-radius:10px;
	border:1px solid white;
	display:inline-block;
	cursor:pointer;
	color:white;
	font-family:Arial;
	font-size:15px;	
	padding:6px 24px;
	text-decoration:none;
	margin-bottom:10px;
	}
	#mUpdate{
	box-shadow:3px 3px 5px white;
	background:linear-gradient(to bottom, lightgray 5%, black 100%);
	background-color:white;
	border-radius:10px;
	border:1px solid white;
	display:inline-block;
	cursor:pointer;
	color:white;
	font-family:Arial;
	font-size:15px;	
	padding:6px 24px;
	text-decoration:none;
	}
	div#myModal1{
		height:auto;
		
	}

	#store{
	      background-color:lightgray;
      box-shadow :3px 3px 5px #333333;
      color:white;
      text-shadow:3px 3px 5px #333333;
      font-family: 'Do Hyeon';
      text-align :center;
	}
	div#demo{
		background:linear-gradient( #FFFFFF 5%);		 
		 width:800px;
		 margin-left:60px;
	}
	div.menuList{
	background-color:white;
	border:1px solid lightgray;
	 margin-bottom:20px;
	}

	span#prev{
		
	  background-image: url("data:image/svg+xml;charset=utf8,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='%234B4B4B' viewBox='0 0 8 8'%3E%3Cpath d='M5.25 0l-4 4 4 4 1.5-1.5-2.5-2.5 2.5-2.5-1.5-1.5z'/%3E%3C/svg%3E");
	}
	span#next{
		margin-left:6px;
		background-image : url("data:image/svg+xml;charset=utf8,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='%234B4B4B' viewBox='0 0 8 8'%3E%3Cpath d='M1.5 0l-1.5 1.5 2.5 2.5-2.5 2.5 1.5 1.5 4-4-4-4z'/%3E%3C/svg%3E") ;
	}
	a#prevA{
	width:30px;
	height:30px;
	margin-top:150px;
	border:1px solid lightgray;
	}
	a#nextA{
	width:30px;
	height:30px;
	margin-top:150px;
	border:1px solid lightgray;
	}
	input.menuName{
		border:none;
		margin-top:5px;
		font-weight:1000;
	}
	
	input.sss{
		border:none;
		margin-top:5px;
		margin-left:20px;
		font-weight:1000;
	}
	input.menuPrice{
		border:none;
		margin-top:5px;
		font-weight:1000;
	}
	div.modal-content{
	overflow-y:scroll;	
	width:600px;
	height:900px;
	}
	div.modal-body2 {
		height:auto;
	}

      </style>
      
      
	<%@include file="../common/header.jsp" %>
    <section id="section" style="width:auto;height:auto;margin-bottom:250px;">
 	<div class="container" >
 		<div class="row">
 		<%@ include file="sideBar.jsp" %>
            <div class="col-lg-10" id="main">
            
                      <ul class="nav nav-tabs nav-justified">
                         <li class="nav-item">
                        	<p>* 메뉴 관리</p>
                        	<span>* 상세보기를 원하시면 카테고리안의 메뉴를 클릭해주세요!</span>
                        </li>
                                        
                    </ul>
                    
                  
                    <br>
                    <br>
                    	<select id="store" class="form-control" style="width:auto;margin-left:400px;">
                    	<c:forEach items="${store }" var="s">
                    		<option for="store" value="${s.s_No }"><c:out value="${s.s_Name }" /></option>
                    	</c:forEach>
                    	</select>
                    	<br>
                    	<br>
                    	<div id="demo" class="carousel slide" data-ride="carousel">
					  <div class="carousel-inner menuDiv">
					   
					  </div>

					  <a id="prevA" class="carousel-control-prev" href="#demo" data-slide="prev">
					    <span id="prev" class="carousel-control-prev-icon"></span>
					  </a>
					  <a id="nextA" class="carousel-control-next" href="#demo" data-slide="next">
					    <span id="next" class="carousel-control-next-icon"></span>
					  </a>
					</div>
					
					<div id="categoryList">
					
					</div>
            </div> 
   		</div>
   		</div>
   			<div class="modal" id="myModal2">
						    <div class="modal-dialog">
						      <div class="modal-content">
						        <div class="modal-header">
						          <h4 class="modal-title">메뉴 수정</h4>						          
						          <button type="button" class="close" data-dismiss="modal">&times;</button>
						        </div>
						         
						        <div class="modal-body2" align=center>	
						        
						        <form id="form" action="${path }/licensee/menuUpdate" method="post" class="categoryForm" enctype="multipart/form-data" onsubmit="return menuUp();"> 
						        	<div id="menuUpdate">						        		
						        	</div>
						        	<button id="mUpdate" type="submit" class="btn btn-outline-success">등록합니다요!!!</button>
						        </form>
						        </div>					        
						      </div>
						    </div>
						  </div>
						  <div class="modal" id="myModal1">
						    <div class="modal-dialog">
						      <div class="modal-content">
						        <div class="modal-header1">
						          <h2 class="modal-title">메뉴 상세</h2>
						          <button style="margin-top:10px;margin-right:20px;font-size:30px;"type="button" class="close" data-dismiss="modal">&times;</button>
						        </div>				         
						        <div class="modal-body1" align=center>	
						        
						        </div>					        
						      </div>
						    </div>
						  </div>
						  
   		<script>
			
   		$(function() {
   			
   		 	$.ajax({
					url:"${path}/licensee/selectCategory",
					data:{s_no:$("#store").val()},
					success:function(data) {
						console.log("카테고리성공",data);	
						if(data.length == 1) {							
							alert('등록 된 카테고리가 없습니다!');
							return;
						}
						for(let i=0;i<data.length;i++) {
							let cateSpan = $("<input>").attr({								
								'class':'form-control sss',
								'type':'text',
								'onclick':'category()',
								'value':data[i].mt_name,
								'readonly':'true'
								
							})
							let mtNo = $("<input>").attr({
								'type':'hidden',
								'class':'mt_no'+i,
								'value':data[i].mt_no
							})
							
							let menuDivs = $("<div>").attr({'class':'menuView'+i});
							
							$("#categoryList").append(cateSpan).append(mtNo).append(menuDivs);
							
						}
						$.ajax({
			   				/* $(".menuDiv").children().remove(); */
			   				url:"${path}/licensee/menuSelect",
								data:{s_no:$("#store").val()},
								success:function(data) {
									console.log('메뉴성공1',data);
									if(data.length==0) {
										console.log('메뉴성공2',data);
										$("#demo").children().remove();
										$("#prev").hide();
										$("#next").hide();
										return;
									}else {
									console.log('메뉴성공3',data);
									let remove = $(".row1").children().remove();
									let modalDiv = $("<div>").attr('class','col-lg-12').css({'border':'1px solid black'});
									let rowDiv = $("<div>").attr('class','row row1');
									console.log('메뉴성공4',data);
									var menuDiv = $("<div>").attr({
										'class':'carousel-item active',	
										 								
									}).css({							
							      		'width':'700',					      		
							      		'margin-left':'20px',
							      		'margin-bottom':'20px'
									})
									
									for(let i=0;i<data.length;i++) {
										$(".menuView"+i).hide();
										
										let divTest = $("<div>");
										let div = $("<div>").attr({
											'class':'col menuList',								
											}).css({
												
												'height':'250',
												'margin-left':'20px',
												'padding':'0'
										});
									
											
											let menuImg = $("<img>").attr({									
												'class':'menuImg'
											}).css({
												'width':'100%',
												'height':'130',								
												
												})
												if(data[i].me_logImg !='null') {
													menuImg.attr({
														'src':'${path}/resources/upload/business/'+data[i].me_logImg,
													})
												}else{
													menuImg.attr({
														'src':'${path}/resources/upload/menu/noImg.png',
													})
												}
										
										
										let hidden = $("<input>").attr({
											'type':'hidden',
											'value':data[i].me_no,
											'class':'me_no'
										})
										let hidden2 = $("<input>").attr({
											'type':'hidden',
											'value':data[i].mt_no,
											'class':'mt_no'
										})
										

										
										let menuName = $("<span>").attr('class','menuName').html(data[i].me_name).css('font-weight','800');   								
										let menuPrice = $("<span>").attr('class','menuPrice').html(data[i].me_price+'원').css('color','orange');
										div.append(menuImg).append($("<br>")).append($("<br>")).append(menuName).append($("<br>")).append(menuPrice).append($("<br>")).append(hidden).append(hidden2);   							
										
										
										if(i<4) { 
										rowDiv.append(div);
										menuDiv.append(rowDiv);
										
										}else {
											if(i%4==0) {
												var rowDiv2 = $("<div>").attr('class','row row1');
												var menuDiv2 = $("<div>").attr({
													'class':'carousel-item ',	
													 								
												}).css({
													
													'width':'700',								      		
										      		'margin-left':'20px',
										      		'margin-bottom':'20px'
				
												})
											}
											rowDiv2.append(div);
											menuDiv2.append(rowDiv2);
										}
										$(".carousel-inner").append(menuDiv).append(menuDiv2);
									 
										
									}
									
									for(let i=0;i<data.length;i++) {

									 	for(let j=0;j<data.length;j++) {
									 		let divTest = $("<div>").attr('class','col-lg-6 menuCategory').css('margin-left','20');
											let divTest2 = $("<div>").attr('class','col-lg-5');
												
											let rowDev = $("<div>").attr({
												'class':'row',
												'onclick':'test();'
												});
						
													let menuImg = $("<img>").attr({									
												'class':'menuImg'
												}).css({
												'width':'50%',
												'height':'100',
												'margin-top':'10',
												'margin-left':'200'	
												
												})
												if(data[j].me_logImg !='null') {
													menuImg.attr({
														'src':'${path}/resources/upload/business/'+data[j].me_logImg,
													})
												}else{
													menuImg.attr({
														'src':'${path}/resources/upload/menu/noImg.png',
													})
												}
													
											let menuText = $("<input>").attr({
													'type':'text',
													'class':'menuText form-control',
													'value':data[j].me_text,
													'readonly':'true'
												}).css({'background-color':'white','width':'300px;'}).after($("<br>")); 
											let menuName = $("<input>").attr({
												'type':'text',
												'class':'menuName form-control',
												'value':data[j].me_name,
												'readonly':'true'
												}).css({'background-color':'white','width':'auto'}).after($("<br>")); 	
											
													let menuPrice = $("<input>").attr({
														'type':'number',
														'step':'1000',
														'class':'menuPrice form-control',
														'value':data[j].me_price,
														'readonly':'true'
												}).css({'background-color':'white','width':'auto','color':'red'}).after($("<br>")); 
											
											let me_no = $("<input>").attr({
												'type':'hidden',
												'name':'me_no',
												'value':data[j].me_no
											})
											
											let mt_no = $("<input>").attr({
												'type':'hidden',
												'name':'mt_no',
												'value':data[j].mt_no
											})
											
											let s_no = $("<input>").attr({
												'type':'hidden',
												'name':'s_no',
												'value':$("#store").val()
											})
											
											divTest.append(menuName).append(menuPrice).append(menuText).append(me_no).append(mt_no).append(s_no);
											divTest2.append(menuImg);
											rowDev.append(divTest).append(divTest2);
											rowDev.next($("<br>"));
										 if($(".mt_no"+i).val() == data[j].mt_no) {								
											 $(".menuView"+i).append(rowDev);							
										}else{
											continue;
										} 
										 
										} 
										 
									}
									
									}
								},error:function(error) {
									console.log('에러',error);
								}
			   			});
					}
				}); 
   		 console.log("들어왓니?");
   		
   		});
   		
   		function category() {

   			$(event.target).next().next().slideToggle(500);
   			console.log($(event.target).next().next());
   		}
   		function menuUpdate() {
   			$("#myModal2").modal('show');
   			$("#myModal1").modal('hide');  			
   			$("#menuUpdate").children().remove();
   			
   			let div = $("<div>");		
   			let prev2 =$(event.target).prev().prev().prev();
   			let prev3 =$(event.target).prev().prev().prev().prev();
   			console.log('이전div2',prev2);
   			console.log('이전div3',prev3);
   				prev2.find("input:eq(0)").remove();
   			
   			let copy2 = prev2.clone();
   			let copy3 = prev3.clone();
   		
		
   		 	let hide = $("<input>").attr({
   		 		'type':'hidden',
   		 		'name':'optionCount',
   		 		'value':$("#optionCount").val()
   		 	})
   			
   			
   			copy2.find('input').removeAttr('readonly').css({'border':'1px solid lightgray','text-align':'center','margin-left':'30px'});
   			copy2.find('textarea').removeAttr('readonly'); 
   			$.ajax({
   				url:"${path}/licensee/selectOption",
					data:{s_no:$("#store").val()},
					success:function(data) {
						console.log('데이터아ㅛ',data);
						let span = $("<span>").html("필수!!!!!!!!!").css({'font-weight':'800','display':'block','margin-bottom':'20'});
	   					let span1 = $("<span>").html("추가!!!!!!!!!").css({'font-weight':'800','display':'block','margin-bottom':'20','margin-top':'20'});
	   					if(data.length == 0) {
	   					span.html('필수옵션이 없습니다ㅠㅠ');
	   					span1.html('추가옵션이 없습니다ㅠㅠ');
	   					}else {
	   					div.append(span).append(span1).append(hide);
						for(let i=data.length-1;i>=0;i--) {
							if(data[i].sd_division=='Y'){
	   						let input = $("<input>").attr({
	   							'type':'checkbox',
	   							'value':data[i].sd_no,	
	   							'name':'sdNo',
	   							'id':'chck'+i,	
	   						}).css({
	   							
	   							'display':'inline',
	   							'margin-right':'100px;'
	   						})
	   						let label = $("<label>").attr({
	   							'for':'chck'+i,
	   						}).css({
	   							'width':'auto',
	   							'display':'inline',   							
	   						}).html(data[i].sd_name+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+data[i].sd_price+'원');
	   						
	   							span.after($("<br>")).after(label).after(input);
	   							
	   						}else {
	   							let input = $("<input>").attr({
		   							'type':'checkbox',
		   							'value':data[i].sd_no,	
		   							'name':'sdNo2',
		   							'id':'chck'+i,	
		   						}).css({
		   							
		   							'display':'inline',
		   							'margin-right':'100px;'
		   						})
		   						let label = $("<label>").attr({
		   							'for':'chck'+i,
		   						}).css({
		   							'width':'auto',
		   							'display':'inline',   							
		   						}).html(data[i].sd_name+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+data[i].sd_price+'원');
	   							
	   							span1.after($("<br>")).after(label).after(input);
	   						}	   						
	   					}
	   					}
	   					$.ajax({
	   						url:"${path}/licensee/selectCategory",
	   						data:{s_no:$("#store").val()},
	   						success:function(data) {
	   							console.log('카테고리요요요',data);
	   							let select = $("<select>").attr({
   									'id':'categoryList',
   									'class':'form-control',
   									'name':'cateUpdate'
   								});
	   							for(let i=0;i<data.length;i++) {
	   								let opt = $("<option>").attr({
	   									'for':'categoryList',
	   									'class':'form-control',
	   									'value':data[i].mt_no
	   								}).html(data[i].mt_name);
	   								select.append(opt);
	   							}
	   							select.css({
	   								'margin-top':'20',
	   								'margin-left':'30',
	   								'width':'auto',
	   								'color':'orange',
	   								'font-size':'20',
	   								'text-align':'center'
	   								});
	   							copy3.after(select);
	   						}
	   					})
					}
   				})
   							let file = $("<input>").attr({
   								'type':'file',
   								'class':'custom-file-input',
   								'id':'upFile',
   								'name':'upFile'
   							})
   							let label = $("<label>").attr({
   								'for':'upFile',
   								'class':'custom-file-label fileName'
   							}).css('margin-top','50').html('변경 할 메뉴 사진을 첨부해주세요.');
   			
   							let fileString = $("<input>").attr({
   								'type':'hidden',
   								'name':'oriFile',
   								'value':copy3.find('img').attr('src')
   									
   							});
   							
   						
   												
   			$("#menuUpdate").append(fileString).append(file).append(label).append(copy3).append(copy2).append(div);
   			$(".menuNames").focus();
   			
   			
   	   		$("#upFile").change(function(){
 				console.log($(event.target).next().next().find('img'));
   	   		let file = document.querySelector('#upFile');
   	   		let img = $(event.target).next().next().find('img');
			let fileList = file.files;
			console.log('업팔',fileList[0]);
			let reader = new FileReader();
			if(fileList[0]!=null) {
			
			reader.readAsDataURL(fileList[0]);
			 
			}
			
			reader.onload = function  () {       
				
				img.attr('src', reader.result);
				
			};
				
   	   			let fileValue = $("#upFile").val().split("\\");
   				let fileName = fileValue[fileValue.length-1]; 
   				
   				if(fileName.trim().length==0) {
   					$(".fileName").html('<strong>'+'변경 할 메뉴 사진을 첨부해주세요.'+'</strong>');
   				}else { 
   					$(".fileName").html(fileName);
   				}
   	   		})
   	   		
   	   		
   			
   		}
   		
   		
   		
   		function test() {
 			console.log('타겟?',$(event.target).parent().parent().parent().prev().val());
   			 $("#myModal1").modal('show'); 
   			 $(".modal-body1").children().remove();
    			
   			 let div1 = $("<div>");
   			 let div2 = $("<div>");
   			 let rowDev = $("<div>").attr({
				'class':'row',				
				});
				if($(event.target).parent().prop('class')=='col-lg-5') {
					var menuImg = $("<img>").attr({
				'src':$(event.target).parent().find('img').attr('src'),
				'class':'menuImg'
				}).css({
				'width':'100%',
				'height':'300'
				})
				
				var menuText = $("<textarea>").attr({					
					'class':'menuTexts form-control',
					'cols':'30',
					'rows':'2',
					'name':'me_text',
					
					'readonly':'true'
				}).html($(event.target).parent().parent().find('div:eq(0)').find('input:eq(2)').val()).css({'background-color':'white','width':'200;','text-align':'center'}).after($("<br>"));
			
				var menuName = $("<input>").attr({
					'type':'text',
					'class':'menuNames form-control',
					'value':$(event.target).parent().parent().find('div:eq(0)').find('input:eq(0)').val(),
					'name':'me_name',
					'readonly':'true'
					}).css({'background-color':'white','width':'auto','margin-left':'80','border':'none','font-weight':'700','font-size':'20px'}).after($("<br>")); 							
						
				var menuPrice = $("<input>").attr({
							'type':'number',
							'class':'menuPrices form-control',
							'step':'1000',
							'value':$(event.target).parent().parent().find('div:eq(0)').find('input:eq(1)').val(),
							'name':'me_price',
							'readonly':'true'
					}).css({'background-color':'white','width':'auto','color':'red','margin-left':'100','border':'none'}).after($("<br>")); 
				
				var me_no = $("<input>").attr({
					'type':'hidden',
					'name':'me_no',
					'value':$(event.target).parent().parent().find('div:eq(0)').find('input:eq(3)').val()
				})
				
				var mt_no = $("<input>").attr({
					'type':'hidden',
					'name':'mt_no',
					'value':$(event.target).parent().parent().find('div:eq(0)').find('input:eq(4)').val()
				})
				
				var s_no = $("<input>").attr({
					'type':'hidden',
					'name':'s_no',
					'value':$("#store").val()
				}); 
				var mt_name = $("<input>").attr({
					'type':'text',
					'class':'form-control',
					'value':$(event.target).parent().parent().parent().prev().prev().val()
				})
				
				}else if($(event.target).parent().prop('class')=='col-lg-6 menuCategory') {
					var menuImg = $("<img>").attr({
						'src':$(event.target).parent().parent().find('div:eq(1)').find('img').attr('src'),
						'class':'menuImg'
						}).css({
						'width':'100%',
						'height':'300'
						})
						
						var menuText = $("<textarea>").attr({					
								'class':'menuTexts form-control',
								'cols':'30',
								'rows':'2',
								'name':'me_text',
								
								'readonly':'true'
							}).html($(event.target).parent().parent().find('div:eq(0)').find('input:eq(2)').val()).css({'background-color':'white','width':'200;','text-align':'center'}).after($("<br>"));
						
						var menuName = $("<input>").attr({
							'type':'text',
							'class':'menuNames form-control',
							'value':$(event.target).parent().parent().find('div:eq(0)').find('input:eq(0)').val(),
							'name':'me_name',
							'readonly':'true'
							}).css({'background-color':'white','width':'auto','margin-left':'80','border':'none','font-weight':'700','font-size':'20px'}).after($("<br>")); 							
								
						var menuPrice = $("<input>").attr({
									'type':'number',
									'class':'menuPrices form-control',
									'step':'1000',
									'value':$(event.target).parent().parent().find('div:eq(0)').find('input:eq(1)').val(),
									'name':'me_price',
									'readonly':'true'
							}).css({'background-color':'white','width':'auto','color':'red','margin-left':'100','border':'none'}).after($("<br>")); 
						
						var me_no = $("<input>").attr({
							'type':'hidden',
							'name':'me_no',
							'value':$(event.target).parent().parent().find('div:eq(0)').find('input:eq(3)').val()
						})
						
						var mt_no = $("<input>").attr({
							'type':'hidden',
							'name':'mt_no',
							'value':$(event.target).parent().parent().find('div:eq(0)').find('input:eq(4)').val()
						})
						
						var s_no = $("<input>").attr({
							'type':'hidden',
							'name':'s_no',
							'value':$("#store").val()
						}) 
						var mt_name = $("<input>").attr({
							'type':'text',
							'class':'form-control',
							'value':$(event.target).parent().parent().parent().prev().prev().val()
						})
	
					}else {
						var menuImg = $("<img>").attr({
						'src':$(event.target).parent().find('div:eq(1)').find('img').attr('src'),
						'class':'menuImg'
						}).css({
						'width':'100%',
						'height':'300'
						})
						
						 var menuText = $("<textarea>").attr({					
								'class':'menuTexts form-control',
								'cols':'30',
								'rows':'2',
								'name':'me_text',
								
								'readonly':'true'
							}).html($(event.target).parent().find('div:eq(0)').find('input:eq(2)').val()).css({'background-color':'white','width':'200;','text-align':'center'}).after($("<br>"));
						
						var menuName = $("<input>").attr({
							'type':'text',
							'class':'menuNames form-control',
							'value':$(event.target).parent().find('div:eq(0)').find('input:eq(0)').val(),
							'name':'me_name',
							'readonly':'true'
							}).css({'background-color':'white','width':'auto','margin-left':'80','border':'none','font-weight':'700','font-size':'20px'}).after($("<br>")); 							
								
						var menuPrice = $("<input>").attr({
									'type':'number',
									'class':'menuPrices form-control',
									'step':'1000',
									'value':$(event.target).parent().find('div:eq(0)').find('input:eq(1)').val(),
									'name':'me_price',
									'readonly':'true'
							}).css({'background-color':'white','width':'auto','color':'red','margin-left':'100','border':'none'}).after($("<br>")); 
						
						var me_no = $("<input>").attr({
							'type':'hidden',
							'name':'me_no',
							'value':$(event.target).parent().find('div:eq(0)').find('input:eq(3)').val()
						})
						
						var mt_no = $("<input>").attr({
							'type':'hidden',
							'name':'mt_no',
							'value':$(event.target).parent().find('div:eq(0)').find('input:eq(4)').val()
						})
						
						var s_no = $("<input>").attr({
							'type':'hidden',
							'name':'s_no',
							'value':$("#store").val()
						}) 
						var mt_name = $("<input>").attr({
							'type':'text',
							'class':'form-control',
							'value':$(event.target).parent().parent().prev().prev().val()
						})
					
				}
			mt_name.css({
				'width':'auto',
				'font-size':'20',
				'text-align':'center',
				'color':'orange'
			})
   			 div1.append(menuImg);

			 div2.append($("<br>")).append(mt_name).append(menuName).append(menuPrice).append($("<br>")).append(menuText).append(me_no).append(mt_no).append(s_no).append($("<br>"));
			$(".modal-body1").append(div1).append(div2);
   	
			var num = 0;
			 switch($(event.target).parent().prop('class')){
			case 'col-lg-6 menuCategory' : num = $(event.target).parent().find('input:eq(3)').val();break;
			case 'col-lg-5' : num = $(event.target).parent().parent().find('div:eq(0)').find('input:eq(3)').val();break;
			case 'row' : num = $(event.target).parent().find('div:eq(0)').find('input:eq(3)').val();break;
				} 
			 console.log('넘넘',num);
			$.ajax({
   				url:'${path}/licensee/selectMenuSide',
   				data:{me_no:num,s_no:$("#store").val()},
   				success:function(data) {
   					console.log("메뉴옵션 성공!",data);
   					let div = $("<div>");
   					let span = $("<span>").html("필수!!!!!!!!!").css({'font-weight':'800','display':'block','margin-bottom':'20'});
   					let span1 = $("<span>").html("추가!!!!!!!!!").css({'font-weight':'800','display':'block','margin-bottom':'20','margin-top':'20'});
   					if(data.length == 0) {
   					span.html('필수옵션이 없습니다ㅠㅠ');
   					span1.html('추가옵션이 없습니다ㅠㅠ');
   					}
   					
						let hide = $("<input>").attr({
							'type':'hidden',
							'id':'optionCount'
						})
						if(data.length == 0) {
							hide.attr('value','0');
						}else {
							hide.attr('value','1');
						}
   					div.append(span).append(span1).append(hide);
   					for(let i=data.length-1;i>=0;i--) {
   						let roww = $("<div>").attr('class','row');
   						
   						
   						let input = $("<input>").attr({
   							'type':'checkbox',
   							'value':data[i].sd_no,
   							'checked':'true',
   							'disabled':'true',    							
   							'id':'chck'+i,	
   						}).css({
   							
   							'display':'inline',
   							'margin-left':'0',
   							'width':'auto'
   						})
   						let label = $("<label>").attr({
   							'for':'chck'+i,
   						}).css({
   							'width':'auto',
   													
   						}).html(data[i].sd_name+data[i].sd_price+'원');
   						

   						if(data[i].sd_division=='Y'){
   							span.after($("<br>")).after(label).after(input);
   							
   						}else {
   							span1.after($("<br>")).after(label).after(input);
   							
   						}
   						
   						
   					}
   						let btn = $("<input>").attr({
   							'type':'button',
   							'value':'수정할래요!!!!',
   							'class':'updateBtn',
   							'onclick':'menuUpdate();'
   						});
   					$(".modal-body1").append(div).append($("<br>")).append(btn);
   				}
   			})
			
   		}
   		
   
   			$("#store").on('change',function () {
   				
   				$("#categoryList").children().remove();
   				$(".carousel-inner").children().remove();

   				$.ajax({
					url:"${path}/licensee/selectCategory",
					data:{s_no:$("#store").val()},
					success:function(data) {
						console.log("카테고리성공",data);	
						for(let i=0;i<data.length;i++) {
							let cateSpan = $("<input>").attr({								
								'class':'form-control sss',
								'type':'text',
								'onclick':'category()',
								'value':data[i].mt_name,
								'readonly':'true'
								
							})
							let mtNo = $("<input>").attr({
								'type':'hidden',
								'class':'mt_no'+i,
								'value':data[i].mt_no
							})
							
							let menuDivs = $("<div>").attr({'class':'menuView'+i});
							
							$("#categoryList").append(cateSpan).append(mtNo).append(menuDivs);
							
						}
						$.ajax({
			   				url:"${path}/licensee/menuSelect",
								data:{s_no:$("#store").val()},
								success:function(data) {
									
									console.log('메뉴성공',data);
									let remove = $(".row1").children().remove();
									let modalDiv = $("<div>").attr('class','col-lg-12').css({'border':'1px solid black'});
									let rowDiv = $("<div>").attr('class','row row1')
									
									var menuDiv = $("<div>").attr({
										'class':'carousel-item active',	
										 								
									}).css({							
							      		'width':'700',					      		
							      		'margin-left':'20px',
							      		'margin-bottom':'20px'
									})
									
									for(let i=0;i<data.length;i++) {
										$(".menuView"+i).hide();
										console.log('i입니다',i%3);
										let divTest = $("<div>");
										let div = $("<div>").attr({
											'class':'col menuList',								
											}).css({
												'width':'150',
												'height':'250',
												'margin-left':'20px',
												'padding':'0'
										});
									
											
											let menuImg = $("<img>").attr({									
												'class':'menuImg'
											}).css({
												'width':'100%',
												'height':'130',								
												
												})
												if(data[i].me_logImg !='null') {
													menuImg.attr({
														'src':'${path}/resources/upload/business/'+data[i].me_logImg,
													})
												}else{
													menuImg.attr({
														'src':'${path}/resources/upload/menu/noImg.png',
													})
												}
										
										
										let hidden = $("<input>").attr({
											'type':'hidden',
											'value':data[i].me_no,
											'class':'me_no'
										})
										let hidden2 = $("<input>").attr({
											'type':'hidden',
											'value':data[i].mt_no,
											'class':'mt_no'
										})
										

										
										let menuName = $("<span>").attr('class','menuName').html(data[i].me_name).css('font-weight','800');   								
										let menuPrice = $("<span>").attr('class','menuPrice').html(data[i].me_price+'원').css('color','orange');
										div.append(menuImg).append($("<br>")).append($("<br>")).append(menuName).append($("<br>")).append(menuPrice).append($("<br>")).append(hidden).append(hidden2);   							
										
										
										if(i<4) { 
										rowDiv.append(div);
										menuDiv.append(rowDiv);
										console.log(menuDiv.find($(".menuList")).length);
										}else {
											if(i%4==0) {
												var rowDiv2 = $("<div>").attr('class','row row1');
												var menuDiv2 = $("<div>").attr({
													'class':'carousel-item ',	
													 								
												}).css({
													
													'width':'700',								      		
										      		'margin-left':'20px',
										      		'margin-bottom':'20px'
										      		
										      		
												})
											}
											rowDiv2.append(div);
											menuDiv2.append(rowDiv2);
										}
										$(".carousel-inner").append(menuDiv).append(menuDiv2);
									 
										
									}
									
									for(let i=0;i<data.length;i++) {
									
								
										
									 	for(let j=0;j<data.length;j++) {
									 		let divTest = $("<div>").attr('class','col-lg-6 menuCategory').css('margin-left','20');
											let divTest2 = $("<div>").attr('class','col-lg-5');
												
											let rowDev = $("<div>").attr({
												'class':'row',
												'onclick':'test();'
												});
						
													let menuImg = $("<img>").attr({									
												'class':'menuImg'
												}).css({
												'width':'50%',
												'height':'100',
												'margin-top':'10',
												'margin-left':'200'	
												
												})
												if(data[j].me_logImg !='null') {
													menuImg.attr({
														'src':'${path}/resources/upload/business/'+data[j].me_logImg,
													})
												}else{
													menuImg.attr({
														'src':'${path}/resources/upload/menu/noImg.png',
													})
												}
													
											let menuText = $("<input>").attr({
													'type':'text',
													'class':'menuText form-control',
													'value':data[j].me_text,
													'readonly':'true'
												}).css({'background-color':'white','width':'300px;'}).after($("<br>")); 
											let menuName = $("<input>").attr({
												'type':'text',
												'class':'menuName form-control',
												'value':data[j].me_name,
												'readonly':'true'
												}).css({'background-color':'white','width':'auto'}).after($("<br>")); 	
											
													let menuPrice = $("<input>").attr({
														'type':'number',
														'step':'1000',
														'class':'menuPrice form-control',
														'value':data[j].me_price,
														'readonly':'true'
												}).css({'background-color':'white','width':'auto','color':'red'}).after($("<br>")); 
											
											let me_no = $("<input>").attr({
												'type':'hidden',
												'name':'me_no',
												'value':data[j].me_no
											})
											
											let mt_no = $("<input>").attr({
												'type':'hidden',
												'name':'mt_no',
												'value':data[j].mt_no
											})
											
											let s_no = $("<input>").attr({
												'type':'hidden',
												'name':'s_no',
												'value':$("#store").val()
											})
											
											divTest.append(menuName).append(menuPrice).append(menuText).append(me_no).append(mt_no).append(s_no);
											divTest2.append(menuImg);
											rowDev.append(divTest).append(divTest2);
											rowDev.next($("<br>"));
										 if($(".mt_no"+i).val() == data[j].mt_no) {								
											 $(".menuView"+i).append(rowDev);							
										}else{
											continue;
										}
										 
										} 
										 
									}
									
								
								}
			   			})
					}
				}) 
				
   			
   			}) 
   			
   			
   			
   		
   				
   		
   			
 
   		</script>
   	</section>
   	<%@include file="../common/footer.jsp" %>