<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
   <style>
	
	span#menu{
		cursor:pointer;
	}

	 div#main{
      	margin-left:200px;
      	margin-top:150px;
      }
      div.col-12{
      	height:600px;
      	width:900px;
      	border:1px solid black;
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
      margin-left:400px;
      }
      </style>
	<%@ include file="../common/header.jsp" %>
    <section style="width:1366px;">
 	<div class="container">
 		<div class="row">
 		<%@ include file="sideBar.jsp" %>
            <div class="col-lg-10" id="main">
                     <ul class="nav nav-tabs nav-justified">
                        <li class="nav-item">
                        	<a href="${path }/licensee/menuEnroll" class="list nav-link active">메뉴 등록</a>
                        </li>
                         <li class="nav-item">
                        	<a href="${path }/licensee/menuStatus" class="list nav-link">메뉴 관리</a>
                        </li>
                    </ul>
                    <br>                 

                    	<div class="col-12">
                    		<div class="addC">
                    	  <button type="button" class="btnC" onclick="addC();">카테고리 추가</button> 
                    	   <button type="button" class="btn btn-primary btnC1" data-toggle="modal" data-target="#myModal">추가옵션 등록</button>
                    	  <br>
                    	  </div>
                    	  <form action="#" align=center id="form">   
                    	  <div class="menu-container">
               				</div>           
                    	  </form>
                    	</div>
                    	

						
						  <div class="modal" id="myModal">
						    <div class="modal-dialog">
						      <div class="modal-content">
						        <div class="modal-header">
						          <h4 class="modal-title">추가옵션 등록</h4>
						          <button type="button" class="close" data-dismiss="modal">&times;</button>
						        </div>
						         <form action="${path }/test/test.do" method="post">
						        <div class="modal-body" align=center>						         	
						          	<select id="plusOption">
						          		<option for="plusOption" value="필수">필수</option>
						          	</select>
						          	<button type="button" class="btn btn-outline-success plus"  onclick="plusOptions();">옵션 추가</button>						     
						          	<br>
						          	<div id="option1-container">
						          	</div>				
						          	<select style=""id="plusOption">
						          		<option for="plusOption" value="선택">선택</option>
						          	</select>	         
						          	<button type="button" class="btn btn-outline-success plus1" onclick="plusOptions1();">옵션 추가</button> 					          	
						          	<br>
						          	<div id="option2-container"></div>	
						        	<button type="submit" class="btn btn-outline-danger" >등록</button>
						        </div>
						        </form>
						      </div>
						    </div>
						  </div>
						  
						  <div class="modal" id="myModal2">
						    <div class="modal-dialog">
						      <div class="modal-content">
						        <div class="modal-header">
						          <h4 class="modal-title">메뉴 등록</h4>
						        </div>
						        <div class="modal-body" align=center>						        
						        	<form>
						        		<input type="text" placeholder="메뉴명">
						        		<input type="number" placeholder="메뉴가격">
						        		<textarea cols="40" rows="1" placeholder="메뉴간단설명"></textarea>
						        		<input type="file">						         
						        		<br>	
						        	<button type="submit" class="btn btn-outline-danger" >등록</button>
						        	</form>
						        </div>
						      </div>
						    </div>
						  </div>					  
						</div>
                    </div>
            	</div>
		<script>
			function addC() {
				var category = $("<input>").attr({
					'type':'text',
					'placeholder':'카테고리를 입력하세요.',
					'id':'category'
				}).css({
					'margin-left':'350'
				})
				var btn = $("<button>").attr({
					'type':'button',
					'onclick':'plusC();'
				})
				btn.html('등록');
				$(".addC").append($("<br>"));
				$(".addC").append(category);
				$(".addC").append(btn);
				$(".btnC").hide();
				$(".btnC1").css('margin-left','380');
			}
			
			function plusC() {
				var span = $("<span>").attr({
					'name':'category',
					'id':'categorys'
				})//스팬 생성
				var category = $("#category").val();
				//카테고리 인풋
				var button = $("<button>").attr({
					'type':'button',
					
					
					'class':'btn btn-outline-primary btnC2',
					'data-toggle':'modal',
					'data-target':'#myModal2'
				}).css('margin-left','500')
				//메뉴등록 버튼
				
				span.html(category+"▼").css({
					'border':'1px solid black',
					'width':'100%',
					'display':'block',
					'cursor':'pointer'
					});
				button.html('메뉴등록');
				span.append(button);
				$(".menu-container").append(span);
				$("#category").val("");
			}
			function plusOptions() {
				var text = $("<input>").attr({
					'type':'text',
					'name':'essential',
				})
				var number = $("<input>").attr({
					'type':'number',
					'name':'price'
				});				
				$("#option1-container").append(text).append(number);				
			}
			function plusOptions1() {
				var texts = $("<input>").attr({
					'type':'text',
					'name':'plus'
				})
				var numbers = $("<input>").attr({
					'type':'number',
					'name':'price1'
				})
				$("#option2-container").append(texts).append(numbers);				
			}

		</script>
    </section>
    
    <%@ include file="../common/footer.jsp" %>