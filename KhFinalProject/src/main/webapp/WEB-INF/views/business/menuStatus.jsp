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
            </div>
   		</div>
   		</div>
   			<div class="modal" id="myModal3">
						    <div class="modal-dialog">
						      <div class="modal-content">
						        <div class="modal-header">
						          <h4 class="modal-title">메뉴 수정</h4>
						          <button style="margin-left:180px;"class="btn btn-outline-dark"type="button" onclick="add();">추가</button>
						          <button type="button" class="close" data-dismiss="modal">&times;</button>
						        </div>
						         
						        <div class="modal-body" align=center>	
						        <form id="form" action="${path }/licensee/categoryEnroll" method="post" class="categoryForm"> 
						        	<button type="button" onclick="test2();">등록</button>
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
						  <p id="tt"></p>
						  <p id="tt1"></p>
   		<script>
   		
   		
   			$("#store").change(function () {
   				$.ajax({
   					url:"${path}/licensee/selectCategory",
   					data:{s_no:$("#store").val()},
   					success:function(data) {
   						console.log("카테고리성공",data);
   						let input = data[0].mt_no;
   						$("#pt").html(input);
   						
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
   						let rowDiv = $("<div>").attr('class','row row1');
   						for(let i=0;i<data.length;i++) {
   							let menuDiv = $("<div>").attr({
   								'class':'menuList'+i,	
   								 								
   							}).css({
   								'border':'1px solid black',
   					      		'width':'200px',
   					      		'height':'230px',
   					      		'margin-left':'20px'
   							});
   							let menuImg = $("<img>").attr({
   								'src':'${path}/resources/upload/business/'+data[i].me_logImg,
   							}).css({
   								'width':'200',
   								'height':'150'
   							})
   							let detailBtn = $("<input>").attr({
   								'type':'button',
   								'class':'detailBtn',
   								'value':'상세보기'
   							}).css({
   								'width':'auto',
   								'margin-left':'50'
   							})
   							let hidden = $("<input>").attr({
   								'type':'hidden',
   								'value':data[i].me_no,
   								'class':'me_no'
   							})
   						
   							let menuName = $("<span>").html(data[i].me_name);   								
   							let menuPrice = $("<span>").html(data[i].me_price+'원');
   							menuDiv.append(menuImg).append($("<br>")).append($("<br>")).append(menuName).append($("<br>")).append(menuPrice).append(detailBtn).append(hidden);   							
   							rowDiv.append(menuDiv);
   							$(".col-lg-10").find("select").after(rowDiv);	
   							 	
   						}
   						$(".detailBtn").click(function(event){
   		   					console.log($(event.target).next().val());
   		   					let menuNo = $(event.target).next().val();
   		   					$.ajax({
   		   						url:'${path}/licensee/selectMenuSide',
   		   					data:{
   		   						s_no:$("#store").val()
   		   						,me_no:menuNo
   		   						},
   		   						success:function(data) {
   		   							$("#optionDiv").children().remove();
   		   							console.log("성공",data);
   		   							let optionDiv = $("<div>").attr({
   		   								'id':'optionDiv'
   		   							});
		   							let span = $("<span>").html('필수');
   		   							let span1 = $("<span>").html('추가');
   		   							optionDiv.append(span).append(span1);
   		   							for(let i=0;i<data.length;i++) {
   		   							if(menuNo == data[i].me_no) {
	
   		   								var checkbox = $("<input>").attr({
   		   									'type':'checkbox',
   		   									'checked':'true',
   		   									'disabled':'true'
   		   								});
										
   		   								var sdName = $("<span>").css({'color':'red'}).html(data[i].sd_name);
   		   							
   		   							
   		   							if(data[i].sd_division =='Y') {
   	   		   							optionDiv.find(span).after(sdName).after(checkbox).after($("<br>"));
   		   							}else {
   		   							optionDiv.find(span1).after(sdName).after(checkbox).after($("<br>"));
   		   							}   		   							
   		   							}
   		   							}
   		   							}
   		   							
   		   					})

   		   			let st =	$(".modal-body1").children();
   		   			st.remove();
   		   				$("#myModal1").modal('show');
   		   				console.log(event.target.parentNode);
   		   				let div = event.target.parentNode.className;  				
   		   				let divClone = $("."+div).clone();
   		   				$(divClone).find("input").remove();
   		   				$(".modal-body1").append(divClone);
   		   			});
   					}
   				})
   			
   			})
   				
   		
   			
 
   		</script>
   	</section>
   	<%@include file="../common/footer.jsp" %>