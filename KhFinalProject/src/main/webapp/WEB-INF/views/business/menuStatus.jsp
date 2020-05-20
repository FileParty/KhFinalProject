<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
   <style>

 	div#main{
      	margin-left:200px; 	
      	margin-top:150px;
      }
 
      div.row1 {
      	margin-left:30px;
      	margin-top:50px;
      }
      div.menuDiv div {
      width:100%;
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
	.xBtn {
		
	
	}


 
      </style>
	<%@include file="../common/header.jsp" %>
    <section style="width:1366px;height:auto;margin-bottom:400px;">
 	<div class="container" >
 		<div class="row">
 		<%@ include file="sideBar.jsp" %>
            <div class="col-lg-10" id="main">
                      <ul class="nav nav-tabs nav-justified">
                         <li class="nav-item">
                        	<a href="${path }/licensee/menuEnroll" class="list nav-link" onclick="storeNo();">메뉴 등록</a>
                        </li>
                         <li class="nav-item">
                        	<a href="${path }/licensee/menuStatus" class="list nav-link active">메뉴 관리</a>
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

					  <a style="background-color:gray;width:30px;"class="carousel-control-prev" href="#demo" data-slide="prev">
					    <span style="color:black;"class="carousel-control-prev-icon"></span>
					  </a>
					  <a style="background-color:gray;width:30px;"class="carousel-control-next" href="#demo" data-slide="next">
					    <span class="carousel-control-next-icon"></span>
					  </a>
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
						        <br>
						        <br>
						        <form id="form" action="#" method="post" class="categoryForm"> 
						        	<div id="menuUpdate">
						        		<div id="menuContent">
						        		</div>
						        		<div id="optionContent" class="custom-control custom-checkbox mb-3">
						        		<h3 class="fuck"> 필수</h3>
						        		<br>
						        		<h3 class="fuck1"> 선택</h3>
						        		</div>
						        	</div>
						        	<button type="submit">등록</button>
						        </form>
						        </div>					        
						      </div>
						    </div>
						  </div>
						  <div class="modal" id="myModal1">
						    <div class="modal-dialog">
						      <div class="modal-content">
						        <div class="modal-header1">
						          <h4 class="modal-title">메뉴 상세</h4>
						          <button type="button" class="close" data-dismiss="modal">&times;</button>
						        </div>				         
						        <div class="modal-body1" align=center>	
						        <button type="button"></button>
						        </div>					        
						      </div>
						    </div>
						  </div>
						  
   		<script>
   		$(function() {
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
							'border':'1px solid red',
				      		'width':'900',
				      		
				      		
						})
						
						for(let i=0;i<data.length;i++) {
							console.log('i입니다',i%3);
							
							let div = $("<div>").attr({
								'class':'col menuList',
								'data-toggle':'collapse', 
								'data-target':'.menuDetail',
								'onclick':'menuff();'
								}).css({
									'width':'100',
									'border':'1px solid orange',
									',margin-left':'50px',
									
									});
							let menuImg = $("<img>").attr({
								'src':'${path}/resources/upload/business/'+data[i].me_logImg,
								'class':'menuImg'
							}).css({
								'width':'240',
								'height':'100'
							})
							
							let hidden = $("<input>").attr({
								'type':'hidden',
								'value':data[i].me_no,
								'class':'me_no'
							})
							let menuText = $("<span>").html(data[i].me_text);
							let menuName = $("<span>").attr('class','menuName').html(data[i].me_name);   								
							let menuPrice = $("<span>").attr('class','menuPrice').html(data[i].me_price+'원');
							div.append(menuImg).append($("<br>")).append($("<br>")).append(menuName).append($("<br>")).append(menuPrice).append($("<br>")).append(menuText).append(hidden);   							
							
							if(i<3) { 
							rowDiv.append(div);
							menuDiv.append(rowDiv);
							}else {
								if(i%3==0) {
									var rowDiv2 = $("<div>").attr('class','row row1');
									var menuDiv2 = $("<div>").attr({
										'class':'carousel-item',	
										 								
									}).css({
										'border':'1px solid red',
							      		'width':'900',
							      		
							      		
									})
								}
								rowDiv2.append(div);
								menuDiv2.append(rowDiv2);
							}
							$(".menuDiv").append(menuDiv).append(menuDiv2);
							
						}
					
					}
   			})
   		})
   		function menuff() {
   			
   			   	$(".menuDetail").children().remove();
				let menuNo = $(event.target).find(".me_no").val();
				var cloneDiv = $(event.target).clone();
				console.log('복사',cloneDiv);
				var rowDiv = $("<div>").attr('class','row rowss menuDetail');
				var btn = $("<input>").attr({
						'type':'button',
						'class':'xBtn',
						'value':'x',
						'onclick':'close();'
					}).css({
						
						'margin-left':'15px',
						'display':'inline'
					})
  					$.ajax({
  						url:'${path}/licensee/selectMenuSide',
  					data:{
  						s_no:$("#store").val()
  						,me_no:menuNo
  						},
  						success:function(data) {
  							console.log('하하',data);
  							 var menuDetail = $("<div>").attr({
  								'class':'menuDetail'
  							}) 
							rowDiv.append(cloneDiv);
							 menuDetail.append(rowDiv); 
							var span = $("<span>").html('필수').css('display','block');
  							var span1 = $("<span>").html('추가').css('display','block');

								cloneDiv.append($("<br>")).append(span);
	  							cloneDiv.append($("<br>")).append(span1);
  							for(let i=0;i<data.length;i++) {
  							if(menuNo == data[i].me_no) {
  								
  								cloneDiv.css({
  	  								'width':'auto',
  	  								'height':'auto'
  	  							}).attr({'class':'col-lg-6 detail'}).removeAttr('data-toggle').removeAttr('data-target').removeAttr('onclick');
  							
  								cloneDiv.find('img').after(btn);
  								cloneDiv.find('img').css({
  									'width':'90%',					
  									'display':'inline',
  									'margin-top':'20px',
  									});
  								
  								var checkbox = $("<input>").attr({
  									'type':'checkbox',
  									'checked':'true',
  									'disabled':'true',
  									'name':'sd_name'
  								}).css('display','inline');
								var sdPrice = $("<span>").html(data[i].sd_price);
  								var sdName = $("<span>").css({'color':'red'}).html(data[i].sd_name);
  								
  								
  							if(data[i].sd_division == 'Y') {
  			 								
  								span.after(sdPrice).after(sdName).after(checkbox); 								
  							}else {
  	
  								span1.after(sdPrice).after(sdName).after(checkbox);
  							}
  							}
  							}
  							var updateBtn = $("<input>").attr({
									'type':'button',
									'value':'수정',
									'class':'upBtn btn btn-outline-warning',
									
									
								}).css('margin-left','auto');
								cloneDiv.append(updateBtn);  								
  							$(".detail").append(span).append(span1);
  							$("#demo").after(rowDiv);
  							
  							console.log($(".menuDetail").children().length);
  							
  							$(".xBtn").click(function() {
									
									$(event.target).parent().slideUp(1000);
  	  				   		});
  							
  							$(".upBtn").click(function() {
  								$("#myModal2").modal('show');
  								$("#menuContent").children().remove();
  								
							let nameInput = $("<input>").attr({
								'type':'text',
								'name':'me_name',
								'class':'form-control',
								'value':$(event.target).parent().find('span:eq(0)').html()
							}).css({'width':'auto','display':'inline'});
							
								let priceInput = $("<input>").attr({
								'type':'number',
								'name':'me_price',
								'class':'form-control',
								'value':$(event.target).parent().find('span:eq(1)').html().substring(0,4)
							}).css({'width':'auto','display':'inline'});
							let textMenu = $("<textarea>").attr({
								'cols':'30',
								'rows':'1',
								'name':'me_text',

								}).html($(event.target).parent().find('span:eq(2)').html());
								$("#text").val('gg');
							let mName = $("<span>").html('메뉴 명  ');
							let mPrice = $("<span>").html('메뉴 가격  ');
							let mDetail = $("<span>").html('메뉴 간단 설명  ');
							
							let imgg = $("<img>").attr({
								'src':$(event.target).parent().find('img').attr('src'),
								'width':'100%',
								'height':'300px'
							})
							
							$("#menuContent").append(imgg).append(mName).append(nameInput).append($("<br>")).append(mPrice).append(priceInput).append($("<br>")).append(mDetail).append(textMenu).append($("<br>"));
							$("#optionContent").children().remove();
							let spanss = $("<span>").attr('class','fuck').html('필수옵션!!!!');
							let spanss1 = $("<span>").attr('class','fuck1').html('선택옵션!!!!');
							$("#optionContent").append(spanss);
							$("#optionContent").append(spanss1);
						 	for(let i=0;i<data.length;i++) {
						 		let sPrice = $("<span>").html(data[i].sd_price);
						 		
						 		if(data[i].sd_division == 'Y') {
								console.log(data.length);
							let sCheck = $("<input>").attr({
  									'type':'checkbox',  									
  									'name':'sd_name',  									
  									
  								}).css('display','inline');
								
  								let sName = $("<span>").html(data[i].sd_name);		   							

  								spanss.after(sPrice).after(sName).after(sCheck).after($("<br>"));
  													
  							}else {
  								let sCheck = $("<input>").attr({
  									'type':'checkbox',  									
  									'name':'sd_name',  									
  									
  								}).css('display','inline');
  								let sName = $("<span>").html(data[i].sd_name);	
  								spanss1.after(sPrice).after(sName).after(sCheck).after($("<br>"));									
  							}
							}
  							})
  							}
  					
  					})
 
			}
   	
   			$("#store").change(function () {
   				$(".menuDetail").children().remove();
   				$.ajax({
   					url:"${path}/licensee/selectCategory",
   					data:{s_no:$("#store").val()},
   					success:function(data) {
   						console.log("카테고리성공",data);	
   					}
   				})
   				$.ajax({
   					url:"${path}/licensee/selectOption",
   					data:{s_no:$("#store").val()},
   					success:function(data) {
   						console.log("옵션성공",data);
   				
   						}
   						
   					
   				})
   				
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
								'border':'1px solid red',
					      		'width':'900',
					      		
					      		
							})
   						let option = $("<span>").html('필수옵션!!!!!');
   						let option1 = $("<span>").html('추가옵션!!!!!');
   						for(let i=0;i<data.length;i++) {
   							console.log('i입니다',i%3);
   							
   							
   							
 							let div = $("<div>").attr({
 								'class':'col menuList',
 								'data-toggle':'collapse', 
 								'data-target':'.menuDetail',
 								'onclick':'menuff();'
 								}).css({
 									'width':'100',
 									'border':'1px solid orange',
 									',margin-left':'50px',
 									
 									});
   							let menuImg = $("<img>").attr({
   								'src':'${path}/resources/upload/business/'+data[i].me_logImg,
   								'class':'menuImg'
   							}).css({
   								'width':'240',
   								'height':'100'
   							})
   							
   							let hidden = $("<input>").attr({
   								'type':'hidden',
   								'value':data[i].me_no,
   								'class':'me_no'
   							})
   							let menuText = $("<span>").html(data[i].me_text);
   							let menuName = $("<span>").attr('class','menuName').html(data[i].me_name);   								
   							let menuPrice = $("<span>").attr('class','menuPrice').html(data[i].me_price+'원');
   							div.append(menuImg).append($("<br>")).append($("<br>")).append(menuName).append($("<br>")).append(menuPrice).append($("<br>")).append(menuText).append(hidden);   							
   							
   							if(i<3) { 
   							rowDiv.append(div);
   							menuDiv.append(rowDiv);
   							}else {
   								if(i%3==0) {
   									var rowDiv2 = $("<div>").attr('class','row row1');
   									var menuDiv2 = $("<div>").attr({
   										'class':'carousel-item',	
   										 								
   									}).css({
   										'border':'1px solid red',
   							      		'width':'900',
   							      		
   							      		
   									})
   								}
   								rowDiv2.append(div);
   								menuDiv2.append(rowDiv2);
   							}
   							$(".menuDiv").append(menuDiv).append(menuDiv2);
	 	
   						}
   					
   					}
   				})
   			
   			})
   			
   		
   				
   		
   			
 
   		</script>
   	</section>
   	<%@include file="../common/footer.jsp" %>