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
						         
						        <div class="modal-body" align=center>	
						        	<form action="${path }/licensee/optionEnroll" method="post">	         	
						          	<input style="width:100px;display:inline" type="text" id="plusOption2" name="sd_division" class="form-control" placeholder="필수/추가">
						          	<button type="button" class="btn btn-outline-success plus"  onclick="option();">옵션 추가</button>						     
						          	<br>
						          	<br>
						          	<div id="option1-container">
						          	</div>					          					          	
						          	<input style="width:100px;display:inline" type="text" id="plusOption2" name="e_option2" class="form-control" placeholder="필수/추가">        
						          	<button type="button" class="btn btn-outline-success plus1" onclick="option1();">옵션 추가</button> 					          	
						          	<br>
						          	<br>
						          	<div id="option2-container"></div>
						          	<button  type="submit" class="btn btn-outline-danger" >등록</button>		
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
						          <h4 class="modal-title">메뉴 등록</h4>
						        </div>
						        <div class="modal-body" align=center>		        
						        		<input type="text" placeholder="메뉴명" class="menu-name" name="menu-name">
						        		<input type="number" placeholder="메뉴가격" class="menu-price" name="menu-price">
						        		<textarea cols="40" rows="1" placeholder="메뉴간단설명" class="menu-detail" name="menu-detail"></textarea>
						        		<input type="file">	
						        		<input  type="hidden" value="" id="hid" >					         
						        		<br>	
						        		
						        	<button type="button" id="optionEnroll"class="btn btn-outline-danger" data-dismiss="modal" onclick="menu_enroll();">등록</button>			
						        </div>
						      </div>
						    </div>
						  </div>	
		<script>
					var num = 0;
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
					'class':'btn btn-outline-primary menuAdd'+num,
					'data-toggle':'modal',
					'data-target':'#myModal2',
					'alt':num,
					'onclick':'menuBtn('+num+');'
				})
				menuAdd.html('메뉴등록');
				$(".addCategory").append($("<br>"));
				$(".addCategory").append(category);
				$(".addCategory").append(menuAdd);
				num++;
			}
			function menuBtn(num) {
				$("#hid").val(num);
			}
			
			var tbl = $("<table>");
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
				td.append(text);
				td1.append(number);
				tr.append(td).append(td1);
				tbl.append(tr);
				$("#option1-container").append(tbl);			
			}
			var tbl2 = $("<table>");
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
				var texts = $("<input>").attr({
					'type':'text',
					'name':'sd_name2',
					'class':'form-control',
					'placeholder':'옵션 입력 해주세요'
					
				})
				var numbers = $("<input>").attr({
					'type':'number',
					'name':'sd_price2',
					'class':'form-control',
					'placeholder':'가격 입력 해주세요'
				})
				td.append(texts);
				td1.append(numbers);
				tr.append(td).append(td1);
				tbl2.append(tr);
				$("#option2-container").append(tbl2);					
			}
			function optionAdd() {
				var arr = [];
				var arr2 = [];
				var ess = document.getElementsByClassName("essential");
				var price = document.getElementsByClassName("price");
				 for(let i=0;i<ess.length;i++) {
					arr.push(ess[i].value);
					arr2.push(price[i].value);
				} 
				console.log(arr);
				console.log(ess.length);
				/* $.ajax({
					url:"${path}/licensee/optionEnroll",
					type:'POST',
					traditional:true,
					data:{
						'essential':arr,
						'price':arr2,	
					},
					success:function(data) {
						alert('성공');
					},error:function(data){
						alert('실패');
					}
				}) */
			}
			function menu_enroll() {
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
				var num = $("#hid").val();
				$(".menuAdd"+num).after(div);
				$(".menu-name").val("");
				$(".menu-price").val("");
				$(".menu-detail").val("");
			}
		
				
			


		</script>
    </section>
    
    <%@ include file="../common/footer.jsp" %>