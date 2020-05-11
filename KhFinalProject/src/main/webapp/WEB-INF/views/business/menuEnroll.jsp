<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
   <style>
	

	 div#main{
      	margin-top:150px;
      }
      div.col-12{
      	width:900px;
      	height:968px;
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
      margin-left:300px;
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
                    	   <button type="button" class="btnC" onclick="addCategory();">카테고리 추가</button> 
                    	   <button type="button" class="btn btn-primary btnC1" data-toggle="modal" data-target="#myModal">추가옵션 등록</button>
                    		<form action="#" method="post" id="menu-container">
                    		<div class="addCategory">
                    	    </div>
                    	  </form>
                    	</div>                    				  
						</div>
                    </div>
            	</div> <!-- 컨테이너 -->
            		

						<!-- 추가옵션 등록 모달 -->
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
						          	<button type="button" class="btn btn-outline-success plus"  onclick="e_option();">옵션 추가</button>						     
						          	<br>
						          	<div id="option1-container">
						          	</div>				
						          	<select style=""id="plusOption">
						          		<option for="plusOption" value="선택">선택</option>
						          	</select>	         
						          	<button type="button" class="btn btn-outline-success plus1" onclick="a_option();">옵션 추가</button> 					          	
						          	<br>
						          	<div id="option2-container"></div>	
						        	<button type="submit" class="btn btn-outline-danger" >등록</button>
						        </div>
						        </form>
						      </div>
						    </div>
						  </div>
						  <!-- 메뉴등록 모달 -->
						  <div class="modal" id="myModal2">
						    <div class="modal-dialog">
						      <div class="modal-content">
						        <div class="modal-header">
						          <h4 class="modal-title">메뉴 등록</h4>
						        </div>
						        <div class="modal-body" align=center>						        
						        		<input type="text" placeholder="메뉴명" class="menu-name">
						        		<input type="number" placeholder="메뉴가격" class="menu-price">
						        		<textarea cols="40" rows="1" placeholder="메뉴간단설명" class="menu-detail"></textarea>
						        		<input type="file">	
						        		<input  type="hidden" value="" id="hid" >					         
						        		<br>	
						        	<button type="button" class="btn btn-outline-danger" data-dismiss="modal" onclick="menu_enroll();">등록</button>
						        </div>
						      </div>
						    </div>
						  </div>	
		<script>
			var num = 0;
			var nums = 0;
			var num2 =0;
			function addCategory() {
			
				var category = $("<input>").attr({
					'class':'category'+num,
					'name':'category',
					'placeholder':'카테고리를 입력해주세요.'
				}).css({
					'width':'400',
					'border':'1px soild black'
				})
				var menuAdd = $("<button>").attr({
					'type':'button',
					'class':'btn btn-outline-primary test'+num,
					'data-toggle':'modal',
					'data-target':'#myModal2',
					'onclick':'menuBtn();'
				})
				menuAdd.html('메뉴등록');
				$(".addCategory").append($("<br>"));
				$(".addCategory").append(category);
				$(".addCategory").append(menuAdd);
				menuBtn();
				num++;
			}
			function menuBtn() {
				
				 var vl = $(".category"+(num-1)).val();
				var s = $(".category"+(num-1));
				console.log(vl);
				var hid = $("#hid").val(vl);
				var name = $("input[value='+hid+']");
				$("input[value='+vl+']")
				var clas = name.prop('tagName');
				console.log('히드',clas);
				console.log('네임',name);
				console.log('네임2',s); 
				
			}
			
			function c_toption() {
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
			function a_option() {
				var texts = $("<input>").attr({
					'type':'text',
					'name':'plus'
				})
				var numbers = $("<input>").attr({
					'type':'number',
					'name':'price2'
				})
				$("#option2-container").append(texts).append(numbers);				
			}
			function menu_enroll() {
				console.log('등록모달1',num);
				var hid = $("#hid").val();
				var menuName = $(".menu-name").val();
				var menuPrice = $(".menu-price").val();
				var menuDetail = $(".menu-detail").val();
				var inputN = $("<input>").attr({
					'type':'text',
					'name':'menuName',
					'value':menuName
				})
				var inputP = $("<input>").attr({
					'type':'number',
					'name':'menuPrice',
					'value':menuPrice
				})
				var textD = $("<textarea>").attr({
					'cols':'20',
					'rows':'1',
					'name':'menuDetail',
				}).html(menuDetail);
				var div = $("<div>");
				div.append(inputN).append($("<br>"));
				div.append(inputP).append($("<br>"));
				div.append(textD).append($("<br>"));
				$(".category"+(num-1)).next().after(div);
			}


		</script>
    </section>
    
    <%@ include file="../common/footer.jsp" %>