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
	div#myModal1{
		height:auto;
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
						        <br>
						        <br>
						        <form id="form" action="${path }/licensee/menuUpdate" method="post" class="categoryForm"> 
						        	<div id="menuUpdate">
						        		
						        	</div>
						        	<button type="submit" class="btn btn-outline-success">등록합니다요!!!</button>
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
						
						for(let i=0;i<data.length;i++) {
							$(".menuView"+i).hide();
							console.log('i입니다',i%3);
							let divTest = $("<div>");
							let div = $("<div>").attr({
								'class':'col menuList',								
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
							let hidden2 = $("<input>").attr({
								'type':'hidden',
								'value':data[i].mt_no,
								'class':'mt_no'
							})
							

							let menuText = $("<span>").html(data[i].me_text);
							let menuName = $("<span>").attr('class','menuName').html(data[i].me_name);   								
							let menuPrice = $("<span>").attr('class','menuPrice').html(data[i].me_price+'원');
							div.append(menuImg).append($("<br>")).append($("<br>")).append(menuName).append($("<br>")).append(menuPrice).append($("<br>")).append(menuText).append(hidden).append(hidden2);   							
							
							
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
						
						for(let i=0;i<data.length;i++) {
						
					
							
						 	for(let j=0;j<data.length;j++) {
						 		let divTest = $("<div>").attr('class','col-lg-6');
								let divTest2 = $("<div>").attr('class','col-lg-6');
									
								let rowDev = $("<div>").attr({
									'class':'row',
									'onclick':'test();'
									});
									
								let menuImg = $("<img>").attr({
									'src':'${path}/resources/upload/business/'+data[j].me_logImg,
									'class':'menuImg'
									}).css({
									'width':'100%',
									'height':'100'
									})
								let menuText = $("<input>").attr({
										'type':'text',
										'class':'menuName form-control',
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
											'class':'menuName form-control',
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
   		})
   		
   		function category() {

   			$(event.target).next().next().slideToggle(500);
   		}
   		function menuUpdate() {
   			$("#myModal2").modal('show');
   			$("#myModal1").modal('hide'); 
   			$("#menuUpdate").children().remove();
   			console.log($(event.target).prev().prev());
   			let div = $("<div>")
   			let prev =$(event.target).prev();
   			let prev1 =$(event.target).prev().prev();
   			let prev2 =$(event.target).prev().prev().prev();
   			let copy = prev.clone();
   			let copy1 = prev1.clone();
   			let copy2 = prev2.clone();
   		
		
   			copy.find('input').removeAttr('disabled').removeAttr('checked');
   			copy1.find('input').removeAttr('readonly');
   			copy1.find('textarea').removeAttr('readonly');
   			
   			$("#menuUpdate").append(copy2).append(copy1).append(copy);
   			
   		}
   		
   		function test() {
 
   			 $("#myModal1").modal('show'); 
   			 $(".modal-body1").children().remove();
    			
   			 let div1 = $("<div>");
   			 let div2 = $("<div>");
   			 let rowDev = $("<div>").attr({
				'class':'row',				
				});
				
			let menuImg = $("<img>").attr({
				'src':$(event.target).parent().find('div:eq(1)').find('img').attr('src'),
				'class':'menuImg'
				}).css({
				'width':'100%',
				'height':'300'
				})
			 let menuText = $("<textarea>").attr({					
					'class':'menuName form-control',
					'cols':'30',
					'rows':'2',
					'name':'me_text',
					
					'readonly':'true'
				}).html($(event.target).parent().find('div:eq(0)').find('input:eq(2)').val()).css({'background-color':'white','width':'200;'}).after($("<br>"));
			
			let menuName = $("<input>").attr({
				'type':'text',
				'class':'menuName form-control',
				'value':$(event.target).parent().find('div:eq(0)').find('input:eq(0)').val(),
				'name':'me_name',
				'readonly':'true'
				}).css({'background-color':'white','width':'auto'}).after($("<br>")); 							
					
			let menuPrice = $("<input>").attr({
						'type':'number',
						'class':'menuName form-control',
						'value':$(event.target).parent().find('div:eq(0)').find('input:eq(1)').val(),
						'name':'me_price',
						'readonly':'true'
				}).css({'background-color':'white','width':'auto','color':'red'}).after($("<br>")); 
			
			let me_no = $("<input>").attr({
				'type':'hidden',
				'name':'me_no',
				'value':$(event.target).parent().find('div:eq(0)').find('input:eq(3)').val()
			})
			
			let mt_no = $("<input>").attr({
				'type':'hidden',
				'name':'mt_no',
				'value':$(event.target).parent().find('div:eq(0)').find('input:eq(4)').val()
			})
			
			let s_no = $("<input>").attr({
				'type':'hidden',
				'name':'s_no',
				'value':$("#store").val()
			}) 
   			 div1.append(menuImg);
			
			 div2.append($("<br>")).append(menuName).append(menuPrice).append($("<br>")).append(menuText).append(me_no).append(mt_no).append(s_no).append($("<br>"));
			$(".modal-body1").append(div1).append(div2);
   			
			
			$.ajax({
   				url:'${path}/licensee/selectMenuSide',
   				data:{me_no:$(event.target).parent().find('div:eq(0)').find('input:eq(3)').val(),s_no:$("#store").val()},
   				success:function(data) {
   					console.log("메뉴옵션 성공!",data);
   					let div = $("<div>");
   					let span = $("<span>").html("필수!!!!!!!!!").css('display','block');
   					let span1 = $("<span>").html("추가!!!!!!!!!").css('display','block');

   					div.append(span).append(span1);
   					for(let i=0;i<data.length;i++) {
   						let input = $("<input>").attr({
   							'type':'checkbox',
   							'value':data[i].sd_no,
   							'checked':'true',
   							'disabled':'true',  							
   							'id':'chck'+i,	
   						}).css({
   							
   							'display':'inline',
   							'margin-right':'50px;'
   						})
   						let label = $("<label>").attr({
   							'for':'chck'+i,
   						}).css({
   							'width':'auto',
   							'display':'inline'
   						}).html(data[i].sd_name+data[i].sd_price+'원');
   						
   						let sd_no = $("<input>").attr({
   							'type':'hidden',
   							'name':'sd_no',
   							'value':data[i].sd_no
   						})
   						if(data[i].sd_division=='Y'){
   							span.after($("<br>")).after(sd_no).after(label).after(input);
   						}else {
   							span1.after($("<br>")).after(sd_no).after(label).after(input);
   						}
   					}
   						let btn = $("<input>").attr({
   							'type':'button',
   							'value':'수정할래요!!!!',
   							'class':'btn btn-outline-warning',
   							'onclick':'menuUpdate();'
   						})
   					$(".modal-body1").append(div).append(btn);
   				}
   			})
			
   		}
   		
   	
   			$("#store").change(function () {
   				
   				$("#categoryList").children().remove();
   				
   				
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
   						for(let i=0;i<data.length;i++) {
   							$(".menuView"+i).hide();
 							let div = $("<div>").attr({
 								'class':'col menuList'
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
   							let hidden2 = $("<input>").attr({
   								'type':'hidden',
   								'value':data[i].mt_no,
   								'class':'mt_no'
   							})   							
   							let menuText = $("<span>").html(data[i].me_text);
   							let menuName = $("<span>").attr('class','menuName').html(data[i].me_name);   								
   							let menuPrice = $("<span>").attr('class','menuPrice').html(data[i].me_price+'원');
   							div.append(menuImg).append($("<br>")).append($("<br>")).append(menuName).append($("<br>")).append(menuPrice).append($("<br>")).append(menuText).append(hidden).append(hidden2);   							
   							
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
   						
							for(let i=0;i<data.length;i++) {
						 	for(let j=0;j<data.length;j++) {
						 		let divTest = $("<div>").attr('class','col-lg-6');
								let divTest2 = $("<div>").attr('class','col-lg-6');
								let rowDev = $("<div>").attr({
									'class':'row',
									'onclick':'test();'
									});
								let menuImg = $("<img>").attr({
									'src':'${path}/resources/upload/business/'+data[j].me_logImg,
									'class':'menuImg'
								}).css({
									'width':'100%',
									'height':'100'
								})
									let menuText = $("<input>").attr({
										'type':'text',
										'class':'menuName form-control',
										'value':data[j].me_text,
										'readonly':'true'
									}).css({'background-color':'white','width':'300px;'}); 
								let menuName = $("<input>").attr({
									'type':'text',
									'class':'menuName form-control',
									'value':data[j].me_name,
									'readonly':'true'
									}).css({'background-color':'white','width':'auto'}); 							
										let menuPrice = $("<input>").attr({
											'type':'number',
											'class':'menuName form-control',
											'value':data[j].me_price,
											'readonly':'true'
									}).css({'background-color':'white','width':'auto','color':'red'}); 
								
								
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
								
								divTest.append(menuName).append(menuPrice).append(menuText).append(me_no).append(mt_no).append(s_no)
								divTest2.append(menuImg);
								rowDev.append(divTest).append(divTest2);
							 if($(".mt_no"+i).val() == data[j].mt_no) {								
								 $(".menuView"+i).append(rowDev);							
							}else{
								continue;
							}
							 
							
   					
   					}
		}
		}
   				})
   			})
   			
   			
   			
   		
   				
   		
   			
 
   		</script>
   	</section>
   	<%@include file="../common/footer.jsp" %>